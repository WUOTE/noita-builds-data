dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()
local player_id = EntityGetRootEntity( entity_id )

local wand_id = find_the_wand_held( player_id )

local vx,vy = 0,0
local stuff = EntityGetFirstComponent( player_id, "VelocityComponent" )
if ( stuff ~= nil ) then
	vx,vy = ComponentGetValue2( stuff, "mVelocity" )
end

if ( wand_id ~= nil ) and ( wand_id ~= NULL_ENTITY ) then
	local x,y,dir = EntityGetTransform( wand_id )
	
	local comp = EntityGetFirstComponentIncludingDisabled( entity_id, "LaserEmitterComponent" )
	
	if ( comp ~= nil ) then
		ComponentSetValue2( comp, "is_emitting", true )
	end
	
	print( tostring( vx ) .. ", " .. tostring( vy ) )
	
	local ox = x + math.cos( 0 - dir ) * 6 + vx * 1.5
	local oy = y - math.sin( 0 - dir ) * 6 + vy * 1.5
	
	EntitySetTransform( entity_id, ox, oy + 0.5, dir )
else
	local comp = EntityGetFirstComponentIncludingDisabled( entity_id, "LaserEmitterComponent" )
	
	if ( comp ~= nil ) then
		ComponentSetValue2( comp, "is_emitting", false )
	end
end