dofile( "data/scripts/magic/alchemy.lua" )

function alchemy_init()
	local values = ""
	for k,v in pairs(g_ingest_materials) do
		values = values .. k .. ","
	end

	local entity_id = GetUpdatedEntityID()
	local ingestion_component = EntityGetFirstComponent( entity_id, "IngestionComponent" )

	-- ingestible_materials
	--print( values )
	ComponentSetMetaCustom( ingestion_component, "ingestible_materials", values)
end

alchemy_init()