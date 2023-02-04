function damage_received( damage, desc, entity_who_caused, is_fatal )
	if( Random(0,100) < 60 ) then
		local entity_id    = GetUpdatedEntityID()
		local pos_x, pos_y = EntityGetTransform( entity_id )
		EntityLoad( "data/entities/animals/boss_dragon.xml", pos_x, pos_y - 16 )
	end
end
