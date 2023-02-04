dofile( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

print("Sampo: " .. tostring(x) .. ", " .. tostring(y))

GameAddFlagRun( "ending_game_completed" )	-- this affects the look of the game over screen
GameOnCompleted() -- this does the achievement
AutosaveDisable() -- so autosave can't be used to cheat the ending. Which was kinda cool, but you know...

--SetTimeOut( 15.0, "data/entities/animals/boss_centipede/ending/sampo_show_ending_ui.lua", "main" )

--EntityLoad("data/entities/particles/gold_pickup.xml", x, y)
local endpoint_underground = EntityGetWithTag( "ending_sampo_spot_underground" )
local endpoint_mountain = EntityGetWithTag( "ending_sampo_spot_mountain" )

local enemies_killed = tonumber( StatsGetValue("enemies_killed") )
print("Enemies killed: " .. tostring(enemies_killed) )

print(tostring(endpoint_underground))

if ( endpoint_underground ~= nil) then
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
	
	if (machine ~= nil) then
		print("Machineryfound, trying to animate")
		local machine_id = machine[1]
		local machine_sprite = EntityGetFirstComponent( machine_id, "SpriteComponent" )
		if ( machine_sprite ~= nil ) then
			ComponentSetValue( machine_sprite, "rect_animation", "active" )
		end
	end
elseif ( endpoint_mountain ~= nil) then
	-- SECRET ENDING


	local endpoint_id = endpoint_mountain[1]
	local ex, ey = EntityGetTransform( endpoint_id )
	
	local distance = math.abs(x - ex) + math.abs(y - ey)
	
	if (distance < 32) then
		EntityLoad( "data/entities/particles/image_emitters/magical_symbol_fast.xml", x, y )
		
		local player_id = EntityGetWithTag( "player_unit" )
		
		if (player_id ~= nil) then
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