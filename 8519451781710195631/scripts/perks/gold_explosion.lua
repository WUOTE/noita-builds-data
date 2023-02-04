dofile_once("data/scripts/lib/utilities.lua")

if GameHasFlagRun( "exploding_gold" ) then
	local entity_id = GetUpdatedEntityID()
	
	local eid = EntityLoad( "data/entities/misc/perks/gold_explosion.xml" )
	EntityAddChild( entity_id, eid )
	
	local value = 10
	
	local comps = EntityGetComponent( entity_id, "VariableStorageComponent" )
	
	if ( comps ~= nil ) then
		for j,comp in ipairs( comps ) do
			local name = ComponentGetValue2( comp, "name" )
			
			if ( name == "gold_value" ) then
				value = ComponentGetValue2( comp, "value_int" )
				break
			end
		end
	end
	
	local exp_radius = ( value / ( 10 + value * 0.01 ) ) + 8
	local exp_shake = ( value / ( 10 + value * 0.01 ) ) + 8
	local exp_damage = ( ( value / ( 10 + value * 0.01 ) ) + 1 ) * 0.4
	
	local exp_sparks_min = math.max( 5, math.floor( exp_radius * 0.75 ) )
	local exp_sparks_max = math.max( 10, math.floor( exp_radius * 1.25 ) )
	
	edit_component( eid, "ExplosionComponent", function(comp,vars)
		ComponentObjectSetValue( comp, "config_explosion", "explosion_radius", exp_radius )
		ComponentObjectSetValue( comp, "config_explosion", "camera_shake", exp_radius )
		ComponentObjectSetValue( comp, "config_explosion", "damage", exp_damage )
		
		ComponentObjectSetValue( comp, "config_explosion", "sparks_count_min", exp_sparks_min )
		ComponentObjectSetValue( comp, "config_explosion", "sparks_count_max", exp_sparks_max )
	end)
end