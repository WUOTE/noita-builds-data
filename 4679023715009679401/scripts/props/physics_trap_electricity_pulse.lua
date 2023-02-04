dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local x, y = EntityGetTransform( GetUpdatedEntityID() )
local offset = 8

EntityLoad( "data/entities/misc/electricity.xml", x + offset, y )
EntityLoad( "data/entities/misc/electricity.xml", x - offset, y )
EntityLoad( "data/entities/misc/electricity.xml", x, y + offset )
EntityLoad( "data/entities/misc/electricity.xml", x, y - offset )