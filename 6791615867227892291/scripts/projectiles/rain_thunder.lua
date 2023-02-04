dofile( "data/scripts/lib/utilities.lua" )

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local rnd = 1

if (rnd == 1) then
	local offset_x = Random( -32, 32 )

	shoot_projectile( entity_id, "data/entities/projectiles/deck/lightning_extra_arcs.xml", pos_x + offset_x, pos_y - 20, 0, 4000 )
end
