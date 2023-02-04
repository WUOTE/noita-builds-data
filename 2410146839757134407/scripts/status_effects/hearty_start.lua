dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local player_id = EntityGetParent( entity_id )
local x, y = EntityGetTransform( entity_id )

if ( player_id ~= NULL_ENTITY ) and ( entity_id ~= player_id ) then
	local variablestorages = EntityGetComponent( entity_id, "VariableStorageComponent" )
	local dcomps = EntityGetComponent( player_id, "DamageModelComponent" )
	local hpdiff = 0.0

	if ( dcomps ~= nil ) then
		for j,comp in ipairs( dcomps ) do
			local hp = ComponentGetValue2( comp, "hp" )
			local max_hp = ComponentGetValue2( comp, "max_hp" )
			
			local diff = hp / max_hp
			hpdiff = max_hp
			
			max_hp = max_hp * 0.5
			hp = math.max( max_hp * diff, 0.04 )
			
			ComponentSetValue2( comp, "max_hp", max_hp )
			ComponentSetValue2( comp, "hp", hp )
		end
	end

	if ( variablestorages ~= nil ) then
		for j,storage_id in ipairs( variablestorages ) do
			local var_name = ComponentGetValue( storage_id, "name" )
			if ( var_name == "effect_hearty" ) then
				ComponentSetValue2( storage_id, "value_float", hpdiff )
				break
			end
		end
	end
end