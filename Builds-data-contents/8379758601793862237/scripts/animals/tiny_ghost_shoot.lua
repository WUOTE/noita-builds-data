dofile_once("data/scripts/lib/utilities.lua")

local range = 200
local projectile_velocity = 600
local scatter = 0.15

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

-- locate nearest enemy
-- TODO: use herd's enemies instead so that ghosts can be attached to monsters etc?
local enemy = EntityGetClosestWithTag(pos_x, pos_y, "enemy")
if not enemy then return end

local enemy_x, enemy_y = EntityGetTransform( enemy )
enemy_y = enemy_y - 9 -- don't aim at the feet

-- check range and LOS
if get_distance(pos_x, pos_y, enemy_x, enemy_y) > range
or Raytrace(pos_x, pos_y, enemy_x, enemy_y) then
	return
end

-- direction
local vel_x, vel_y = vec_sub(enemy_x, enemy_y, pos_x, pos_y)
vel_x,vel_y = vec_normalize(vel_x, vel_y)

-- scatter
SetRandomSeed(pos_x + GameGetFrameNum(), pos_y)
vel_x,vel_y = vec_rotate(vel_x,vel_y, rand(-scatter, scatter))

-- apply velocity
vel_x,vel_y = vec_mult(vel_x,vel_y, projectile_velocity)

shoot_projectile( EntityGetParent(entity_id), "data/entities/projectiles/deck/light_bullet.xml", pos_x, pos_y, vel_x, vel_y)

