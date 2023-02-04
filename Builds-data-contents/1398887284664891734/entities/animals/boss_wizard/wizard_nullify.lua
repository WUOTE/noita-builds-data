dofile_once("data/scripts/lib/utilities.lua")

function damage_received( damage, desc, entity_who_caused, is_fatal )
	local entity_id = GetUpdatedEntityID()
	local x, y = EntityGetTransform( entity_id )
	
	local projs = EntityGetInRadiusWithTag( x, y, 36, "projectile" )
	
	for i,projectile_id in ipairs( projs ) do
		if ( projectile_id ~= entity_who_caused ) then
			local px,py = EntityGetTransform( projectile_id )
			local projectilecomponents = EntityGetComponent( projectile_id, "ProjectileComponent" )
			
			if ( projectilecomponents ~= nil ) then
				for j,comp_id in ipairs(projectilecomponents) do
					ComponentSetValue( comp_id, "on_death_explode", "0" )
					ComponentSetValue( comp_id, "on_lifetime_out_explode", "0" )
				end
			end
			
			EntityLoad("data/entities/particles/neutralized_tiny.xml", px, py)
			EntityKill( projectile_id )
		end
	end
end