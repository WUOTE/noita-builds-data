dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()

-- add always cast
component_read(GetUpdatedComponentID(), { mTimesExecuted = 0 }, function(comp)
	if comp.mTimesExecuted < 1 then AddGunActionPermanent( entity_id, "HITFX_CRITICAL_WATER" ) end
end)

-- change visuals and UI texts
local path = "data/items_gfx/wands/custom/vasta.png"
local name ="$item_vasta"
component_write( EntityGetFirstComponent(entity_id, "SpriteComponent"), {
	image_file = path,
	offset_x = 3,
	offset_y = 6.5,
})

component_write( EntityGetFirstComponent(entity_id, "ItemComponent"), {
	ui_sprite = path,
	item_name = name,
	always_use_item_name_in_ui = true
})
