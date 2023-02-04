dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/newgame_plus.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local doing_newgame_plus = false

-- stats & locations
local endpoint_underground = EntityGetWithTag( "ending_sampo_spot_underground" )
local endpoint_mountain = EntityGetWithTag( "ending_sampo_spot_mountain" )
local enemies_killed = tonumber( StatsGetValue("enemies_killed") )
local orb_count = GameGetOrbCountThisRun()

-- handle newgame+
-- if orb_count >= 5 and we're on top of the mountain
if( orb_count >= 5 and orb_count < 12 ) then
	local distance_from_mountain = 1000
	local distance_from_bottom = 1000

	if( #endpoint_mountain > 0 ) then
		local ex, ey = EntityGetTransform( endpoint_mountain[1] )
		distance_from_mountain = math.abs(x - ex) + math.abs(y - ey)
	end

	if ( distance_from_mountain < 32 ) then
		-- on top of mountain -> new game+
		GamePlaySound( "data/audio/Desktop/event_cues.snd", "event_cues/midas/create", x, y )
		EntityKill( entity_id )
		GameClearOrbsFoundThisRun()

		-- move player up 25 pixels, so they don't end up inside the ground at start
		local player_id = EntityGetClosestWithTag( x, y, "player_unit")
		if( player_id ~= nil and player_id ~= 0 ) then
			local px, py = EntityGetTransform( player_id )
			py = py - 25
			EntitySetTransform( player_id, px, py )
		end

		doing_newgame_plus = true
		do_newgame_plus()

	end
end

-- "normal ending handlings"
if( doing_newgame_plus == false ) then
	print("Sampo: " .. tostring(x) .. ", " .. tostring(y))

	GameAddFlagRun( "ending_game_completed" )	-- this affects the look of the game over screen
	GameOnCompleted() -- this does the achievement

	--SetTimeOut( 15.0, "data/entities/animals/boss_centipede/ending/sampo_show_ending_ui.lua", "main" )

	--EntityLoad("data/entities/particles/gold_pickup.xml", x, y)
	-- print("Enemies killed: " .. tostring(enemies_killed) )

	print(tostring(endpoint_underground))

	-- in reality requires 12 or more orbs
	if ( orb_count >= 11 ) then
		-- ORBS >= 11 ENDINGs
		-- on top -> new game+
		local distance_from_mountain = 1000

		if( #endpoint_mountain > 0 ) then
			local ex, ey = EntityGetTransform( endpoint_mountain[1] )
			distance_from_mountain = math.abs(x - ex) + math.abs(y - ey)
		end

		if ( distance_from_mountain < 32 ) then
			-- ending 2, everyone is happy
			EntityLoad( "data/entities/particles/image_emitters/magical_symbol_fast.xml", x, y )
			
			local player_id = EntityGetWithTag( "player_unit" )
			
			-- "progress_ending2"
			AddFlagPersistent( "progress_ending1" )
			GamePlaySound( "data/audio/Desktop/event_cues.snd", "event_cues/midas/create", x, y )

			GameDoEnding2()
			
			EntityKill( entity_id )

			GamePrintImportant( "$ending_above_part_a", "$ending_above_part_b" )
		end
		
	elseif ( #endpoint_underground > 0 ) then
		-- NORMAL ENDING
		local endpoint_id = endpoint_underground[1]
		local ex, ey = EntityGetTransform( endpoint_id )
		
		local distance = math.abs(x - ex) + math.abs(y - ey)
		
		if (distance < 32) then
			EntityLoad( "data/entities/particles/image_emitters/magical_symbol_fast.xml", x, y )
			
			AddFlagPersistent( "progress_ending0" )
			
			EntityLoad( "data/entities/animals/boss_centipede/ending/midas_sand.xml", x, y )
			EntityLoad( "data/entities/animals/boss_centipede/ending/midas_chunks.xml", x, y )
			EntityLoad( "data/entities/animals/boss_centipede/ending/midas_walls.xml", x, y )
			EntityLoad( "data/entities/animals/boss_centipede/sampo_working.xml", ex, ey - 30 )
			
			-- Note( Petri ): This is what kills the player
			-- if( enemies_killed > 0 ) then
			EntityLoad( "data/entities/animals/boss_centipede/ending/gold_effect.xml", x, y )
			-- end

			GamePlaySound( "data/audio/Desktop/event_cues.snd", "event_cues/midas/create", x, y )
			
			EntityKill( entity_id )
		end
		
		local machine = EntityGetWithTag("ending_mechanism")
		
		if ( #machine > 0 ) then
			print("Machineryfound, trying to animate")
			local machine_id = machine[1]
			local machine_sprite = EntityGetFirstComponent( machine_id, "SpriteComponent" )
			if ( machine_sprite ~= nil ) then
				ComponentSetValue( machine_sprite, "rect_animation", "active" )
			end
		end
	elseif ( #endpoint_mountain > 0 ) then
		-- SECRET ENDING
		local endpoint_id = endpoint_mountain[1]
		local ex, ey = EntityGetTransform( endpoint_id )
		
		local distance = math.abs(x - ex) + math.abs(y - ey)
		
		if (distance < 32) then
			EntityLoad( "data/entities/particles/image_emitters/magical_symbol_fast.xml", x, y )
			
			local player_id = EntityGetWithTag( "player_unit" )
			
			if ( #player_id > 0 ) then
				print(player_id[1])
				local midas_id = EntityLoad( "data/entities/animals/boss_centipede/ending/midas.xml", x, y )
				EntityAddChild( player_id[1], midas_id )
			end
			
			AddFlagPersistent( "progress_ending1" )
			
			EntityLoad( "data/entities/animals/boss_centipede/ending/midas_sand.xml", x, y )
			EntityLoad( "data/entities/animals/boss_centipede/ending/midas_chunks.xml", x, y )
			GamePlaySound( "data/audio/Desktop/event_cues.snd", "event_cues/midas/create", x, y )

			EntityKill( entity_id )

			-- this sets the INFINITE GOLD action
			local world_entity_id = GameGetWorldStateEntity()
			if( world_entity_id ~= nil ) then
				local comp_worldstate = EntityGetFirstComponent( world_entity_id, "WorldStateComponent" )
				if( comp_worldstate ~= nil ) then
					ComponentSetValue( comp_worldstate, "INFINITE_GOLD_HAPPENING", "1" )
				end
			end

		end
	end
end