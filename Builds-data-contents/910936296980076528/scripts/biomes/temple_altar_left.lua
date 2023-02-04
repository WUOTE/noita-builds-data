-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")
dofile( "data/scripts/items/generate_shop_item.lua" )
dofile( "data/scripts/biomes/temple_shared.lua" )

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff6d934c, "spawn_hp" )
RegisterSpawnFunction( 0xff33934c, "spawn_shopitem" )
RegisterSpawnFunction( 0xff33935F, "spawn_cheap_shopitem" )
RegisterSpawnFunction( 0xff10822d, "spawn_workshop" )
RegisterSpawnFunction( 0xffFAABBA, "spawn_motordoor" )
RegisterSpawnFunction( 0xffFAABBB, "spawn_pressureplate" )
RegisterSpawnFunction( 0xffFF5A0A, "spawn_music_trigger" )
RegisterSpawnFunction( 0xff667e0a, "spawn_duplicator" )
RegisterSpawnFunction( 0xff03DEAD, "spawn_areachecks" )

g_lamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.1,
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

g_fish =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 4,    
		entity 	= "data/entities/animals/fish.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
}

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_candles( x, y ) end
function spawn_potions( x, y ) end

function init( x, y, w, h )
	temple_random( x, y )
	
	LoadPixelScene( "data/biome_impl/temple_wall_top.png", "", x, y-30, "data/biome_impl/temple_wall_top_background.png", true )
	
	LoadPixelScene( "data/biome_impl/temple_altar_top.png", "", x, y-40, "", true )
	LoadPixelScene( "data/biome_impl/temple_altar_left.png", "data/biome_impl/temple_altar_left_visual.png", x, y-40+300, "data/biome_impl/temple_altar_left_background.png", true )
end

function spawn_hp( x, y )
	EntityLoad( "data/entities/items/pickup/heart_fullhp_temple.xml", x-16, y )
	EntityLoad( "data/entities/items/pickup/heart_refresh.xml", x+16, y )
end

function spawn_shopitem( x, y )
	-- EntityLoad( "data/entities/items/shop_item.xml", x, y )
	generate_shop_item( x, y, false )
end

function spawn_cheap_shopitem( x, y )
	-- EntityLoad( "data/entities/items/shop_item.xml", x, y )
	generate_shop_item( x, y, true )
end

function spawn_workshop( x, y )
	EntityLoad( "data/entities/buildings/workshop.xml", x, y )
end

function spawn_motordoor( x, y )
	EntityLoad( "data/entities/props/physics_templedoor2.xml", x, y )
end

function spawn_pressureplate( x, y )
	EntityLoad( "data/entities/props/temple_pressure_plate.xml", x, y )
end

function spawn_lamp(x, y)
	spawn(g_lamp,x-5,y+1,0,0)
end

function spawn_music_trigger( x, y )
	--EntityLoad( "data/entities/buildings/music_trigger_temple_left.xml", x, y )
end

function spawn_duplicator( x, y )
	EntityLoad( "data/entities/buildings/temple_duplicator.xml", x, y )
end

function spawn_areachecks( x, y )
	if( temple_should_we_spawn_checkers() ) then
		EntityLoad( "data/entities/buildings/temple_areacheck_horizontal.xml", x, y - 80 )
		EntityLoad( "data/entities/buildings/temple_areacheck_horizontal.xml", x, y + 140 )
		EntityLoad( "data/entities/buildings/temple_areacheck_vertical.xml", x - 120, y )
	end
end