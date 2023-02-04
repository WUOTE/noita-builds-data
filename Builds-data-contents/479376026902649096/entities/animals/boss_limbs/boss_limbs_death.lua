dofile( "data/scripts/lib/utilities.lua" )

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	-- kill self
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )

	-- do some kind of an effect? throw some particles into the air?
	EntityLoad( "data/entities/items/pickup/heart.xml", pos_x - 16, pos_y )
	EntityLoad( "data/entities/items/wand_unshuffle_04.xml", pos_x, pos_y )
	
	SetRandomSeed( x, y * GameGetFrameNum() )
	local opts = { "ADD_TRIGGER", "ADD_TIMER", "ADD_DEATH_TRIGGER", "DAMAGE_RANDOM" }
	local rnd = Random( 1, #opts )
	
	for i=1,4 do
		CreateItemActionEntity( opts[i], x - 8 * 4 + (i-1) * 16, y )
	end
	
	AddFlagPersistent( "card_unlocked_pyramid" )

	--EntityKill( entity_id )
end