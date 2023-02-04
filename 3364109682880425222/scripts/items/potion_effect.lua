dofile( "data/scripts/lib/utilities.lua")
dofile( "data/scripts/game_helpers.lua" )

function item_pickup( entity_item, entity_who_picked, name )
	local x, y = EntityGetTransform( entity_item )
	local color = GameGetPotionColorUint( entity_item )

	local entity = EntityLoad("data/entities/particles/image_emitters/potion_effect.xml", x, y-8)

	edit_component( entity, "ParticleEmitterComponent", function(comp,vars)
		vars.color = color
	end)
end
 