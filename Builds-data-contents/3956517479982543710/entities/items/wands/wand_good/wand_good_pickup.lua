dofile( "data/scripts/game_helpers.lua" )
dofile( "data/scripts/lib/utilities.lua" )

function item_pickup( entity_item, entity_who_picked, item_name )
	local good_wands = EntityGetWithTag( "wand_good" )
	
	if ( good_wands ~= nil ) and ( good_wands ~= NULL_ENTITY ) then
		for i,entity_id in ipairs(good_wands) do
			if ( entity_id ~= entity_item ) then
				EntityKill( entity_id )
			end
		end
	end
end
