dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local comp2 = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

if ( comp2 ~= nil ) then
	local player_id = ComponentGetValue2( comp2, "mWhoShot" )
	
	if ( player_id ~= NULL_ENTITY ) and ( player_id ~= nil ) then
		local comp = EntityGetFirstComponent( player_id, "IngestionComponent" )

		if ( comp ~= nil ) then
			local damage_add = 1.0
			local count = ComponentGetValue2( comp, "ingestion_size" )
			local count_max = ComponentGetValue2( comp, "ingestion_capacity" )
			local percent = count / count_max
			
			print( tostring( damage_add * percent ) )
			
			local currdamage = ComponentGetValue2( comp2, "damage" )
			ComponentSetValue2( comp2, "damage", currdamage + damage_add * percent )
		end
	end
end