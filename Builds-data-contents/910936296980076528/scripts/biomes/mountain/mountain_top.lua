-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biomes/mountain/mountain.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )

function init( x, y, w, h )
	--LoadPixelScene( "data/biome_impl/mountain_right_bottom.png", "", x+512-192, y + 512, "", true )
	--LoadPixelScene( "data/biome_impl/mountain_left_bottom.png", "", x, y + 512, "", true )
	LoadPixelScene( "data/biome_impl/mountain_top.png", "", x, y, "", true )
end

function spawn_orb(x, y)
	EntityLoad( "data/entities/items/orbs/orb_00.xml", x, y )
end