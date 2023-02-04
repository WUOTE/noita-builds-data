-- RegisterSpawnFunction( 0xffbf26a9, "spawn_runes" )
-- RegisterSpawnFunction( 0xff6b26a6, "spawn_bigtorch" )

function runestone_activate( entity_id )
	local status = 0
	
	local variablestorages = EntityGetComponent( entity_id, "VariableStorageComponent" )
	if ( variablestorages ~= nil ) then
		for j,storage_id in ipairs(variablestorages) do
			local var_name = ComponentGetValue( storage_id, "name" )
			if ( var_name == "active" ) then
				status = ComponentGetValue( storage_id, "value_int" )
				
				status = 1 - status
				
				ComponentSetValue2( storage_id, "value_int", status )
				
				if ( status == 1 ) then
					EntitySetComponentsWithTagEnabled( entity_id, "activate", true )
				else
					EntitySetComponentsWithTagEnabled( entity_id, "activate", false )
				end
			end
		end
	end
end

function spawn_apparition(x, y)
	SetRandomSeed( x, y )
	local PlaceItems1 	= 1
	local PlaceItems2 	= 2
	local Spawn 		= 3

	local level = 0 -- TODO: fetch biome level somehow
	local state,apparition_entity_id = SpawnApparition( x, y, level )

	-- local r = ProceduralRandom(x + 5.352, y - 4.463)
	-- if (r > 0.1) then

	local place_items = function()
		for i=1,4 do
			local rx = x + Random( -10, 10 )
				
			spawn_candles(rx, y)
		end
	end

	if state == PlaceItems1 or state == PlaceItems2 then
		place_items()
		print( tostring(x) .. ", " .. tostring(y) ) -- DEBUG:
	elseif state == Spawn then
		LoadPixelScene( "data/biome_impl/grave.png", "data/biome_impl/grave_visual.png", x-10, y-15, "", true )
		--[[
		GamePrint( "___________________________" )
		GamePrint( "" )
		GamePrint( "A chill runs up your spine!" )
		GamePrint( "___________________________" )
		--]]
		print( tostring(x) .. ", " .. tostring(y) ) -- DEBUG:
	end
end

function spawn_persistent_teleport(x, y)
	--[[
	local r = ProceduralRandom(x + 5.352, y - 4.463)
	if (r > 0.1) then
		local level = 0 -- TODO: fetch biome level somehow
		SpawnPersistentTeleport( x, y )
	end
	]]--
end

function spawn_persistent_teleport(x, y)
	--spawn(g_persistent_teleport,x,y,0,0)
end

function spawn_candles(x, y)
	spawn(g_candles,x,y,0,0)
end

function spawn_wands(x, y)
	spawn(g_items,x-5,y,0,0)
end

