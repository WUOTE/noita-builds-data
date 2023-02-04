function play_animation( entity_id, animation_name )
	local sprite_components = EntityGetComponent( entity_id, "SpriteComponent" )
	if( sprite_components ~= nil ) then
		for i,v in ipairs(sprite_components) do
			ComponentSetValue( v, "rect_animation", animation_name)
		end
	end
end