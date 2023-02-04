function AddGunActionPermanent( entity_id, action_id )
	local action_entity_id = CreateItemActionEntity( action_id )
	if action_entity_id ~= nil then
		EntityAddChild( entity_id, action_entity_id )
	end

	edit_component( action_entity_id, "ItemComponent", function(comp, vars)
		vars.permanently_attached = "1"
	end)

	if action_entity_id ~= nil then
		EntitySetComponentsWithTagEnabled( action_entity_id, "enabled_in_world", false )
	end
end

function AddGunAction( entity_id, action_id )
	local action_entity_id = CreateItemActionEntity( action_id )
	if action_entity_id ~= 0 then
		EntityAddChild( entity_id, action_entity_id )
		EntitySetComponentsWithTagEnabled( action_entity_id, "enabled_in_world", false )
	end
end