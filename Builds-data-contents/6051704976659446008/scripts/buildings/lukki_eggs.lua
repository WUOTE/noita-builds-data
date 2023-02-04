function spawn_lukki()
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	-- Do some kind of an effect? throw some particles into the air?
	GamePlaySound( "data/audio/Desktop/animals.snd", "lukki_eggs/destroy", pos_x, pos_y )
	EntityLoad( "data/entities/animals/lukki/lukki_tiny.xml", pos_x, pos_y )
end

function damage_received( damage, desc, entity_who_caused, is_fatal )
	-- print(damage)
	if ( is_fatal or Random(0,100) < 10 ) and ( damage > 0.1 ) then
		spawn_lukki()
	end
end
