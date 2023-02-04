dofile( "data/scripts/lib/utilities.lua" )

local entity_id    = GetUpdatedEntityID()
local x, y = EntityGetTransform( GetUpdatedEntityID() )

EntityLoad( "data/entities/misc/electricity.xml", x + 24, y )