-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")
dofile( "data/scripts/items/generate_shop_item.lua" )
dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/biomes/temple_shared.lua" )

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff6d934c, "spawn_hp" )
RegisterSpawnFunction( 0xff33934c, "spawn_all_shopitems" )
-- RegisterSpawnFunction( 0xff33934c, "spawn_shopitem" )
-- RegisterSpawnFunction( 0xff33935F, "spawn_cheap_shopitem" )
RegisterSpawnFunction( 0xff10822d, "spawn_workshop" )
RegisterSpawnFunction( 0xff5a822d, "spawn_workshop_extra" )
RegisterSpawnFunction( 0xffFAABBA, "spawn_motordoor" )
RegisterSpawnFunction( 0xffFAABBB, "spawn_pressureplate" )
RegisterSpawnFunction( 0xff03DEAD, "spawn_areachecks" )
RegisterSpawnFunction( 0xff03deaf, "spawn_fish" )
RegisterSpawnFunction( 0xff784dd2, "spawn_worm_deflector" )


g_lamp =
{
	total_prob = 0,
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
	{
		prob   		= 5.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 1.0,
		min_count	= 2,
		max_count	= 5,    
		entity 	= "data/entities/animals/fish.xml"
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

	SetRandomSeed( x, y )
	local randomtop = Random(1, 50)
	
	LoadPixelScene( "data/biome_impl/temple_wall_top.png", "", x, y-30, "data/biome_impl/temple_wall_top_background.png", true )
	
	if (randomtop == 5) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_water.png", "", x, y-40, "", true )
	elseif (randomtop == 8) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_blood.png", "", x, y-40, "", true )
	elseif (randomtop == 11) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_oil.png", "", x, y-40, "", true )
	elseif (randomtop == 13) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_radioactive.png", "", x, y-40, "", true )
	elseif (randomtop == 15) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_lava.png", "", x, y-40, "", true )
	else
		LoadPixelScene( "data/biome_impl/temple_altar_top.png", "", x, y-40, "", true )
	end
	
	LoadPixelScene( "data/biome_impl/temple_altar.png", "data/biome_impl/temple_altar_visual.png", x, y-40+300, "data/biome_impl/temple_altar_background.png", true )
end

function spawn_hp( x, y )
	EntityLoad( "data/entities/items/pickup/heart_fullhp_temple.xml", x-16, y )
	EntityLoad( "data/entities/buildings/music_trigger_temple.xml", x-16, y )
	EntityLoad( "data/entities/items/pickup/spell_refresh.xml", x+16, y )
	EntityLoad( "data/entities/buildings/coop_respawn.xml", x, y )
end

function spawn_shopitem( x, y )
	-- EntityLoad( "data/entities/items/shop_item.xml", x, y )
	-- generate_shop_item( x, y, false )
end

function spawn_cheap_shopitem( x, y )
	-- EntityLoad( "data/entities/items/shop_item.xml", x, y )
	-- generate_shop_item( x, y, true )
end

function spawn_all_shopitems( x, y )
	local spawn_shop, spawn_perks = temple_random( x, y )
	if( spawn_shop == "0" ) then
		return
	end

	EntityLoad( "data/entities/buildings/shop_hitbox.xml", x, y )
	
	SetRandomSeed( x, y )
	local count = tonumber( GlobalsGetValue( "TEMPLE_SHOP_ITEM_COUNT", "5" ) )
	local width = 132
	local item_width = width / count
	local sale_item_i = Random(1, count)

	if( Random( 0, 100 ) <= 50 ) then
		for i=1,count do
			if( i == sale_item_i ) then
				generate_shop_item( x + (i-1)*item_width, y, true, nil, true )
			else
				generate_shop_item( x + (i-1)*item_width, y, false, nil, true )
			end
		end
	else	
		for i=1,count do
			if( i == sale_item_i ) then
				generate_shop_wand( x + (i-1)*item_width, y, true )
			else
				generate_shop_wand( x + (i-1)*item_width, y, false )
			end
		end
	end
end

function spawn_workshop( x, y )
	EntityLoad( "data/entities/buildings/workshop.xml", x, y )
end

function spawn_workshop_extra( x, y )
	EntityLoad( "data/entities/buildings/workshop_allow_mods.xml", x, y )
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

function spawn_areachecks( x, y )
	if( temple_should_we_spawn_checkers() ) then
		EntityLoad( "data/entities/buildings/temple_areacheck_horizontal.xml", x + 200, y - 80 )
		EntityLoad( "data/entities/buildings/temple_areacheck_horizontal.xml", x + 200, y + 140 )
	end
end

function spawn_worm_deflector( x, y )
	EntityLoad( "data/entities/buildings/physics_worm_deflector.xml", x, y )
end

function spawn_fish(x, y)
	spawn(g_fish,x,y)
end