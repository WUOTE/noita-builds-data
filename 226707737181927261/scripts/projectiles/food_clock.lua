dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local comp2 = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

if ( comp2 ~= nil ) then
	local player_id = ComponentGetValue2( comp2, "mWhoShot" )
	
	if ( player_id ~= NULL_ENTITY ) and ( player_id ~= nil ) then
		local comp = EntityGetFirstComponent( player_id, "IngestionComponent" )

		if ( comp ~= nil ) then
			local damage_add = 1.6
			local count_max = ComponentGetValue2( comp, "ingestion_capacity" )
			local count = ComponentGetValue2( comp, "ingestion_size" ) - math.floor( count_max * 0.6 )
			local percent = math.max( count, 0 ) / count_max
			
			if ( percent > 1.0 ) then
				percent = 1.0 + math.log( percent )
			end
			
			local currdamage = ComponentGetValue2( comp2, "damage" )
			local healing = ComponentObjectGetValue2( comp2, "damage_by_type", "healing" )
			
			if ( healing == 0 ) then
				ComponentSetValue2( comp2, "damage", currdamage + damage_add * percent )
			end
		end
	end
end