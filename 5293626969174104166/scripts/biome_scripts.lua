-- RegisterSpawnFunction( 0xffbf26a9, "spawn_runes" )
-- RegisterSpawnFunction( 0xff6b26a6, "spawn_bigtorch" )

function spawn_apparition(x, y)
	local PlaceItems1 	= 1
	local PlaceItems2 	= 2
	local Spawn 		= 3

	local level = 0 -- TODO: fetch biome level somehow
	local state,apparition_entity_id = SpawnApparition( x, y, level )

	-- local r = ProceduralRandom(x + 5.352, y - 4.463)
	-- if (r > 0.1) then

	local place_items = function()
		for i=1,4 do
			local rx = x + Random(-10, 10)
				
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
	local rnd = Random(1,80)
	
	if ( rnd >= 78 ) then
		EntityLoad( "data/entities/items/pickup/thunderstone.xml", x, y-2 )
	elseif ( rnd >= 74 ) then
		EntityLoad( "data/entities/items/pickup/egg_monster.xml", x, y-2 )
	elseif ( rnd >= 70 ) then
		EntityLoad( "data/entities/items/pickup/egg_slime.xml", x, y-2 )
	else
		EntityLoad( "data/entities/items/pickup/potion.xml", x, y-2 )
	end
end

function spawn_ghostlamp(x, y)
	spawn(g_ghostlamp,x-1,y+16,0,0)
end

function spawn_heart( x, y )
	local r = ProceduralRandom( x, y )
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
			local entity = EntityLoad( "data/entities/items/pickup/chest_random.xml", x, y)
		else
			local entity = EntityLoad( "data/entities/animals/chest_mimic.xml", x, y)
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
		EntityLoad( "data/entities/buildings/teleport_boss_arena.xml", x, y )
	else
		EntityLoad( "data/entities/buildings/teleport.xml", x, y )
	end
end

function spawn_end_portal( x, y )
	EntityLoad( "data/entities/buildings/teleport_boss_arena.xml", x, y )
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

function spawn_wand_trap_ignite_a( x, y )
	-- EntityLoad( "data/entities/buildings/wand_trap_ignite.xml", x, y )
	EntityLoad( "data/entities/props/physics_trap_ignite_a.xml", x, y )
end

function spawn_wand_trap_ignite_b( x, y )
	-- EntityLoad( "data/entities/buildings/wand_trap_ignite.xml", x, y )
	EntityLoad( "data/entities/props/physics_trap_ignite_b.xml", x, y )
end

function spawn_bigtorch(x, y)
	EntityLoad( "data/entities/props/physics_torch_stand.xml", x, y )
end