dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )
	
	local player_id = 0
	
	local models = EntityGetComponent( entity_id, "VariableStorageComponent" )
	for i,v in ipairs( models ) do
		local name = ComponentGetValue2( v, "name" )
		if ( name == "mana_from_kills" ) then
			player_id = ComponentGetValue2( v, "value_int" )
		end
	end
	
	if ( player_id ~= nil ) and ( player_id ~= NULL_ENTITY ) then
		local eid = EntityLoad( "data/entities/misc/perks/mana_from_kills_effect.xml", pos_x, pos_y )
		EntityAddChild( player_id, eid )
	end
end