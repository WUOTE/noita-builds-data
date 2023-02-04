dofile( "data/scripts/lib/utilities.lua" )

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	-- kill self
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )

	-- do some kind of an effect? throw some particles into the air?

	if (Random(1,2) == 2) then
		EntityLoad( "data/entities/items/pickup/heart.xml", pos_x, pos_y )
	end

	--EntityKill( entity_id )
end