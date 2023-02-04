dofile( "data/scripts/game_helpers.lua" )
dofile( "data/scripts/lib/utilities.lua" )

function item_pickup( entity_item, entity_who_picked, item_name )
	local pos_x, pos_y = EntityGetTransform( entity_item )
	
	local components = EntityGetComponent( entity_item, "VariableStorageComponent" )
	local orbcomp = EntityGetComponent( entity_item, "OrbComponent" )
	local orb_id = -1
	
	for key,comp_id in pairs(orbcomp) do 
		orb_id = ComponentGetValueInt( comp_id, "orb_id" )
	end
	
	if (orb_id > -1) then
		if( GameGetOrbCollectedAllTime(orb_id) or GameIsDailyRun() ) then
			shoot_projectile( entity_id, "data/entities/items/pickup/heart.xml", pos_x, pos_y, 0, 0 )
		else
			for key,comp_id in pairs(components) do 
				local var_name = ComponentGetValue( comp_id, "name" )
				if( var_name == "card_name") then
					local load_me = ComponentGetValue( comp_id, "value_string" )
					CreateItemActionEntity( load_me, pos_x, pos_y )
				end
			end
		end
	end
	
	local x,y = EntityGetTransform( entity_who_picked )
	local child_id = EntityLoad( "data/entities/misc/orb_boss_scream.xml", x, y )
	EntityAddChild( entity_who_picked, child_id )
	
	shoot_projectile( entity_id, "data/entities/particles/image_emitters/orb_effect.xml", pos_x, pos_y, 0, 0 )
	EntityKill( entity_item )
end