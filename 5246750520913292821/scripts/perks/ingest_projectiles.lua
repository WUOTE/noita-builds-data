dofile_once("data/scripts/lib/utilities.lua")

function damage_received( damage, desc, entity_who_caused, is_fatal )
	local ingest_chance = 0.33
	local ingestion_damage_scale = 250
	local max_ingestion = 150

	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )

	if desc ~= "$damage_projectile" or ProceduralRandomf(GameGetFrameNum(), pos_y) > ingest_chance
	then
		return
	end

	local ingestion = math.min(damage * ingestion_damage_scale, max_ingestion)
	EntityIngestMaterial( entity_id, CellFactory_GetType("water"), ingestion)

	-- apply ingested damage back to health
	-- TODO: replace with canceling incoming damage or otherwise avoid damage text and fx etc
	edit_component( entity_id, "DamageModelComponent", function(comp,vars)
		local hp = ComponentGetValue2( comp, "hp")
		hp = hp + damage
		ComponentSetValue2(comp, "hp", hp)
	end)

	-- TODO: play audio

	--print("Ingested " .. damage .. " hp as " .. ingestion .. " ingestion.")
end
