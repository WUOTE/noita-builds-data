dofile_once("data/scripts/lib/utilities.lua")

function damage_received( damage )
	if ( damage >= 2.0 ) then
		local entity_id    = GetUpdatedEntityID()
		local x, y = EntityGetTransform( GetUpdatedEntityID() )

		local eid = EntityLoad( "data/entities/animals/boss_alchemist/projectile_counter.xml", x, y )
		EntityAddChild( entity_id, eid )
	end
end