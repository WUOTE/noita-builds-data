-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 4
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/director_helpers_design.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/biome_modifiers.lua")
dofile_once("data/scripts/biomes/summon_portal_util.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff400000, "spawn_scavengers" )
RegisterSpawnFunction( 0xff400080, "spawn_large_enemies" )
RegisterSpawnFunction( 0xffC8C800, "spawn_lamp2" )
RegisterSpawnFunction( 0xff00AC64, "load_pixel_scene4" )
RegisterSpawnFunction( 0xff80FF5A, "spawn_vines" )
RegisterSpawnFunction( 0xff943030, "spawn_dragonspot" )
RegisterSpawnFunction( 0xff4c63e0, "spawn_root_grower" )
RegisterSpawnFunction( 0xff806326, "spawn_tree" )

------------ SMALL ENEMIES ----------------------------------------------------

g_small_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.5,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki_creepy_long.xml"
	},
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/lurker.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki_dark.xml"
	},
	{
		prob   		= 0.01,
		min_count	= 1,
		max_count	= 3,    
		entity 	= "data/entities/animals/wizard_weaken.xml"
	},
	{
		prob   		= 0.06,
		min_count	= 1,
		max_count	= 3,    
		entity 	= "data/entities/animals/wizard_twitchy.xml"
	},
	{
		prob   		= 0.06,
		min_count	= 1,
		max_count	= 3,    
		entity 	= "data/entities/animals/wizard_wither.xml"
	},
}


------------ BIG ENEMIES ------------------------------------------------------

g_big_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.6,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.1,
		min_count	= 2,
		max_count	= 3,    
		entity 	= "data/entities/animals/rainforest/fungus.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 2,
		max_count	= 3,    
		entity 	= "data/entities/animals/fungus_big.xml"
	},
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki_dark.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lurker.xml"
	},
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki.xml"
	},
	{
		prob   		= 0.03,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_dark.xml"
	},
	{
		prob   		= 0.03,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/wizard_hearty.xml"
	},
}

g_unique_enemy =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 1.0,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/drone_shield.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lurker.xml"
	},
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki_dark.xml"
	},
}

g_unique_enemy2 =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 1.0,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/buildings/lukki_eggs.xml"
	},
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki_dark.xml"
	},
}

------------ ITEMS ------------------------------------------------------------

g_items =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_04.xml"
	},
	{
		prob   		= 3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_05.xml"
	},
	{
		prob   		= 3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_unshuffle_03.xml"
	},
	{
		prob   		= 3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_unshuffle_04.xml"
	},
	{
		prob   		= 5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/items/wand_level_05_better.xml"
	},
}

------------ MISC --------------------------------------

g_nest =
{
	total_prob = 0,
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
}

------------------- Other animals --------------------------

g_large_enemies =
{
	total_prob = 0,
	{
		prob   		= 0.4,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lurker.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/rainforest/fungus.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/fungus_big.xml"
	},
	{
		prob   		= 0.09,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/lukki/lukki_dark.xml"
	},
	{
		prob   		= 0.2,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/crypt/skullfly.xml"
	},
}

g_scavengers =
{
	total_prob = 0,
	{
		prob   		= 0.5,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
}

g_props =
{
	total_prob = 0,
	{
		prob   		= 2.5,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_barrel_radioactive.xml"
	},
		{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_fungus_small.xml"
	},
	{
		prob   		= 0.1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_fungus.xml"
	},
	{
		prob   		= 0.08,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_fungus_big.xml"
	},
}

g_lamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 0.6,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_torch_stand_blue.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_fungus_small.xml"
	},
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_fungus.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/props/physics_fungus_big.xml"
	},
}

g_lamp2 =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 0.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
}

g_pixel_scene_01 =
{
	total_prob = 0,
	{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/rainforest/pit01.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/rainforest/pit02.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/rainforest/pit03.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
}

g_pixel_scene_02 =
{
	total_prob = 0,
	{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/rainforest/hut03.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
	{
		prob   			= 1.2,
		material_file 	= "data/biome_impl/rainforest/symbolroom.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0
	},
}

g_ghostlamp =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		offset_y	= 10,
		entity 	= "data/entities/props/physics_chain_torch_ghostly.xml"
	},
}

g_candles =
{
	total_prob = 0,
	{
		prob   		= 0.33,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_candle_1.xml"
	},
	{
		prob   		= 0.33,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_candle_2.xml"
	},
	{
		prob   		= 0.33,
		min_count	= 1,
		max_count	= 1, 
		entity 	= "data/entities/props/physics_candle_3.xml"
	},
}

g_vines =
{
	total_prob = 0,
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= ""
	},
	{
		prob   		= 0.4,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine_dark.xml"
	},
	{
		prob   		= 0.3,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine_dark_long.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine_dark_short.xml"
	},
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/verlet_chains/vines/verlet_vine_dark_shorter.xml"
	},
}

-- actual functions that get called from the wang generator

function init(x, y, w, h)
	apply_modifier( "rainforest_dark", "FOG_OF_WAR_REAPPEARS" )
end

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
	-- spawn_hp_mult(g_small_enemies,x,y,0,0,2,"rainforest")
end

function spawn_big_enemies(x, y)
	spawn(g_big_enemies,x,y)
	-- spawn_hp_mult(g_big_enemies,x,y,0,0,2,"rainforest")
end

function spawn_unique_enemy(x, y)
	spawn(g_unique_enemy,x,y+12)
	-- spawn_hp_mult(g_unique_enemy,x,y,0,0,2,"rainforest")
end

function spawn_unique_enemy2(x, y)
	spawn(g_unique_enemy2,x,y)
	-- spawn_hp_mult(g_unique_enemy,x,y,0,0,2,"rainforest")
end

function spawn_items(x, y)
	local r = ProceduralRandom( x-11.631, y+10.2257 )
	
	if (r > 0.27) then
		LoadPixelScene( "data/biome_impl/wand_altar.png", "data/biome_impl/wand_altar_visual.png", x-10, y-17, "", true )
	end
end

function spawn_nest(x, y)
	--spawn(g_nest,x,y)
end

function spawn_props(x, y)
	spawn(g_props,x,y)
end

function spawn_scavengers(x, y)
	--spawn(g_scavengers,x,y)
	-- spawn_hp_mult(g_scavengers,x,y,0,0,2,"rainforest")
end

function spawn_large_enemies(x, y)
	spawn(g_large_enemies,x,y)

	-- spawn_hp_mult(g_large_enemies,x,y,0,0,2,"rainforest")
end

function spawn_lamp(x, y)
	spawn(g_lamp,x,y-10)
end

function spawn_lamp2(x, y)
	spawn(g_lamp2,x-8,y-4,0,0)
end

function load_pixel_scene( x, y )
	load_random_pixel_scene( g_pixel_scene_01, x, y )
end

function load_pixel_scene2( x, y )
	load_random_pixel_scene( g_pixel_scene_02, x, y )
end

function load_pixel_scene4( x, y )
	--load_random_pixel_scene( g_pixel_scene_04, x, y )
end

function spawn_vines(x, y)
	spawn(g_vines,x+5,y+5)
	-- chance for an extra spawn for denser vineage
	if ProceduralRandomf(x, y) < 0.5 then
		spawn(g_vines,x,y+5)
	end
end

function spawn_dragonspot(x, y)
end

function spawn_tree(x, y)
	--spawn(g_trees,x+5,y+5)
end

function spawn_root_grower(x, y)
	if ProceduralRandom(x, y) < 0.5 then return end
	EntityLoad( "data/entities/props/root_grower.xml", x+5, y+5 )
end
