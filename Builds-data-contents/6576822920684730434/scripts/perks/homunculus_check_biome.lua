dofile( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local comps = EntityGetComponent( entity_id, "VariableStorageComponent" )
local biome = BiomeMapGetName( pos_x, pos_y )
local depth = math.floor( pos_y / 512 )
local depth_remainder = pos_y - depth * 512
local old_depth = 0
local status = 0

local timer = 0

local scomp,dcomp,tcomp

if ( comps ~= nil ) then
	for i,comp in ipairs( comps ) do
		local name = ComponentGetValue2( comp, "name" )
		if ( name == "status" ) then
			status = ComponentGetValue2( comp, "value_int" )
			scomp = comp
		elseif ( name == "latest_depth" ) then
			old_depth = ComponentGetValue2( comp, "value_int" )
			dcomp = comp
		end
	end
end

print( biome .. ", " .. tostring(status) .. ", " .. tostring(timer) .. ", " .. tostring(depth_remainder) )

if ( status == 0 ) then
	if ( string.find( biome, "holymountain" ) == nil ) and ( string.find( biome, "victoryroom" ) == nil ) then
		status = 1
		EntityLoad( "data/entities/misc/homunculus.xml", pos_x, pos_y )
		EntityLoad( "data/entities/particles/swarm_poof.xml", pos_x, pos_y )
		GamePrint( "$log_homunculus" )
	end
elseif ( status >= 1 ) then
	if ( ( string.find( biome, "holymountain" ) ~= nil ) or ( string.find( biome, "victoryroom" ) ~= nil ) ) and ( old_depth < depth ) and ( depth_remainder > 150 ) then		
		old_depth = math.max( old_depth, depth )
		status = 0
	end
end

if ( scomp ~= nil ) then
	ComponentSetValue2( scomp, "value_int", status )
end

if ( dcomp ~= nil ) then
	ComponentSetValue2( dcomp, "value_int", old_depth )
end