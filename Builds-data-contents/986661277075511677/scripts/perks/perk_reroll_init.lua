
local entity_id = GetUpdatedEntityID()
local itemcost_comp = EntityGetFirstComponent( entity_id, "ItemCostComponent" )

local perk_reroll_count = tonumber( GlobalsGetValue( "TEMPLE_PERK_REROLL_COUNT", "0" ) )
local cost = 200 * math.pow( 2, perk_reroll_count )

ComponentSetValue( itemcost_comp, "cost", tostring(cost))

-- ComponentSetMetaCustom( ingestion_component, "ingestible_materials", values)
