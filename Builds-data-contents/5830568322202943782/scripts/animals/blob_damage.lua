dofile_once("data/scripts/lib/utilities.lua")

function damage_received( damage, desc, entity_who_caused, is_fatal )
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )

	if( entity_who_caused == entity_id ) then return end

	local herd_id = component_get_value( entity_id, "GenomeDataComponent", "herd_id", 0 )

	edit_component( entity_id, "ControlsComponent", function(comp,vars)
		ComponentSetValueVector2( comp, "mJumpVelocity", Random(-70, 70), Random(-150, -300))
	end)
	
	local health = 0
	
	edit_component( entity_id, "DamageModelComponent", function(comp,vars)
		health = tonumber(ComponentGetValue( comp, "hp"))
	end)
	
	local new_health = health - damage
	
	health = (health * 10) % 5
	new_health = (new_health * 10) % 5
	
	local hpdiff = health - new_health
	
	if (hpdiff < 0) then
		GameEntityPlaySound( entity_id, "duplicate" )
		local e = EntityLoad( "data/entities/animals/miniblob.xml", pos_x, pos_y )
	end
end
