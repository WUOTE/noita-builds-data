function play_animation( entity_id, animation_name )
	local sprite_components = EntityGetComponent( entity_id, "SpriteComponent" )
	if( sprite_components ~= nil ) then
		for i,v in ipairs(sprite_components) do
			ComponentSetValue( v, "rect_animation", animation_name)
		end
	end
end

function heal_entity( entity_id, heal_amount )

	local damagemodels = EntityGetComponent( entity_id, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			local max_hp = tonumber( ComponentGetValue2( damagemodel, "max_hp" ) )
			local current_hp = tonumber( ComponentGetValue2( damagemodel, "hp" ) )
			current_hp = math.min( current_hp + heal_amount, max_hp )
			
			ComponentSetValue2( damagemodel, "hp", current_hp )

			-- gfx effect
			local x, y = EntityGetTransform( entity_id )
			local entity_fx = EntityLoad( "data/entities/particles/heal_effect.xml", x, y )
			EntityAddChild( entity_id, entity_fx )
		end
	end
end

function load_gold_entity( entity_filename, x, y, remove_timer )
	local gold_entity = EntityLoad( entity_filename, x, y )
	if( remove_timer ) then
		local lifetime_components = EntityGetComponent( gold_entity, "LifetimeComponent" )
		if( lifetime_components ~= nil ) then
			for i,lifetime_comp in ipairs(lifetime_components) do
				EntityRemoveComponent( gold_entity, lifetime_comp )
			end
		end
	end
	return gold_entity
end