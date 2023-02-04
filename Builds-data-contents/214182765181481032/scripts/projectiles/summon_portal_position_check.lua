dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local radius = 90

-- check if portal already exists
if #EntityGetInRadiusWithTag(pos_x, pos_y, radius * 2, "stable_portal") > 0 then return end

if #EntityGetInRadiusWithTag(pos_x, pos_y, radius, "summon_portal_target") > 0 then
	EntityLoad("data/entities/projectiles/deck/summon_portal_teleport.xml", pos_x, pos_y)
	GameTriggerMusicFadeOutAndDequeueAll( 3.0 )
	GameTriggerMusicEvent( "music/oneshot/dark_02", true, pos_x, pos_y )
end

