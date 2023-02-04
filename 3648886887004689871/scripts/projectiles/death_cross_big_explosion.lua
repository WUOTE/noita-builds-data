dofile( "data/scripts/lib/utilities.lua" )

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local how_many = 4
local angle_inc = math.pi * 0.5
local theta = 0
local length = 200

for i=1,how_many do
	for j=1,3 do
		local vel_x = math.cos( theta ) * (length * j)
		local vel_y = math.sin( theta ) * (length * j)

		shoot_projectile( entity_id, "data/entities/projectiles/deck/death_cross_big_laser.xml", pos_x, pos_y, vel_x, vel_y )
	end
	
	theta = theta + angle_inc
end