function spawn_potions(x, y)
	SetRandomSeed( x+425, y-243 )
	local rnd = Random(1,89)
	
	local flag_status = HasFlagPersistent( "card_unlocked_duplicate" )
	
	if ( rnd >= 86 ) then
		EntityLoad( "data/entities/items/pickup/broken_wand.xml", x, y-2 )
	elseif ( rnd >= 84 ) then
		EntityLoad( "data/entities/items/pickup/thunderstone.xml", x, y-2 )
	elseif ( rnd >= 80 ) then
		EntityLoad( "data/entities/items/pickup/brimstone.xml", x, y-2 )
	elseif ( rnd >= 78 ) then
		EntityLoad( "data/entities/items/pickup/egg_monster.xml", x, y-2 )
	elseif ( rnd >= 74 ) then
		EntityLoad( "data/entities/items/pickup/egg_slime.xml", x, y-2 )
	elseif ( rnd >= 72 ) then
		EntityLoad( "data/entities/items/pickup/egg_fire.xml", x, y-2 )
	elseif ( rnd >= 71 ) then
		EntityLoad( "data/entities/items/pickup/egg_purple.xml", x, y-2 )
	elseif ( rnd >= 70 ) then
		local opts = { "laser", "fireball", "lava", "slow", "null", "disc" }
		rnd = Random( 1, #opts )
		local opt = opts[rnd]
		
		local entity_id = EntityLoad( "data/entities/items/pickup/runestones/runestone_" .. opt .. ".xml", x, y-10 )
		
		rnd = Random( 1, 10 )
		
		if ( rnd == 2 ) then
			runestone_activate( entity_id )
		end
	elseif flag_status and ( rnd >= 69 ) then
		EntityLoad( "data/entities/items/pickup/physics_die.xml", x, y-12 )
	else
		EntityLoad( "data/entities/items/pickup/potion.xml", x, y-2 )
	end
end

function spawn_ghostlamp(x, y)
	spawn2(g_ghostlamp,x,y,0,0)
end

function spawn_heart( x, y )
	local r = ProceduralRandom( x, y )
	SetRandomSeed( x, y )
	-- local r=1
	-- 2018.11.15 - Petri 
	-- changed this from 0.4 -> 0.7 quite a big upping of heart spawns
	-- done for testing 

	if (r > 0.7) then
		local entity = EntityLoad( "data/entities/items/pickup/heart.xml", x, y)
	elseif (r > 0.3) then
		SetRandomSeed( x+45, y-2123 )
		local rnd = Random( 1, 100 )
		
		if (rnd <= 90) or (y < 512 * 3) then
			rnd = Random( 1, 1000 )
			
			if ( rnd < 1000 ) then
				local entity = EntityLoad( "data/entities/items/pickup/chest_random.xml", x, y)
			else
				local entity = EntityLoad( "data/entities/items/pickup/chest_random_super.xml", x, y)
			end
		else
			rnd = Random( 1, 100 )
			if( rnd <= 95 ) then
				local entity = EntityLoad( "data/entities/animals/chest_mimic.xml", x, y)
			else
				local entity = EntityLoad( "data/entities/items/pickup/chest_leggy.xml", x, y)
			end
		end
	end
end

function spawn_potion_altar(x, y)
	local r = ProceduralRandom( x, y )
	
	if (r > 0.65) then
		LoadPixelScene( "data/biome_impl/potion_altar.png", "data/biome_impl/potion_altar_visual.png", x-5, y-15, "", true )
	end
end

function spawn_debug_mark( x,y )
	EntityLoad( "data/entities/_debug/debug_marker.xml", x, y )
end

function spawn_portal( x, y )
	if( BIOME_NAME == "crypt" ) then
		EntityLoad( "data/entities/buildings/teleport_boss_arena.xml", x, y - 4 )
	else
		EntityLoad( "data/entities/buildings/teleport_liquid_powered.xml", x, y - 4 )
	end
end

function spawn_end_portal( x, y )
	EntityLoad( "data/entities/buildings/teleport_boss_arena.xml", x, y - 4 )
end


function spawn_runes( x, y )
	--EntityLoad( "data/entities/buildings/runes.xml", x, y )
end

function spawn_fullhp(x, y)
	EntityLoad( "data/entities/items/pickup/heart_fullhp.xml", x, y )
end

function spawn_wand_trap( x, y )
	-- print(x)
	-- EntityLoad( "data/entities/buildings/wand_trap_circle_acid.xml", x, y )
	EntityLoad( "data/entities/props/physics_trap_circle_acid.xml", x, y )
end

function spawn_wand_trap_electricity_source( x, y )
	-- print(x)
	EntityLoad( "data/entities/buildings/wand_trap_electricity.xml", x, y )
end

function spawn_wand_trap_electricity( x, y )
	-- print(x)
	EntityLoad( "data/entities/props/physics_trap_electricity.xml", x, y )
end

function spawn_wand_trap_ignite( x, y )
	-- EntityLoad( "data/entities/buildings/wand_trap_ignite.xml", x, y )
	EntityLoad( "data/entities/props/physics_trap_ignite.xml", x, y )
end

function spawn_bigtorch(x, y)
	EntityLoad( "data/entities/props/physics_torch_stand.xml", x, y )
end

function spawn_moon(x, y)
	EntityLoad( "data/entities/buildings/moon_altar.xml", x, y )
end

function spawn_collapse( x, y )
	EntityLoad( "data/entities/misc/loose_chunks.xml", x, y )
end

function spawn_shopitem( x, y )
	generate_shop_item( x, y, false, 10 )
end