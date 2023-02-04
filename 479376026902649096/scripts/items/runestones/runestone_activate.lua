dofile_once("data/scripts/lib/utilities.lua")

function kick()
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	local status = 0
	
	local variablestorages = EntityGetComponent( entity_id, "VariableStorageComponent" )
	if ( variablestorages ~= nil ) then
		for j,storage_id in ipairs(variablestorages) do
			local var_name = ComponentGetValue( storage_id, "name" )
			if ( var_name == "active" ) then
				status = ComponentGetValue( storage_id, "value_int" )
				
				status = 1 - status
				
				ComponentSetValue2( storage_id, "value_int", status )
				
				if ( status == 1 ) then
					EntitySetComponentsWithTagEnabled( entity_id, "activate", true )
				else
					EntitySetComponentsWithTagEnabled( entity_id, "activate", false )
				end
			end
		end
	end
end

function item_pickup( entity_id )
	local variablestorages = EntityGetComponent( entity_id, "VariableStorageComponent" )
	if ( variablestorages ~= nil ) then
		for j,storage_id in ipairs(variablestorages) do
			local var_name = ComponentGetValue( storage_id, "name" )
			if ( var_name == "active" ) then
				status = ComponentGetValue( storage_id, "value_int" )
				
				local status = 0
				
				ComponentSetValue2( storage_id, "value_int", status )
				
				if ( status == 1 ) then
					EntitySetComponentsWithTagEnabled( entity_id, "activate", true )
				else
					EntitySetComponentsWithTagEnabled( entity_id, "activate", false )
				end
			end
		end
	end
end