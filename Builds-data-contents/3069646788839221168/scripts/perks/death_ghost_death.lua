dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )
	
	local extra_hp = math.max( 0, pos_y * 0.0002 )
	local extra_damage = math.max( 0, pos_y * 0.0001 )
	local rats = EntityGetWithTag( "death_ghost" )
	
	if ( #rats < 20 ) then
		EntityLoad( "data/entities/misc/perks/death_ghost.xml", pos_x, pos_y )
	end
end