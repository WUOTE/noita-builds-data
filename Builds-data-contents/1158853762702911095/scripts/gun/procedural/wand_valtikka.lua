dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

local name = "$item_wand_valtikka"
local action = "PIERCING_SHOT"
local sprite_path = "data/items_gfx/wands/custom/scepter_01.png"
local sprite_offset_x = 3
local sprite_offset_y = 5

local entity_id = GetUpdatedEntityID()

-- add always cast
component_read(GetUpdatedComponentID(), { mTimesExecuted = 0 }, function(comp)
	if comp.mTimesExecuted < 1 then AddGunActionPermanent( entity_id, action ) end
end)

-- change visuals and UI texts
component_write( EntityGetFirstComponent(entity_id, "SpriteComponent"), {
	image_file = sprite_path,
	offset_x = sprite_offset_x,
	offset_y = sprite_offset_y,
})

component_write( EntityGetFirstComponent(entity_id, "ItemComponent"), {
	ui_sprite = sprite_path,
	item_name = name,
	always_use_item_name_in_ui = true
})
