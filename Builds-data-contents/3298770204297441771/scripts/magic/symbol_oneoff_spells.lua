dofile("data/scripts/magic/magic_utilities.lua")

-------------------

-- NOTE: this file is parsed with a simple parser to find spell function names. 
--       this file should only contain functions that map directly to actual spells.
--       any utility functions should be put to "magic_utilities.lua" or other files.

-------------------

function extra_life(x,y)
	GamePrint( "1 UP" )

	local players = get_players()
	if players == nil  then return end

	for i,player in ipairs(players) do
		local stats = GameGetPlayerStatsEntity( i-1 )
		edit_component( stats, "PlayerStatsComponent", function(comp,vars)
			vars.lives = ComponentGetValueInt( comp, "lives" ) + 1
		end)
	end
end

-------------------

function extra_hp(x,y)
	GamePrint( "MORE HP" )

	local players = get_players()
	if players == nil  then return end

	for i,player in ipairs(players) do
		local new_hp = 1.0

		local stats = GameGetPlayerStatsEntity( i-1 )
		edit_component( stats, "PlayerStatsComponent", function(comp,vars)
			new_hp = ComponentGetValueFloat( comp, "max_hp" ) + 1
			vars.max_hp = new_hp
		end)

		edit_component( player, "DamageModelComponent", function(comp,vars)
			vars.hp     = new_hp
			vars.max_hp = new_hp
		end)
	end
end

-------------------

function curse_less_hp(x,y)
	GamePrint( "CURSE - LESS HP" )

	local players = get_players()
	if players == nil  then return end
	
	for i,player in ipairs(players) do
		local new_hp = 1.0

		local stats = GameGetPlayerStatsEntity( i-1 )
		edit_component( stats, "PlayerStatsComponent", function(comp,vars)
			new_hp = ComponentGetValueFloat( comp, "max_hp" ) - 1
			new_hp = math.max( 1.0, new_hp )

			vars.max_hp = new_hp
		end)

		edit_component( player, "DamageModelComponent", function(comp,vars)
			vars.hp     = new_hp
			vars.max_hp = new_hp
		end)
	end
end

-------------------

function curse_lose_life(x,y)
	GamePrint( "1 DOWN" )

	local players = get_players()
	if players == nil  then return end
	
	for i,player in ipairs(players) do
		local stats = GameGetPlayerStatsEntity( i-1 )
		edit_component( stats, "PlayerStatsComponent", function(comp,vars)
			local new_lives = ComponentGetValueInt( comp, "lives" ) - 1
			new_lives = math.max( 1, new_lives )

			vars.lives = new_lives
		end)
	end
end

-------------------

function curse_destroy_random_item(x,y)
	GamePrint( "CURSE - LOST RANDOM ITEM" )
	-- TODO: implement
end

-------------------