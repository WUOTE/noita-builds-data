dofile( "data/scripts/lib/utilities.lua" )

function collision_trigger()
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	print("Boss buildup music triggered")

	-- this reset the biome stats - see workshop_trigger_check_stats.lua
	StatsBiomeReset()

	GameTriggerMusicEvent( "music/boss_arena/buildup", true,  pos_x, pos_y )
end