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
	
	SetRandomSeed( hour, hour+1 )

	local snows1 = ( month == 12 ) and ( day >= 20 )
	local snows2 = ( month == 1 )
	local snows = (snows1 or snows2) and (Random() > 0.5)

	if (snows) then
		local num_particles = Random( 1, 4 )
		local vel = Random( 30, 60 )
		local draw_long = Random() > 0.5
		GameEmitRainParticles( num_particles, 1024, "snow", vel, vel + 20, false, draw_long )

		local world_state_entity = GameGetWorldStateEntity()
		edit_component( world_state_entity, "WorldStateComponent", function(comp,vars)
			vars.fog_target_extra = Random( 0.3, 0.6 )
			vars.rain_target_extra = math.max( vars.fog_target_extra, Random( 0.0, 1.0 ) )
		end)
	end
end

function OnWorldPreUpdate()
	update_weather()
end