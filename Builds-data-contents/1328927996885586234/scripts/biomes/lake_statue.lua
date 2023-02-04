-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xfff21df0, "load_building_stash" )
RegisterSpawnFunction( 0xffb4a00a, "spawn_fish" )
RegisterSpawnFunction( 0xffb40b76, "spawn_bigfish" )
RegisterSpawnFunction( 0xff3ae124, "spawn_small_animals" )
RegisterSpawnFunction( 0xff31d0b4, "spawn_essence" )

g_fish =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/fish.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
}

g_small_animals =
{
	total_prob = 0,
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 3,    
		entity 	= "data/entities/animals/deer.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 3,    
		entity 	= "data/entities/animals/duck.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/elk.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 2,
		max_count	= 5,    
		entity 	= "data/entities/animals/sheep.xml"
	},
	{
		prob   		= 0.05,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wolf.xml"
	},
}

g_lamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 0.7,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_lantern_small.xml"
	},
}

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function spawn_chest( x, y ) end
function spawn_blood( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_save( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_persistent_teleport( x, y ) end
function spawn_candles( x, y ) end

function init( x, y, w, h )
	--LoadPixelScene( "data/biome_impl/lake_statue.png", "", x, y, "", true )
end

function load_building_stash( x, y )
end

function spawn_orb(x, y)
	EntityLoad( "data/entities/items/orbs/orb_01.xml", x-16, y )
	EntityLoad( "data/entities/items/books/book_02.xml", x+16, y )
end

function spawn_bigfish(x,y)
	EntityLoad( "data/entities/animals/eel.xml", x, y )
end

function spawn_small_animals(x,y)
	spawn( g_small_animals, x, y )
end

function spawn_fish(x, y)
	spawn(g_fish,x,y)
end

function spawn_essence(x, y)
	EntityLoad( "data/entities/items/pickup/essence_fire.xml", x, y )
end