dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local x, y = EntityGetTransform( GetUpdatedEntityID() )
	local flag_status = HasFlagPersistent( "card_unlocked_duplicate" )
	
	SetRandomSeed( x, y * GameGetFrameNum() )
	local opts = { "DUPLICATE", "DAMAGE_RANDOM", "RANDOM_SPELL", "RANDOM_PROJECTILE", "RANDOM_MODIFIER", "RANDOM_STATIC_PROJECTILE", "DRAW_RANDOM", "DRAW_RANDOM_X3", "DRAW_3_RANDOM", "ALPHA", "OMEGA", "ADD_TRIGGER", "ADD_TIMER", "ADD_DEATH_TRIGGER", "GAMMA" }
	local rnd = Random( 1, #opts )
	
	if flag_status then
		CreateItemActionEntity( opts[rnd], x, y )
	else
		CreateItemActionEntity( "OMEGA", x, y )
		EntityLoad( "data/entities/items/pickup/heart_fullhp.xml",  x, y )
	end
	
	EntityLoad( "data/entities/animals/boss_alchemist/key.xml",  x, y )
	
	AddFlagPersistent( "card_unlocked_duplicate" )
	AddFlagPersistent( "miniboss_alchemist" )
end