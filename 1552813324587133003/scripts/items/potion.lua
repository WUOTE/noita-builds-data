 dofile( "data/scripts/lib/utilities.lua" )

local materials_standard = 
{
	{
		material="lava",
		cost=300,
	},
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
	{
		material="liquid_fire",
		cost=400,
	},
	{
		material="blood_cold",
		cost=300,
	}
}

local materials_magic = 
{
	{
		material="magic_liquid_teleportation",
		cost=500,
	},
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
		material="magic_liquid_invisibility",
		cost=800,
	}
}


local entity_id = GetUpdatedEntityID()
local x,y = EntityGetTransform( entity_id )
SetRandomSeed( x, y )
-- so that all the potions will be the same in every position with the same seed
-- local potion = random_from_array( potions )
local potion_material = "water"

if( Random( 0, 100 ) <= 75 ) then
	-- 0.05% chance of magic_liquid_
	if( Random( 0, 100000 ) <= 50 ) then
		potion_material = "magic_liquid_hp_regeneration"
	else
		potion_material = random_from_array( materials_magic )
		potion_material = potion_material.material
	end
else
	potion_material = random_from_array( materials_standard )
	potion_material = potion_material.material
end


-- AddMaterialInventoryMaterial( entity_id, potion.material, 1000 )
AddMaterialInventoryMaterial( entity_id, potion_material, 1000 )