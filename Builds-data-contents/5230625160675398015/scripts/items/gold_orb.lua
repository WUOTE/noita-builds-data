dofile_once("data/scripts/lib/utilities.lua")

function drop()
	local entity_id    = GetUpdatedEntityID()
	local x, y = EntityGetTransform( entity_id )
	
	local comp = EntityGetFirstComponent( entity_id, "VariableStorageComponent", "kick_count" )
	
	if ( comp ~= nil ) then
		local count = ComponentGetValue2( comp, "value_int" )
		count = count + 1
		ComponentSetValue2( comp, "value_int", count )
		
		SetRandomSeed( x + entity_id, y - GameGetFrameNum() )
		
		local outcome = Random( 1, 26 )
		
		if ( count == 1 ) then
			outcome = 10
		elseif ( count > 3 ) then
			outcome = math.max( 1, outcome - ( count - 2 ) )
		end
		
		-- print( tostring( outcome ) )
		
		if ( outcome == 1 ) then
			EntityLoad( "data/entities/projectiles/deck/explosion.xml", x, y )
			EntityKill( entity_id )
			return
		elseif ( outcome == 20 ) then
			EntityLoad( "data/entities/items/pickup/goldnugget_200.xml", x, y )
		elseif ( outcome == 15 ) then
			EntityLoad( "data/entities/items/pickup/goldnugget_50.xml", x + 8, y )
			EntityLoad( "data/entities/items/pickup/goldnugget_50.xml", x - 8, y )
		elseif ( outcome < 10 ) then
			EntityLoad( "data/entities/items/pickup/goldnugget_10.xml", x, y )
		else
			EntityLoad( "data/entities/items/pickup/goldnugget_10.xml", x + 8, y )
			EntityLoad( "data/entities/items/pickup/goldnugget_10.xml", x - 8, y )
		end
	end
end

function kick()
	drop()
end