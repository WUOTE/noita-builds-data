dofile("data/scripts/magic/magic_utilities.lua")

-------------------

-- NOTE: this file is parsed with a simple parser to find spell function names. 
--       this file should only contain functions that map directly to actual spells.
--       any utility functions should be put to "magic_utilities.lua" or other files.

-------------------

function tutorial(x,y)
	convert_material( x, y, "rock_magic_gate", "sand" )
end

-------------------

function fog(x,y)
	-- GameSetFog(0.5) -- TODO: better implementation
end

-------------------

function rain_water(x,y)
	create_rain( "water", 60 * 60 * 3, 0.5, 250.0 )
end

function rain_snow(x,y)
	create_rain( "snow", 60 * 60 * 5, 0.25, 0.2, false )
end

function rain_blood(x,y)
	create_rain( "blood", 60 * 60, 0.4 )
end

function rain_oil(x,y)
	create_rain( "oil", 60 * 60 * 3, 0.5, 250.0 )
end

-------------------

function blizzard(x,y)
	create_rain( "snow", 60 * 60 * 1, 0.7, 150.0, true, 300.0 )
end

function sandstorm(x,y)
	create_rain( "sand", 60 * 60 * 1, 0.7, 150.0, true, 300.0 )
end

-------------------

function water_to_ice(x,y)
	convert_material( x, y, "water", "ice_static" )
	convert_material( x, y, "water_ice", "ice_static" )
	convert_material( x, y, "water_swamp", "ice_static" )
end

function water_to_blood(x,y)
	convert_material( x, y, "water", "blood" )
end

function concrete_to_gold(x,y)
	convert_material( x, y, "concrete_static", "gold" )
end

-------------------

function clean(x,y)
	convert_material( x, y, "blood", "", true )
	convert_material( x, y, "meat", "" )
end

-------------------

function season_winter(x,y)
	-- TODO: implement
end

function season_summer(x,y)
	-- TODO: implement
end

-------------------

function curse_wood_to_acid(x,y)
	convert_material( x, y, "wood", "acid" )
	convert_material( x, y, "wood_player", "acid" )
end

function curse_rain_radioactive_liquid(x,y)
	create_rain( "radioactive_liquid", 60 * 60, 0.4 )
end

function curse_rain_acid(x,y)
	create_rain( "acid", 60 * 60, 0.4 )
end

function curse_concrete_to_lava(x,y)
	convert_material( x, y, "concrete_static", "lava" )
end

function curse_concrete_to_acid(x,y)
	convert_material( x, y, "concrete_static", "acid" )
end

-------------------