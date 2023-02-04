CHEST_LEVEL = 3
dofile("data/scripts/director_helpers.lua")
dofile("data/scripts/biome_scripts.lua")
dofile( "data/scripts/lib/utilities.lua" )

-- the one after the lavalake

RegisterSpawnFunction( 0xffffeedd, "init" )

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_candles( x, y ) end
function spawn_potions( x, y ) end
function spawn_wands( x, y ) end

function init( x, y, w, h )
	LoadPixelScene( "data/biome_impl/orbroom.png", "", x, y, "data/biome_impl/orbroom_background.png", true )
end

------------------------------------------------------------------------

function spawn_material_checker( x, y, material1_str, lua_filename, image_emitter, image_emitter_x, image_emitter_y )
	local entity = EntityLoad( "data/entities/buildings/orb_room_materialchecker.xml", x, y )

	local material1 = CellFactory_GetType( material1_str )
	local material2 = -1

	local comp_mat = EntityGetFirstComponent( entity, "MaterialAreaCheckerComponent" )
	if comp_mat ~= nil then
		ComponentSetValue( comp_mat, "material", to_string(material1) )
		ComponentSetValue( comp_mat, "material2", to_string(material2) )
	end

	local comp_lua = EntityGetFirstComponent( entity, "LuaComponent" )
	if comp_lua ~= nil then
		ComponentSetValue( comp_lua, "script_material_area_checker_success", lua_filename )
	end

	EntityAddComponent( entity, "VariableStorageComponent", 
	{ 
		name = "emitter_x",
		value_int = image_emitter_x,
	} )

	EntityAddComponent( entity, "VariableStorageComponent", 
	{ 
		name = "emitter_y",
		value_int = image_emitter_y,
	} )

	EntityAddComponent( entity, "VariableStorageComponent", 
	{ 
		name = "emitter",
		value_string = image_emitter,
	} )
end

------------------------------------------------------------------------

function material_area_checker_success( x, y )
	-- orbroom.xml
	print("successs!")
	local entity_id    = GetUpdatedEntityID()
	local image_x = x
	local image_y = y
	local image_emitter = "NULL"


	local components = EntityGetComponent( entity_id, "VariableStorageComponent" )

	for key,comp_id in pairs(components) do 
		print("VariableStorageComponent")
		local var_name = ComponentGetValue( comp_id, "name" )
		if( var_name == "emitter_x") then
			image_x = tonumber( ComponentGetValue( comp_id, "value_int" ) )
		end
		if( var_name == "emitter_y") then
			image_y = tonumber( ComponentGetValue( comp_id, "value_int" ) )
		end
		if( var_name == "emitter") then
			image_emitter = ComponentGetValue( comp_id, "value_string" ) 
		end
	end

	print( image_emitter )
	print( image_x )
	print( image_y )

	EntityLoad( image_emitter, image_x, image_y )
end

------------------------------------------------------------------------

function spawn_orb(x, y)
	EntityLoad( "data/entities/items/orbs/orb_07.xml", x, y )
	--EntityLoad( "data/entities/items/pickup/heart_better.xml", x + 30, y - 20 )
	EntityLoad( "data/entities/items/books/book_07.xml", x - 30, y + 40 )
	EntityLoad( "data/entities/misc/music_energy_000.xml", x, y - 10 )
	spawn_material_checker( x - 197, y - 11, "blood", "data/scripts/biomes/orbrooms/orbroom_07.lua", "data/entities/particles/image_emitters/orbroom.xml", x, y - 100 )
	spawn_material_checker( x + 198, y - 11, "blood", "data/scripts/biomes/orbrooms/orbroom_07.lua", "data/entities/particles/image_emitters/orbroom.xml", x, y - 100 )
	-- EntityLoad( "data/entities/buildings/orb_room_materialchecker.xml", x - 197, y - 11 )
	-- EntityLoad( "data/entities/buildings/orb_room_materialchecker.xml", x + 198, y - 11 )
end