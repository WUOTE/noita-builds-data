
function spawn_rewards(x, y)
	
	local MAX_ORB_COUNT = 12

	local enemies_killed = tonumber( StatsGetValue("enemies_killed") )
	local time_in_seconds = tonumber( StatsGetValue("playtime") )
	local projectiles_shot = tonumber( StatsGetValue("projectiles_shot") )
	local money_now = tonumber( StatsGetValue("gold") )
	local money_all_time = tonumber( StatsGetValue("gold_all") )
	local orbs = tonumber( GameGetOrbCountThisRun() )

	local e_id = EntityGetClosestWithTag( x, y, "player_unit")
	local wallet_comp = EntityGetFirstComponent( entity_item, "WalletComponent" )

	if( wallet_comp ~= nil ) then 
		money_now = tonumber( ComponentGetValue( wallet_comp, "money" ) )
		money_all_time = money_now + tonumber( ComponentGetValue( wallet_comp, "money_spent" ) )
	end

	print( "enemies_killed: " .. tostring(enemies_killed) )
	print( "time_in_seconds: " .. tostring(time_in_seconds) )
	print( "projectiles_shot: " .. tostring(projectiles_shot) )
	print( "money_now: " .. tostring(money_now ) )
	print( "money_all_time: " .. tostring(money_all_time ) )
	print( "orbs collected: " .. tostring( orbs ) )

	-- less than 1 minutes -> minit watering can
	-- less than 5 minutes
	-- - 0 kills -> pacifist
	-- - 0 gold picked up (0 logo)
	-- - over 500k
	--- over 1milj

	-- TODO: - over 1000000

	local spawned_n = 0
	local entity = 0

	-- pacifist
	if( enemies_killed <= 0 ) then
		entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/reward_peace.xml", x, y )
		spawned_n = spawned_n + 1
	end


	-- time
	if( time_in_seconds <= 60.0 ) then
		entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/reward_minit.xml", x + spawned_n * 20, y - spawned_n * 10 )
		spawned_n = spawned_n + 1
	elseif( time_in_seconds <= 5 * 60 ) then
		entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/reward_clock.xml", x + spawned_n * 20, y - spawned_n * 10 )
		spawned_n = spawned_n + 1
	end

	-- orbs
	if( orbs >= MAX_ORB_COUNT ) then
		entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/reward_crown.xml", x + spawned_n * 20, y - spawned_n * 10 )
		spawned_n = spawned_n + 1
	end

	-- money
	if( money_all_time <= 0 ) then
		entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/reward_nolla.xml", x + spawned_n * 20, y - spawned_n * 10 )
		spawned_n = spawned_n + 1
	end

	if( money_now >= 1000000 ) then
		EntityLoad( "data/entities/animals/boss_centipede/rewards/giant_dollar.xml", x + 100, y - 75 )
		-- entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/reward_nolla.xml", x + spawned_n * 20, y - spawned_n * 10 )
	end
	if( money_now >= 500000 ) then
		entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/reward_dollar.xml", x + spawned_n * 20, y - spawned_n * 10 )
		spawned_n = spawned_n + 1
	end

	if( spawned_n <= 0 ) then
		entity = EntityLoad( "data/entities/animals/boss_centipede/rewards/gold_reward.xml", x, y )
	end

end