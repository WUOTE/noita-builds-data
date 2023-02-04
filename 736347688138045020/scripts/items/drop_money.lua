dofile( "data/scripts/lib/utilities.lua" )


function do_money_drop( amount_multiplier )
	
	if ( GameGetIsTrailerModeEnabled() ) then return end

	local entity = GetUpdatedEntityID()

	local no_gold_drop = false
	edit_component_with_tag( entity, "VariableStorageComponent", "no_gold_drop", function(comp,vars) no_gold_drop = true end )
	
	if no_gold_drop then
		return
	end

	local amount = 1

	edit_component( entity, "DamageModelComponent", function(comp,vars)
		local health = tonumber(ComponentGetValue( comp, "max_hp"))

		if health > 1.0 then
			amount = math.floor(health)
		end

	end)

	amount = amount * amount_multiplier
	if( amount > ( 15 * amount_multiplier ) ) then
		amount = 15 * amount_multiplier
	end


	for i=1,amount do
		local x, y = EntityGetTransform( entity )
		EntityLoad( "data/entities/items/pickup/goldnugget.xml", x, y-8 )
	end

end

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	do_money_drop( 1 )
end