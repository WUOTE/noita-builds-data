dofile( "data/scripts/lib/utilities.lua" )

function collision_trigger()
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )

	-- this reset the biome stats - see workshop_trigger_check_stats.lua
	StatsBiomeReset()

	EntityLoad("data/entities/misc/workshop_collapse.xml", pos_x-112, pos_y+82)
	EntityLoad("data/entities/misc/workshop_areadamage.xml", pos_x-111, pos_y+47)
	EntityLoad("data/entities/misc/workshop_areadamage.xml", pos_x-511, pos_y+47)
	
	-- Destroy workshop entities
	
	local workshop_1 = EntityGetClosestWithTag( pos_x, pos_y, "workshop" )
	EntityKill( workshop_1 );
	--print("Destroyed workshop entity 2")
	
	local workshop_2 = EntityGetClosestWithTag( pos_x, pos_y, "workshop" )
	EntityKill( workshop_2 );
	--print("Destroyed workshop entity 2")
	
	local workshop_2b = EntityGetClosestWithTag( pos_x, pos_y, "workshop" )
	EntityKill( workshop_2b );
	--print("Destroyed workshop entity 2b")

	local workshop_3 = EntityGetClosestWithTag( pos_x, pos_y, "workshop_show_hint" )
	EntityKill( workshop_3 );
	--print("Destroyed workshop hint entity")

	GameTriggerMusicFadeOutAndDequeueAll( 2.0 )
	GamePlaySound( "data/audio/Desktop/misc.snd", "misc/temple_collapse", pos_x-112, pos_y + 40 )
end