dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/magic/symbol_oneoff_spells.lua" )

g_ingest_materials =
{
	["urine"] = 
	{
		func = function( entity_id, count )
			print( "drinking pee" )
		end,
	},

	["pea_soup"] = 
	{
		func = function( entity_id, count )
			local entity_game_effect = EntityLoad( "data/entities/misc/effect_farts.xml")
			EntityAddChild( entity_id, entity_game_effect )
			-- print( "pea soup" )
		end,
	},

	["water"] = 
	{
		func = function( entity_id, count )
			-- extra_hp(0,0)
			-- local entity_game_effect = EntityLoad( "data/entities/misc/effect_farts.xml")
			-- EntityAddChild( entity_id, entity_game_effect )
			-- print( "pea soup" )
		end,
	},

	["meat"] = 
	{
		func = function( entity_id, count )
			edit_component( entity_id, "DamageModelComponent", function(comp,vars)
				vars.hp     = ComponentGetValueFloat( comp, "hp" ) + count * 0.0
			end)
		end,
	},

--[[
	["oil"] = 
	{
		func = function( entity_id, count )
			-- extra_hp(0,0)
			local entity_game_effect = EntityLoad( "data/entities/misc/effect_farts.xml")
			EntityAddChild( entity_id, entity_game_effect )
			-- print( "pea soup" )
		end,
	},
]]--
}

function inhaled_material( material, count )
	-- print( material, count )
end

function ingested_material( material, count )
	if( g_ingest_materials[material] == nil ) then
		return
	end

	-- print( "material: " .. material )
	local entity_id = GetUpdatedEntityID()
	local m = g_ingest_materials[material]
	if( m.func ~= nil ) then m.func( entity_id, count ) end
end
