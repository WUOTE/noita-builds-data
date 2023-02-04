function spawn_worm()
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	-- Do some kind of an effect? throw some particles into the air?
	EntityLoad( "data/entities/animals/worm.xml", pos_x, pos_y )
	EntityKill( entity_id )
end

function damage_received( damage, desc, entity_who_caused, is_fatal )
	-- print(damage)
	if( is_fatal or Random(0,100) < 10 ) then
		spawn_worm()
	end
end
