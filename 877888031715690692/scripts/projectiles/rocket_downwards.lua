dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local vel_x,vel_y = 0,0

edit_component( entity_id, "VelocityComponent", function(comp,vars)
	vel_x,vel_y = ComponentGetValueVector2( comp, "mVelocity", vel_x, vel_y)
end)

if ( vel_y > 10 ) then
	local how_many = 5
	local velocities = {{-100,100},{-50,140},{0,160},{50,140},{100,100}}

	for i,values in ipairs(velocities) do
		local vel_x = values[1]
		local vel_y = values[2]

		shoot_projectile( entity_id, "data/entities/projectiles/deck/rocket_downwards.xml", pos_x + vel_x * 0.05, pos_y + vel_y * 0.05, vel_x, vel_y, false )
	end
	
	EntityKill( entity_id )
end