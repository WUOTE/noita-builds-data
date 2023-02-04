dofile_once("data/scripts/lib/utilities.lua")

function wand_fired( wand_id )
	local projectile_velocity = 600

	local entity_id = GetUpdatedEntityID()
	local children = EntityGetAllChildren( entity_id )
	local ghost_id

	if ( children ~= nil ) then
		for i,v in ipairs( children ) do
			if EntityHasTag( v, "angry_ghost" ) then
				ghost_id = v
				break
			end
		end
	end

	if ( ghost_id ~= nil ) and ( wand_id ~= nil ) and ( wand_id ~= NULL_ENTITY ) then
		local pos_x, pos_y = EntityGetTransform( ghost_id )

		SetRandomSeed(pos_x + GameGetFrameNum(), pos_y)
		projectile_velocity = Random( 550, 750 )
		
		local x,y,dir = EntityGetTransform( wand_id )
		local storages = EntityGetComponent( ghost_id, "VariableStorageComponent" )
		local projectile = "data/entities/projectiles/deck/light_bullet.xml"

		if ( storages ~= nil ) then
			for i,comp in ipairs( storages ) do
				local name = ComponentGetValue2( comp, "name" )
				if ( name == "projectile_memory" ) then
					projectile = ComponentGetValue2( comp, "value_string" )
					break
				end
			end
		end

		if ( #projectile == 0 ) then
			projectile = "data/entities/projectiles/deck/light_bullet.xml"
		end

		if ( #projectile > 0 ) then
			local vel_x = math.cos( 0 - dir ) * projectile_velocity
			local vel_y = 0 - math.sin( 0 - dir ) * projectile_velocity
			
			shoot_projectile( entity_id, projectile, pos_x, pos_y, vel_x, vel_y)
		end
	end
end