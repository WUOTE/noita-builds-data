function interacting( entity_who_interacted, entity_interacted, interactable_name )
	local parent = EntityGetParent( entity_interacted )
	local x,y = EntityGetTransform( entity_interacted )
	GamePlaySound( "data/audio/Desktop/materials.snd", "collision/metalhollow", x, y )

	GameEntityPlaySound( parent, "00" )
	EntitySetComponentsWithTagEnabled( parent, "fx", true )
	EntityKill( entity_interacted )
end