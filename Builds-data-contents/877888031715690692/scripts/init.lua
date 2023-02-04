dofile_once( "data/scripts/lib/utilities.lua" )

--[[
-- function OnPlayerSpawned( player_entity )
-- function OnWorldInitialized()
-- function OnWorldPreUpdate()
-- function OnWorldPostUpdate()
]]--


-- weather config

local snowfall_chance = 0.5
local rainfall_chance = 0.035
local rain_duration_on_run_start = 4 * 60 * 60

local RAIN_TYPE_NONE = 0
local RAIN_TYPE_SNOW = 1
local RAIN_TYPE_LIQUID = 2

local snow_types =
{
	{
		chance = 1.0,
		rain_material = "snow",
		rain_particles_min = 1,
		rain_particles_max = 4,
		rain_duration = -1,
		rain_draw_long_chance = 0.5,
		rain_type = RAIN_TYPE_SNOW,
	},
}

local rain_types =
{
	{
		chance = 1.0, -- light rain
		rain_material = "water",
		rain_particles_min = 4,
		rain_particles_max = 7,
		rain_duration = rain_duration_on_run_start,
		rain_draw_long_chance = 1.0,
		rain_type = RAIN_TYPE_LIQUID,
	},
	{

		chance = 0.05, -- heavy rain
		rain_material = "water",
		rain_particles_min = 10,
		rain_particles_max = 15,
		rain_duration = rain_duration_on_run_start / 2,
		rain_draw_long_chance = 1.0,
		rain_type = RAIN_TYPE_LIQUID,
	},
	{
		chance = 0.001,
		rain_material = "blood",
		rain_particles_min = 10,
		rain_particles_max = 15,
		rain_duration = rain_duration_on_run_start / 2,
		rain_draw_long_chance = 1.0,
		rain_type = RAIN_TYPE_LIQUID,
	},
	{
		chance = 0.0002,
		rain_material = "acid",
		rain_particles_min = 10,
		rain_particles_max = 15,
		rain_draw_long_chance = 1.0,
		rain_duration = rain_duration_on_run_start / 2,
		rain_type = RAIN_TYPE_LIQUID,
	},
	{
		chance = 0.0001,
		rain_material = "slime",
		rain_particles_min = 1,
		rain_particles_max = 4,
		rain_draw_long_chance = 1.0,
		rain_duration = rain_duration_on_run_start / 2,
		rain_type = RAIN_TYPE_LIQUID,
	},
}

-- weather impl

local weather = nil

function pick_random_from_table_backwards( t, rx, ry )
	local result = nil
	local len = #t

	for i=len,1, -1 do
		if ProceduralRandom( rx, ry+4908+i, 0.0, 1.0 ) <= t[i].chance then
			result = t[i]
			break
		end
	end

	if result == nil then
		result = t[1]
	end

	return result
end

function init_weather( year, month, day, hour, minute )
	local rx = hour+day
	local ry = hour+day+1

	-- pick weather type
	local snows1 = ( month == 12 ) and ( day >= 20 )
	local snows2 = ( month == 1 )
	local snows = (snows1 or snows2) and (ProceduralRandomf( rx, ry, 0.0, 1.0 ) <= snowfall_chance) -- snow is based on real world time
	local rains = (not snows) and (ProceduralRandomf( 1, 2, 0.0, 1.0 ) <= rainfall_chance) 			-- rain is based on world seed

	weather = { }
	local rain_type = RAIN_TYPE_NONE
	if snows then
		rain_type = RAIN_TYPE_SNOW
		weather = pick_random_from_table_backwards( snow_types, rx, ry )
	end
	if rains then
		rain_type = RAIN_TYPE_LIQUID
		weather = pick_random_from_table_backwards( rain_types, rx, ry )
	end

	-- init weather struct
	weather.hour = hour
	weather.day = day
	weather.rain_type = rain_type

	-- make it foggy and cloudy if stuff is falling from the sky, randomize rain type
	if weather.rain_type == RAIN_TYPE_NONE then
		weather.fog = 0.0
		weather.clouds = 0.0
	else
		weather.fog = ProceduralRandomf( rx, ry+3, 0.3, 0.85 )
		weather.clouds = math.max( weather.fog, ProceduralRandomf( rx, ry+4, 0.0, 1.0 ) )
		weather.rain_draw_long = ProceduralRandomf( rx, ry+1, 0.0, 1.0 ) <= weather.rain_draw_long_chance
		weather.rain_particles = ProceduralRandom( rx, ry+2, weather.rain_particles_min, weather.rain_particles_max )
	end

	-- set world state
	local world_state_entity = GameGetWorldStateEntity()
	edit_component( world_state_entity, "WorldStateComponent", function(comp,vars)
		vars.fog_target_extra = weather.fog
		vars.rain_target_extra = weather.clouds
	end)
end

function update_weather()
	local year,month,day,hour,minute = GameGetDateAndTimeUTC()

	-- SetRandomSeed( hour, hour+1 ) -- some scripts use the random API incorrectly, without calling SetRandomSeed(), so we better not do that here (every frame), or otherwise those scripts may always get the same random sequence.. SetRandomSeed sets the seed globally for all lua scripts.
	if weather == nil or weather.hour ~= hour or weather.day ~= day then
		init_weather( year, month, day, hour, minute )
	end

	if weather.rain_type == RAIN_TYPE_SNOW then
		GameEmitRainParticles( weather.rain_particles, 1024, weather.rain_material, 30, 60, 10, false, weather.rain_draw_long )
	end
	
	if weather.rain_type == RAIN_TYPE_LIQUID and (GameGetFrameNum() < weather.rain_duration) then
		GameEmitRainParticles( weather.rain_particles, 1024, weather.rain_material, 200, 220, 200, true, weather.rain_draw_long )
	end
end

function OnWorldPreUpdate()
	update_weather()
end