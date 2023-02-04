-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biomes/mountain/mountain.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )

function spawn_wands( x, y ) end

function init( x, y, w, h )
	LoadPixelScene( "data/biome_impl/mountain_left_stub.png", "", x, y, "data/biome_impl/mountain_left_stub_background.png", true )
	LoadPixelScene( "data/biome_impl/mountain_left_entrance_below.png", "", x+512, y, "data/biome_impl/mountain_left_entrance_below_background.png", true )
end