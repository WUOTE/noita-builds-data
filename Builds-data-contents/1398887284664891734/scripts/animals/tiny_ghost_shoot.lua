dofile_once("data/scripts/lib/utilities.lua")

local range = 200
local projectile_velocity = 600
local scatter = 0.2

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity(entity_id)
local pos_x, pos_y = EntityGetTransform( entity_id )

-- locate nearest enemy
local enemy, enemy_x, enemy_y
local min_dist = 9999
for _,id in pairs(EntityGetInRadiusWithTag(pos_x, pos_y, range, "mortal")) do
	-- is target a valid enemy
	if (EntityGetComponent(id, "GenomeDataComponent") ~= nil) and (EntityGetHerdRelation(root_id, id) < 40) and (IsPlayer(root_id) ~= IsPlayer(id)) then
		local x, y = EntityGetFirstHitboxCenter( id )
		local dist = get_distance(pos_x, pos_y, x, y)
		if dist < min_dist then
			min_dist = dist
			enemy = id
			enemy_x = x
			enemy_y = y
		end
	end
end

if not enemy then return end

-- check los
if RaytraceSurfacesAndLiquiform(pos_x, pos_y, enemy_x, enemy_y) then return end

-- direction
local vel_x, vel_y = vec_sub(enemy_x, enemy_y, pos_x, pos_y)
vel_x,vel_y = vec_normalize(vel_x, vel_y)

-- scatter
SetRandomSeed(pos_x + GameGetFrameNum(), pos_y)
vel_x,vel_y = vec_rotate(vel_x,vel_y, rand(-scatter, scatter))

-- apply velocity & shoot
vel_x,vel_y = vec_mult(vel_x,vel_y, projectile_velocity)
local eid = shoot_projectile( root_id, "data/entities/projectiles/deck/light_bullet.xml", pos_x, pos_y, vel_x, vel_y)
if ( eid ~= nil ) then
	local c = EntityGetFirstComponent( eid, "ProjectileComponent" )
	local vbc = tonumber( GlobalsGetValue( "visited_biomes_count" ) ) or 0
	
	if ( c ~= nil ) and ( vbc > 0 ) then
		local extra_damage = vbc
		local damage = ComponentGetValue2( c, "damage" ) + extra_damage * 0.1
		ComponentSetValue2( c, "damage", damage )
	end
end

-- delay randomly so that multiple ghosts shoot at different times
local comp_id = GetUpdatedComponentID()
if (comp_id ~= 0) then
	ComponentSetValue(comp_id, "execute_every_n_frame", 24 + Random(2))
end

