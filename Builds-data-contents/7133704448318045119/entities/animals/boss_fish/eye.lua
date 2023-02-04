dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local pcomp = 0
local scomp = 0
local timer = 0

local c = EntityGetComponent( entity_id, "VariableStorageComponent" )
if ( c ~= nil ) then
	for i,v in ipairs( c ) do
		local n = ComponentGetValue2( v, "name" )
		if ( n == "phase_timer" ) then
			timer = ComponentGetValue2( v, "value_int" )
			pcomp = v
		end
	end
end

if ( pcomp ~= 0 ) then
	timer = timer + 1
	
	local p = EntityGetInRadiusWithTag( x, y, 160, "player_unit" )
	local eye = EntityGetFirstComponent( entity_id, "SpriteComponent" )
	if ( eye ~= nil ) then
		local current = ComponentGetValue2( eye, "rect_animation" )
		
		if ( #current == 0 ) then
			ComponentSetValue2( eye, "rect_animation", "closed" )
		end
		
		if ( #p == 0 ) then
			if ( current == "opened" ) then
				ComponentSetValue2( eye, "rect_animation", "close" )
				ComponentSetValue2( eye, "next_rect_animation", "closed" )
				timer = 0
			elseif ( current == "close" ) and ( timer > 36 ) then
				ComponentSetValue2( eye, "rect_animation", "closed" )
				ComponentSetValue2( eye, "next_rect_animation", "closed" )
				timer = 0
			end
		else
			if ( current == "closed" ) then
				ComponentSetValue2( eye, "rect_animation", "open" )
				ComponentSetValue2( eye, "next_rect_animation", "opened" )
				timer = 0
			elseif ( current == "open" ) and ( timer > 36 ) then
				ComponentSetValue2( eye, "rect_animation", "opened" )
				ComponentSetValue2( eye, "next_rect_animation", "opened" )
				timer = 0
			end
		end
	end

	ComponentSetValue2( pcomp, "value_int", timer )
end