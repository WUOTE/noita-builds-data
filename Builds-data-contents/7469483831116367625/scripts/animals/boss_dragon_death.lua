dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	-- kill self
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )

	-- do some kind of an effect? throw some particles into the air?
	EntityLoad( "data/entities/items/pickup/heart.xml", pos_x - 16, pos_y )
	EntityLoad( "data/entities/items/wand_unshuffle_06.xml", pos_x + 16, pos_y )
	
	AddFlagPersistent( "miniboss_dragon" )

	--EntityKill( entity_id )
end