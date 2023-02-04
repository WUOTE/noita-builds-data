function can_run()
	return new_world_entered and math.abs(new_world_x) > 500 and new_world_y < 50 and Random(0,3) == 0
end

function run()
	if (new_world_biome == "hills") then
		spawn()
	end
end

function spawn()
	found,x,y = GetSpawnLocation()
	if ( found and is_sector(x, SECTOR_ANIMAL) ) then
		id = EntityLoad( "data/entities/animals/duck.xml" )
		EntitySetTransform(id, x, y)
		comp_camera_bound = EntityGetFirstComponent( id, "CameraBoundComponent" )
		ComponentSetValue( comp_camera_bound, "freeze_on_distance_kill", 0 )
		ComponentSetValue( comp_camera_bound, "freeze_on_max_count_kill", 0 )
	end
end