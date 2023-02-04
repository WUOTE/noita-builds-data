-- simple test

-- print "Hello, World!"

-- avg, sum = average(10, 20, 30, 40, 50)

-- print("The average is ", avg)
-- print("The sum is ", sum)

-- testing entity loading
entity_id = EntityLoad( "data/entities/test_sprite.xml" )

entity_id = EntityCreateNew( "humppa" )
EntityAddComponent( entity_id, "SpriteComponent" )
EntitySave( entity_id, "temptemp/out_new_entity.xml" )

components = EntityGetComponent( entity_id, "SpriteComponent" );
for key,value in pairs(components) do print(key,value) end


-- members = ComponentGetMembers()
for key,value in pairs(members) do print(key,value) end


-- ComponentSetValue( "bullet_velocity", 40 )
-- bullet_velocity = ComponentGetValue( "bullet_velocity" )
print( bullet_velocity )

