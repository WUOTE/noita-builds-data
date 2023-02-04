dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/lib/coroutines.lua" )

-- constants --
debug_rain_often = false
debug_rain_never = true

-- state --
state = 0 -- 0 = none, 1 = rain, 2 = thunderstorm, 3 = blood rain
doomsday = false

-- helpers --

function do_distant_lightning_sound()
	-- TODO: implement
end

function do_lightning()
	local x,y = GameGetCameraPos()
	
	if y < 1000 then -- don't do lightnings if we're deep underground
		x = x + math.random(-200,200)
		y = -750

		local entity_id = EntityLoad( "data/entities/projectiles/lightning.xml", x, y )
		local vel_x = 0
		local vel_y = y + 100000;

		local comp_ids = EntityGetComponent( entity_id, "ProjectileComponent" )

		-- this doesn't work...
		if( comp_ids ~= nil ) then
			-- ComponentSetValue( comp_ids[1], "velocity_x", vel_x )
			-- ComponentSetValue( comp_ids[1], "velocity_y", vel_y )
		end
	end
end


-- state functions --

function default()
	print("weather - clear")
	GameSetStorm(0.0)
	if debug_rain_often then
		wait(60)
		if math.random(0,1) == 0 then -- 1/5 chance of rain
			state = 1 -- rain
		elseif doomsday and math.random(0,2) == 0 then -- small chance of blood rain
			state = 3 -- blood rain
		end
	else
		wait(60 * 20)
		if math.random(0,4) == 0 then -- 1/5 chance of rain
			state = 1 -- rain
		elseif doomsday and math.random(0,20) == 0 then -- small chance of blood rain
			state = 3 -- blood rain
		end
	end
end 

function rain()
	print("weather - rain")
	GameSetStormMaterial("water")
	GameSetStorm(0.2)
	wait(60)
	GameSetStorm(math.random(0.4, 0.6))
	wait(720)
	if math.random(0,4) == 0 then -- 1/5 chance of a thunderstorm if it rains
		state = 2 -- thunderstorm
	else
		state = math.random(0,1) -- rain or clear
	end
end

function thunderstorm()
	print("weather - thunderstorm")
	do_distant_lightning_sound()
	-- smooth fade in
	GameSetStorm(0.75)
	wait(120)
	GameSetStorm(0.85)
	wait(120)
	-- the actual storm
	GameSetStorm(1.0)
	local lightning_count = math.random(5,15)
	for i=1,lightning_count do
		do_lightning()
		wait(math.random(60 * 4, 60 * 10))
	end
	-- smooth fade off
	GameSetStorm(0.85)
	wait(120)
	GameSetStorm(0.75)
	wait(120)
	GameSetStorm(0.5)
	wait(120)
	GameSetStorm(0.25)
	wait(120)
	state = 0 -- a thunderstorm always ends with clear weather
end 

function rain_blood()
	print("weather - blood rain")
	GameSetStormMaterial("blood_fading")
	GameSetStorm(0.2)
	wait(60)
	GameSetStorm(math.random(0.8, 1.0))
	wait(720)
	state = 0 -- blood rain always ends with clear weather
end 

-- /////////////////////////////////////////////////////////// --

print("Initialized random weather")
-- TODO: rewrite

-- fog
--async(function ()
--		while true do
--			local fog
--			if rand(1,10) == 1 then
--				fog = rand( 0.3, 0.5 )
--			else
--				fog = 0
--			end
--
--			GameSetFog( fog )
--
--			print( "fog " .. fog )
--			wait( rand( 30, 180 ) * 60 )
--		end
--	end)
--
--if( debug_rain_never == false ) then
--	-- rain
--	async(function ()
--		while true do
--
--			-- normal states
--			if state == 0 then
--				default()
--			elseif state == 1 then
--				rain()
--			elseif state == 2 then
--				thunderstorm();
--			-- special states
--			elseif state == 3 then
--				rain_blood()
--			end
--
--		end
--	end)
--end