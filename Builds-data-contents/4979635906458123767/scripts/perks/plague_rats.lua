dofile( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local targets = EntityGetWithTag( "homing_target" )

if ( targets ~= nil ) then
	for i,target_id in ipairs(targets) do
		local tx, ty = EntityGetTransform( target_id )
		local distance = math.abs( ty - y ) + math.abs( ty - y )
		
		if ( distance < 160 ) then
			local variablestorages = EntityGetComponent( target_id, "VariableStorageComponent" )
			local plague_found = false
			
			if ( variablestorages ~= nil ) then
				for j,storage_id in ipairs(variablestorages) do
					local var_name = ComponentGetValue( storage_id, "name" )
					if ( var_name == "plague_rats" ) then
						plague_found = true
					end
				end
			end
			
			if ( plague_found == false ) then
				EntityAddComponent( target_id, "VariableStorageComponent", 
				{ 
					name = "plague_rats",
				} )
				
				EntityAddComponent( target_id, "LuaComponent", 
				{ 
					script_death = "data/scripts/perks/plague_rats_death.lua",
					execute_every_n_frame = "-1",
				} )
			end
		end
	end
end