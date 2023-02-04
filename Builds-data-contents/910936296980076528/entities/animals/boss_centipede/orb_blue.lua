dofile( "data/scripts/lib/utilities.lua" )

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

edit_component( entity_id, "VelocityComponent", function(comp,vars)
	local vel_x,vel_y = ComponentGetValueVector2( comp, "mVelocity", vel_x, vel_y)

	local angle = 0 - math.atan2(vel_y,vel_x)
	local phase = math.rad(GameGetFrameNum() * 4)
	local speed = 150
	angle = angle + math.cos(phase) * math.rad(4)
	vel_x = math.cos(angle) * speed
	vel_y = 0-math.sin(angle) * speed

	ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y)
end)