-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")
dofile( "data/scripts/items/generate_shop_item.lua" )
dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/biomes/temple_shared.lua" )
dofile( "data/scripts/perks/perk.lua" )

RegisterSpawnFunction( 0xff6d934c, "spawn_hp" )
RegisterSpawnFunction( 0xff33934c, "spawn_all_shopitems" )
-- RegisterSpawnFunction( 0xff33934c, "spawn_shopitem" )
-- RegisterSpawnFunction( 0xff33935F, "spawn_cheap_shopitem" )
RegisterSpawnFunction( 0xff10822d, "spawn_workshop" )
RegisterSpawnFunction( 0xffFAABBA, "spawn_motordoor" )
RegisterSpawnFunction( 0xffFAABBB, "spawn_pressureplate" )
RegisterSpawnFunction( 0xff03DEAD, "spawn_areachecks" )
RegisterSpawnFunction( 0xffA85454, "spawn_control_workshop" )
RegisterSpawnFunction( 0xff845454, "spawn_boss_music_and_statues" )


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

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end

function spawn_items( x, y ) 
	EntityLoad( "data/entities/animals/boss_centipede/boss_centipede.xml", x, y )
	EntityLoad( "data/entities/animals/boss_centipede/sampo.xml", x, y + 80 )
	EntityLoad( "data/entities/animals/boss_centipede/reference_point.xml", x, y )
end

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

function spawn_hp( x, y )
	EntityLoad( "data/entities/items/pickup/heart_fullhp.xml", x-16, y )
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
	local count = 5
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

function spawn_all_perks( x, y )
	SetRandomSeed( x, y )

	if( GlobalsGetValue( "TEMPLE_SPAWN_GUARDIAN" ) == "1" ) then
		EntityLoad( "data/entities/animals/necromancer_shop.xml", x + 30, y - 30 )
	end

	local spawn_shop, do_spawn_perks = temple_random( x, y )
	if( do_spawn_perks == "0" ) then
		return
	end
	
	perk_spawn_many( x, y )
end

function spawn_perk( x, y )
	local spawn_shop, spawn_perks = temple_random( x, y )
	if( spawn_perks == "0" ) then
		return
	end

	EntityLoad( "data/entities/items/pickup/perk.xml", x, y )
end

function spawn_control_workshop(x,y)
	EntityLoad( "data/entities/buildings/workshop_exit_final.xml", x, y )
end

function spawn_boss_music_and_statues(x,y)
	EntityLoad( "data/entities/props/boss_arena_statues.xml", x - 30, y - 30 )
	EntityLoad( "data/entities/animals/boss_centipede/boss_music_buildup_trigger.xml", x, y )
end