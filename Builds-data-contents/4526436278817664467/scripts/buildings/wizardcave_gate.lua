dofile_once("data/scripts/lib/utilities.lua")

local distance_full = 90

local entity_id = GetUpdatedEntityID()
local x, y, rot = EntityGetTransform( entity_id )

-- center position drifts around
local t = GameGetFrameNum() * 0.02
x = x + math.sin(t) * 20
y = y + math.cos(t) * 20

-- offset tweaks
x = x + 10
y = y - 20

function calculate_force_at(body_x, body_y)
	local distance = math.sqrt( ( x - body_x ) ^ 2 + ( y - body_y ) ^ 2 )
	
	local direction = 0 - math.atan2( ( y - body_y ), ( x - body_x ) )

	local gravity_percent = ( distance_full - distance ) / distance_full
	local gravity_coeff = 50
	
	local fx = math.cos( direction ) * ( gravity_coeff * gravity_percent )
	local fy = -math.sin( direction ) * ( gravity_coeff * gravity_percent )

    return fx,fy
end

-- repel projectiles
local entities = EntityGetInRadiusWithTag(x, y, distance_full, "projectile")
for _,id in ipairs(entities) do	
	local physicscomp = EntityGetFirstComponent(id, "PhysicsBody2Component") or EntityGetFirstComponent( id, "PhysicsBodyComponent")
	if physicscomp == nil then -- velocity for physics bodies is done later
		local px, py = EntityGetTransform( id )

		local velocitycomp = EntityGetFirstComponent( id, "VelocityComponent" )
		if ( velocitycomp ~= nil ) then
			local fx, fy = calculate_force_at(px, py)
			edit_component( id, "VelocityComponent", function(comp,vars)
				local vel_x,vel_y = ComponentGetValue2( comp, "mVelocity")
				
				vel_x = vel_x - fx
				vel_y = vel_y - fy

				vel_y = vel_y * 0.85 -- dampen vertical movement

				-- limit velocity
				vel_x = clamp(vel_x, -100, 100)
				vel_y = clamp(vel_y, -100, 100)

				ComponentSetValue2( comp, "mVelocity", vel_x, vel_y)
			end)
		end
	end
end


-- force field for physics bodies
function calculate_force_for_body( entity, body_mass, body_x, body_y, body_vel_x, body_vel_y, body_vel_angular )
	local fx, fy = calculate_force_at(body_x, body_y)

	fx = fx * 1.5 * body_mass
	fy = fy * 1.5 * body_mass

    return body_x,body_y,-fx,-fy,0 -- forcePosX,forcePosY,forceX,forceY,forceAngular
end
local size = distance_full * 0.5
PhysicsApplyForceOnArea( calculate_force_for_body, entity_id, x-size, y-size, x+size, y+size )

