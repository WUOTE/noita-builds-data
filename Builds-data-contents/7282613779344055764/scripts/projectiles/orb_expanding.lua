dofile_once("data/scripts/lib/utilities.lua")

local execute_times = 115
local damage_min = 0.1
local damage_max = 1.8
local radius_min = 0
local radius_max = 8

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

local t = ComponentGetValue2( GetUpdatedComponentID(), "mTimesExecuted" )
t = t / execute_times

local current_damage = lerp(damage_max, damage_min, t)
local current_radius = lerp(radius_max, radius_min, t)

-- update damage & visuals
component_write( EntityGetFirstComponent( entity_id, "ProjectileComponent" ), { damage = current_damage } )
local comp = EntityGetFirstComponent( entity_id, "ParticleEmitterComponent" )
ComponentSetValue2(comp, "area_circle_radius", current_radius, current_radius)
