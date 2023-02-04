-- ok, testing some component stuff with lua

for i=1,60 do
entity_id = EntityLoad( "data/entities/test_sprite.xml" )

entity_id = EntityCreateNew()
EntityAddComponent( entity_id, "SpriteComponent", { image_file = "data/temp/jukio_lol.png" } )

-- add a component that increases the entity rotation every frame
EntityAddComponent( entity_id, "LuaComponent", {script_source_file = "data/temp/lua_component_test3.lua", execute_times = 1000} )
end

-- add a component that creates 1000 jukios with randomized rotation
-- EntityAddComponent( entity_id, "LuaComponent", {script_source_file = "data/temp/lua_component_test2.lua", execute_times = 1000} )