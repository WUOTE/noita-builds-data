-- this is called every x frames
local entity_id    = GetUpdatedEntityID()

local teleport_comp = EntityGetFirstComponentIncludingDisabled( entity_id, "TeleportComponent" )

-- sets teleporter target to original location
-- NOTE: make sure the random seeds/positions here match with rainforest.lua init()!
local biome_x_min = -2550
local biome_x_max = 2000
local biome_y_min = 6750
local biome_y_max = 8050
local rim = 200 -- hint statues spawn on rim, portal target inside rim

local portal_x = ProceduralRandomi(209,13,biome_x_min + rim,biome_x_max - rim)
local portal_y = ProceduralRandomi(211,1.9,biome_y_min + rim,biome_y_max - rim)

if( teleport_comp ~= nil ) then
	ComponentSetValue2( teleport_comp, "target", portal_x, portal_y )
end
