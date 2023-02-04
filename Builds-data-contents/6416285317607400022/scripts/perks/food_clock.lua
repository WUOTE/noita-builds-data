dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local comp = EntityGetFirstComponent( entity_id, "IngestionComponent" )

if ( comp ~= nil ) then
	local count = ComponentGetValue2( comp, "ingestion_size" )
	local damage = 0.12
	
	if ( count == 0 ) then
		EntityInflictDamage( entity_id, damage, "DAMAGE_CURSE", "$damage_hunger", "NONE", 0, 0, entity_id )
	end
end