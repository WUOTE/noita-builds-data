dofile_once("data/scripts/lib/utilities.lua")

local distance_full = 96
local float_range = 50
local float_force = 3
local float_sensor_sector = math.pi * 0.3

local entity_id = GetUpdatedEntityID()
local x, y, rot = EntityGetTransform( entity_id )

-- attract various entities
local entities = EntityGetInRadius(x, y, distance_full)
if ( #entities == 0 ) then return end
for _,id in ipairs(entities) do	
	if EntityHasTag(id, "projectile") or
		EntityHasTag(id, "prop") or
		EntityHasTag(id, "gold_nugget") or
		EntityHasTag(id, "item_physics") then
		local px, py = EntityGetTransform( id )
		
		local distance = math.sqrt( ( x - px ) ^ 2 + ( y - py ) ^ 2 )
		direction = 0 - math.atan2( ( y - py ), ( x - px ) )

		local velocitycomp = EntityGetFirstComponent( id, "VelocityComponent" )
		
		local gravity_percent = ( distance_full - distance ) / distance_full
		local gravity_coeff = 196
		
		local offset_x = math.cos( direction ) * ( gravity_coeff * gravity_percent )
		local offset_y = 0 - math.sin( direction ) * ( gravity_coeff * gravity_percent )

		if ( velocitycomp ~= nil ) then
			edit_component( id, "VelocityComponent", function(comp,vars)
				--local vel_x,vel_y = ComponentGetValueVector2( comp, "mVelocity")
				local vel_x,vel_y = ComponentGetValue2( comp, "mVelocity")
				
				vel_x = vel_x + offset_x
				vel_y = vel_y + offset_y

				--ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y)
				ComponentSetValue2( comp, "mVelocity", vel_x, vel_y)
			end)
		else
			-- add force instead
			PhysicsApplyForce(id, offset_x * 0.03, offset_y * 0.03)
		end
	end
end

-- float by raycasting down and applying opposite physical force
do
	local dir_x = 0
	local dir_y = float_range
	dir_x, dir_y = vec_rotate(dir_x, dir_y, ProceduralRandomf(x, y + GameGetFrameNum(), -float_sensor_sector, float_sensor_sector))
	
	local did_hit,hit_x,hit_y = RaytracePlatforms( x, y, x + dir_x, y + dir_y )
	if did_hit then
		local dist = get_distance(x, y, hit_x, hit_y)
		dist = math.max(6, dist) -- tame a bit on close encounters
		dir_x = -dir_x / dist * float_force
		dir_y = -dir_y / dist * float_force
		PhysicsApplyForce(entity_id, dir_x, dir_y)
	end
end
