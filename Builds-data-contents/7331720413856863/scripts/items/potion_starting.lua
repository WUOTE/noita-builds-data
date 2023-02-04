 dofile_once("data/scripts/lib/utilities.lua")

-- NOTE( Petri ): 
-- There is a mods/nightmare potion.lua which overwrites this one.

materials_standard = 
{
	{
		material="water",
		cost=200,
	},
	{
		material="blood",
		cost=200,
	},
	{
		material="alcohol",
		cost=200,
	},
	{
		material="oil",
		cost=200,
	},
	{
		material="slime",
		cost=200,
	},
	{
		material="acid",
		cost=400,
	},
	{
		material="radioactive_liquid",
		cost=300,
	},
	{
		material="gunpowder_unstable",
		cost=400,
	},
}

materials_magic = 
{
	{
		material="magic_liquid_polymorph",
		cost=500,
	},
	{
		material="magic_liquid_random_polymorph",
		cost=500,
	},
	{
		material="magic_liquid_berserk",
		cost=500,
	},
	{
		material="magic_liquid_charm",
		cost=800,
	},
	{
		material="magic_liquid_movement_faster",
		cost=800,
	},
}

function init( entity_id )
	local x,y = EntityGetTransform( entity_id )
	SetRandomSeed( x, y ) -- so that all the potions will be the same in every position with the same seed
	local potion_material = "water"

	local n_of_deaths = tonumber( StatsGlobalGetValue("death_count") )
	if( n_of_deaths >= 1 ) then

		if( Random( 0, 100 ) <= 50 ) then
			potion_material = random_from_array( materials_magic )
			potion_material = potion_material.material
		else
			potion_material = random_from_array( materials_standard )
			potion_material = potion_material.material
		end

	end

	-- load the material from VariableStorageComponent
	local components = EntityGetComponent( entity_id, "VariableStorageComponent" )

	if( components ~= nil ) then
		for key,comp_id in pairs(components) do 
			local var_name = ComponentGetValue( comp_id, "name" )
			if( var_name == "potion_material") then
				potion_material = ComponentGetValue( comp_id, "value_string" )
			end
		end
	end

	
	local year,month,day = GameGetDateAndTimeLocal()
	
	if ((( month == 5 ) and ( day == 1 )) or (( month == 4 ) and ( day == 30 ))) and (Random( 0, 100 ) <= 20) then
		potion_material = "sima"
	end

	AddMaterialInventoryMaterial( entity_id, potion_material, 1000 )
end