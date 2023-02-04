dofile( "data/scripts/gun/gun_actions.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local itemno = Random( 1, #actions )
local thisitem = actions[itemno]
local item = string.lower(thisitem.id)

local card_entity = CreateItemActionEntity( item, x, y )
