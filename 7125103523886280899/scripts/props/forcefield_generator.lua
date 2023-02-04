dofile_once("data/scripts/lib/utilities.lua")

local distance_threshold = 35

-- see if anyone is nearby and turn shield components on/off
local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( GetUpdatedEntityID() )
y = y - 10 -- offset closer to middle of force field

local dist = 99999999

-- probe closest enemy
local enemy = EntityGetClosestWithTag(x, y, "enemy")
if enemy ~= 0 then
	local x2,y2 = EntityGetTransform(enemy)
	dist = get_distance(x,y,x2,y2)
end

-- probe player
local player = EntityGetClosestWithTag(x, y, "player_unit")
if player ~= 0 then
	local x2,y2 = EntityGetTransform(player)
	dist = math.min(dist, get_distance(x,y,x2,y2))
end

local enable = dist > distance_threshold

-- enable components in child entities
local children = EntityGetAllChildren( GetUpdatedEntityID())
if children == nil then return end

for _,v in ipairs(children) do
	if EntityGetTags(v) == "shield_entity" then
		EntitySetComponentsWithTagEnabled( v, "enabled_while_shielding", enable )
	end
end

