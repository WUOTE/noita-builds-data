dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

-- add always cast
local entity_id = GetUpdatedEntityID()
AddGunActionPermanent( entity_id, "HITFX_EXPLOSION_ALCOHOL" )

-- change visuals and UI texts
local path = "data/items_gfx/wands/custom/vihta.png"
local name ="$item_vihta"
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
