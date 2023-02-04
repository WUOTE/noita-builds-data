--require "lib.coroutines.lua"  -- doesn't work because stupid lua looks at the Builds dir . using do_file via C++ instead

function can_run()
	return spawn_key_pressed
end


function run()
	found,x,y = GetSpawnLocationNear(cam_x+128, cam_y+100)
		
	if found then
		print("spawning")
		id = EntityLoad( "data/entities/animals/zombie.xml" )
		EntitySetTransform(id, x, y)
	end
	
	--[[async(function ()
		wait(60)
		print("signal!")
		signal(sig_id)
	end)]]--
end



-- C++ api tests


--[[
sig_id = 0

function call_signaling_func(a, b, func)
	func(a, b)
	sig_id = sig_id + 1
	return wait_signal(sig_id)
end

function wait_calculate_spawn_location_near(x, y)
	return call_signaling_func(x,y, GetSpawnLocationNear)
end
]]--