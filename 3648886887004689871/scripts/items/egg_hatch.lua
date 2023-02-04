dofile( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local components = EntityGetComponent( entity_id, "VariableStorageComponent" )
local entity_list_name = "monsters"

for key,comp_id in pairs(components) do
	print("sdgsdg")
	local var_name = ComponentGetValue( comp_id, "name" )
	if ( var_name == "entity_list" ) then
		entity_list_name = ComponentGetValue( comp_id, "value_string" )
	end
end

local entity_lists = 
{
monsters = { "zombie", "zombie", "bigzombie", "skullrat" },
slimes = { "slimeshooter", "slimeshooter", "acidshooter", "lasershooter" },
worms = { "worm_tiny", "worm", "worm_big" },
}

SetRandomSeed( x - 437, y + 235 )

local options = entity_lists[entity_list_name]
local opts = #options
local rnd = 1

for i=1,opts do
	rnd = math.min(rnd + math.min(math.max(Random(1, 8) - 7, 0), 1), opts)
	print(rnd)
end
local option = "data/entities/animals/" .. options[rnd] .. ".xml"

local eid = EntityLoad( option, x, y )

if ( entity_list_name ~= "worms" ) then
	GetGameEffectLoadTo( eid, "CHARM", true )
end