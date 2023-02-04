dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local comps = EntityGetComponent( entity_id, "VariableStorageComponent" )
local target = 0

if ( comps ~= nil ) then
	for i,v in ipairs( comps ) do
		local n = ComponentGetValue2( v, "name" )
		if ( n == "target" ) then
			target = ComponentGetValue2( v, "value_int" )
			break
		end
	end
end

if ( target ~= nil ) and ( target ~= NULL_ENTITY ) then
	local c = EntityGetAllChildren( target )
	
	EntitySetTransform( target, x, y )
	EntityApplyTransform( target, x, y )
	
	--[[
	if ( c ~= nil ) then
		for i,v in ipairs( c ) do
			if ( EntityHasTag( v, "coward_effect" ) then
				EntityKill( v )
			end
		end
	end
	]]--
end