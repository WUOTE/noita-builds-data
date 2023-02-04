
-- return "0", "0" -> shop, perks
function temple_should_we_spawn_checkers()
	if( MagicNumbersGetValue( "DESIGN_TEMPLE_CHECK_FOR_LEAKS") == "0" ) then
		return false
	end
	if( GlobalsGetValue( "TEMPLE_LEAKED" ) == "1" ) then
		return false
	end
	return true
end


-- return values "1", "1"
-- return values spawn_shop, spawn_perks
function temple_random( x, y )
	if( MagicNumbersGetValue( "DESIGN_TEMPLE_CHECK_FOR_LEAKS") == "0" ) then
		return "1", "1"
	end

	if( GlobalsGetValue( "TEMPLE_LEAKED" ) == "1" ) then
		return "1", "0"
	end

	return "1", "1"
end

--[[
function temple_random( x, y )
	if( MagicNumbersGetValue( "DESIGN_RANDOMIZE_TEMPLE_CONTENTS") == "0" ) then
		return "1", "1"
	end
	-- 1 - 6 
	-- -> 6 = both
	y = y / 1024
	y = math.floor(y)
	x = 1234567
	x = math.floor(x)

	SetRandomSeed( x, y )
	local ran = Random(1, 6)
	local spawn_shop = GlobalsGetValue( "temple_spawn_shop_" .. tostring( y ) )
	local spawn_perks = GlobalsGetValue( "temple_spawn_perks_" .. tostring( y ) )
	
	if( spawn_shop == "" ) then
		if( ran <= 3 or ran == 6 ) then 
			spawn_shop = "1"
		else
			spawn_shop = "0"
		end
		GlobalsSetValue( "temple_spawn_shop_" .. tostring( y ), spawn_shop )
	end

	if( spawn_perks == "" ) then
		if( ran > 3 ) then 
			spawn_perks = "1"
		else
			spawn_perks = "0"
		end
		GlobalsSetValue( "temple_spawn_perks_" .. tostring( y ), spawn_perks )
	end

	-- print( "temple_shop_" .. tostring( y ) .. GlobalsGetValue( "temple_spawn_shop_" .. tostring( y ) ) )
 	-- print( "temple_perks" .. tostring( y ) .. GlobalsGetValue( "temple_spawn_perks_" .. tostring( y ) ) )

 	return GlobalsGetValue( "temple_spawn_shop_" .. tostring( y ) ), GlobalsGetValue( "temple_spawn_perks_" .. tostring( y ) )
end
]]--