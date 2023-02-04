dofile_once("data/scripts/lib/utilities.lua")

local sensor_range = 20
local teleport_range = 40
local time_active = 2
local time_cooldown = 180

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity(entity_id)
local x, y = EntityGetTransform( entity_id )

local function teleport(from_x, from_y, to_x, to_y)
	EntitySetTransform(root_id, to_x, to_y)
	EntityLoad("data/entities/particles/teleportation_source.xml", from_x, from_y)
	EntityLoad("data/entities/particles/teleportation_target.xml", to_x, to_y)
	GamePlaySound("data/audio/Desktop/misc.bank","misc/teleport_use", to_x, to_y)
end

-- toggles vfx and sets script exec time
local function set_cooldown(on_cooldown, frames)
	EntitySetComponentsWithTagEnabled(entity_id, "teleportitis_dodge_vfx", not on_cooldown)
	component_write( GetUpdatedComponentID(), {
		execute_every_n_frame = frames,
		mNextExecutionTime = GameGetFrameNum() + frames,
	})
end

-- look for enemy projectiles
for _,proj_id in ipairs(EntityGetInRadiusWithTag( x, y, sensor_range, "projectile" )) do
	local comp_proj = EntityGetFirstComponent(proj_id, "ProjectileComponent")
	if comp_proj ~= nil then
		local shooter_id = tonumber(ComponentGetValue(comp_proj, "mWhoShot"))
		if shooter_id ~= 0 and shooter_id ~= root_id then
			-- found. let's teleport
			local target_x = 0
			local target_y = 0
			local longest_dist = 0
			local dir_x = 0
			local dir_y = teleport_range

			-- randomize initial direction
			dir_x, dir_y = vec_rotate(dir_x, dir_y, ProceduralRandomf(x + proj_id, y, math.pi * 2))
			
			-- find direction with most space available
			for i=1,4 do
				dir_x, dir_y = vec_rotate(dir_x, dir_y, math.pi * 0.5)
				local _,ray_x,ray_y = RaytracePlatforms(x, y, x + dir_x, y + dir_y)
				local dist = get_distance2( x, y, ray_x - x, ray_y - y)
				if dist > longest_dist then
					target_x = ray_x
					target_y = ray_y
					longest_dist = dist
				end
			end

			-- reel it back a bit so we don't end up inside a wall
			local back_x = x - target_x
			local back_y = y - target_y
			back_x, back_y = vec_normalize(back_x, back_y)
			target_x = target_x + back_x * 10
			target_y = target_y + back_y * 10

			-- teleport
			teleport(x, y, target_x, target_y)
			set_cooldown(true, time_cooldown)
			return
		end
	end
end

-- cooldown off
set_cooldown(false, time_active)
