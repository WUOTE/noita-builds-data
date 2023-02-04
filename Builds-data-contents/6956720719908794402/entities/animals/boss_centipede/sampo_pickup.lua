dofile( "data/scripts/lib/utilities.lua" )

function item_pickup( entity_item, entity_who_picked, name )

	GameTriggerMusicFadeOutAndDequeueAll( 10.0 )
	GamePlaySound( "data/audio/Desktop/event_cues.snd", "event_cues/sampo_pick/create", pos_x, pos_y )
	GameTriggerMusicEvent( "music/boss_arena/battle", false,  pos_x, pos_y )

	local x,y = EntityGetTransform( entity_item )
	SetRandomSeed( x, y )
	EntityLoad("data/entities/particles/image_emitters/chest_effect.xml", x, y)
	print("Sampo pickup: " .. tostring(x) .. ", " .. tostring(y))

	local entities = EntityGetWithTag( "sampo_or_boss" )
	if( entities == nil ) then
		print_error("boss - couldn't find sampo")
		return
	end

	local reference = EntityGetWithTag( "reference" )
		
	if( reference == nil ) then
		print_error("boss - couldn't find reference")
		return
	end
	
	local reference_id = reference[1]
	x,y = EntityGetTransform( reference_id )

	local enemies_killed = tonumber( StatsGetValue("enemies_killed") )

	local fight_player = true
	
	-- pacifist
	if( enemies_killed == 0 ) then 
		fight_player = false
		
		for key,entity_id in pairs(entities) do
			EntitySetComponentsWithTagEnabled( entity_id, "enabled_at_start", false )
		end
	end
	
	-- debug
	-- Note( Petri ): Boss should actually fight you all the time, since it's a more interesting problem for the player to 
	-- to do a complete pacifist run. Which I think is totally doable
	fight_player = true

	if( fight_player ) then
	
		for key,entity_id in pairs(entities) do
			EntitySetComponentsWithTagEnabled( entity_id, "disabled_at_start", true )
			EntitySetComponentsWithTagEnabled( entity_id, "enabled_at_start", false )
			PhysicsSetStatic( entity_id, false )

			if EntityHasTag( entity_id, "boss_centipede" ) then
				EntityAddTag( entity_id, "boss_centipede_active" )
			end
		end
		
		EntityLoad("data/entities/animals/boss_centipede/loose_lavaceiling.xml", x-235, y-124)
		EntityLoad("data/entities/animals/boss_centipede/loose_lavaceiling.xml", x+264, y-120)
		EntityLoad("data/entities/animals/boss_centipede/loose_lavabridge.xml", x-235, y+110)
		EntityLoad("data/entities/animals/boss_centipede/loose_lavabridge.xml", x+257, y+110)
		
		local player = EntityGetWithTag( "player_unit" )
		
		if( player == nil ) then
			print_error("boss - couldn't find player_unit")
			return
		end
		
		local player_id = player[1]
		x,y = EntityGetTransform( player_id )
		
		--local sampo_effect = EntityLoad("data/entities/animals/boss_centipede/ending/sampo_effect.xml", x, y)
		--EntityAddChild( player_id, sampo_effect )
	end

	if( fight_player == false ) then
		y = y + 50
		EntityLoad( "data/entities/buildings/teleport_ending_victory.xml", x, y )
	end

end