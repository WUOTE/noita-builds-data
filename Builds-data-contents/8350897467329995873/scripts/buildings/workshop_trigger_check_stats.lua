dofile( "data/scripts/lib/utilities.lua" )

function collision_trigger()
	local entity_id    = GetUpdatedEntityID()
	local x, y = EntityGetTransform( entity_id )

	-- Note! 
	--  * For global stats use StatsGetValue("enemies_killed")
	--  * For biome stats use StatsBiomeGetValue("enemies_killed")
	--
	-- the difference is that StatsBiomeGetValue() tracks the stats diff since calling StatsResetBiome()
	-- which is what workshop_exit calls
	--
	--
	-- this does the workshop rewards for playing in a certain way
	-- 1) killed none

	local enemies_killed = tonumber( StatsBiomeGetValue("enemies_killed") )
	print(enemies_killed)
	if( enemies_killed == 0 ) then
		print("KILLED NONE")
		EntityLoad( "data/entities/items/pickup/chest_random.xml", x, y )
	else
		print("KILLED ALL")
	end
end