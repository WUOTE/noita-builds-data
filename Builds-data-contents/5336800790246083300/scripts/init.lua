dofile_once( "data/scripts/lib/utilities.lua" )

--[[

-- function OnPlayerSpawned( player_entity )
-- function OnWorldInitialized()
-- function OnWorldPreUpdate()
-- function OnWorldPostUpdate()

]]--

-- this is implemented in a modular fashion to allow mods to override various functions in a modular manner

function update_weather()
	local year,month,day,hour,minute = GameGetDateAndTimeUTC()

	-- SetRandomSeed( hour, hour+1 ) -- some scripts use the random API incorrectly, without calling SetRandomSeed(), so we better not do that here (every frame), or otherwise those scripts may always get the same random sequence.. SetRandomSeed sets the seed globally for all lua scripts.
	local rx = hour+day
	local ry = hour+day+1

	local snow_chance = 0.5
	local rain_chance = 0.035
	local rain_frames = 4 * 60 * 60

	local snows1 = ( month == 12 ) and ( day >= 20 )
	local snows2 = ( month == 1 )
	local snows = (snows1 or snows2) and (ProceduralRandomf( rx, ry, 0.0, 1.0 ) < snow_chance)
	local rains = (not snows) and (ProceduralRandomf( 1, 2, 0.0, 1.0 ) < rain_chance) and (GameGetFrameNum() < rain_frames)

	if snows then
		local num_particles = ProceduralRandom( rx, ry+1, 1, 4 )
		local draw_long = ProceduralRandomf( rx, ry+3, 0.0, 1.0 ) > 0.5
		GameEmitRainParticles( num_particles, 1024, "snow", 30, 60, 10, false, draw_long )
	end
	
	if rains then
		GameEmitRainParticles( 3, 1024, "water", 200, 220, 200, true, true )
	end

	local world_state_entity = GameGetWorldStateEntity()
	edit_component( world_state_entity, "WorldStateComponent", function(comp,vars)
		if snows or rains then
			vars.fog_target_extra = ProceduralRandomf( rx, ry+4, 0.3, 0.6 )
			vars.rain_target_extra = math.max( vars.fog_target_extra, ProceduralRandomf( rx, ry+5, 0.0, 1.0 ) )
		else
			vars.fog_target_extra = 0.0
			vars.rain_target_extra = 0.0
		end
	end)
end

function OnWorldPreUpdate()
	update_weather()
end