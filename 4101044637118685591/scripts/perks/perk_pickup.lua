dofile( "data/scripts/game_helpers.lua" )
dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/perks/perk_list.lua" )

function item_pickup( entity_item, entity_who_picked, item_name )
	-- fetch perk info ---------------------------------------------------

	local pos_x, pos_y = EntityGetTransform( entity_item )
	
	local perk_name = "PERK_NAME_NOT_DEFINED"
	local perk_desc = "PERK_DESCRIPTION_NOT_DEFINED"
	
	edit_component( entity_item, "ItemComponent", function(comp,vars)
		perk_name = ComponentGetValue( comp, "item_name")
		perk_desc = ComponentGetValue( comp, "ui_description")
	end)

	local perk_id = ""
	edit_component( entity_item, "VariableStorageComponent", function(comp,vars)
		perk_id = ComponentGetValue( comp, "value_string" )
	end)

	local perk_data = get_perk_with_id( perk_list, perk_id )
	if perk_data == nil then
		return
	end

	-- load perk for entity_who_picked -----------------------------------

	local flag_name = get_perk_picked_flag_name(perk_id) 
	GameAddFlagRun( flag_name )
	AddFlagPersistent( string.lower(flag_name) )

	-- add game effect
	if perk_data.game_effect ~= nil then
		local game_effect_comp = GetGameEffectLoadTo( entity_who_picked, perk_data.game_effect, true )
		if game_effect_comp ~= nil then
			ComponentSetValue( game_effect_comp, "frames", "-1" )
		end
	end

	if perk_data.func ~= nil then
		perk_data.func( entity_item, entity_who_picked, item_name )
	end

	-- add ui icon etc
	local entity_ui = EntityCreateNew( "" )
	EntityAddComponent( entity_ui, "UIIconComponent", 
	
	{ 
		name = perk_data.ui_name,
		description = perk_data.ui_description,
		icon_sprite_file = perk_data.ui_icon
	})
	EntityAddChild( entity_who_picked, entity_ui )

	-- cosmetic fx -------------------------------------------------------

	EntityLoad( "data/entities/particles/image_emitters/perk_effect.xml", pos_x, pos_y )
	GamePrintImportant( GameTextGet( "$log_pickedup_perk", GameTextGetTranslatedOrNot( perk_name ) ), perk_desc )
	
	-- remove all perk items (also this one!) ----------------------------
	local perk_destroy_chance = tonumber( GlobalsGetValue( "TEMPLE_PERK_DESTROY_CHANCE", "100" ) )
	SetRandomSeed( pos_x, pos_y )

	if( Random( 1, 100 ) <= perk_destroy_chance ) then
		-- removes all the perks
		local all_perks = EntityGetWithTag( "perk" )
	
		if (all_perks ~= nil) then
			for i,entity_perk in ipairs(all_perks) do
				EntityKill( entity_perk )
			end
		end
	end
end