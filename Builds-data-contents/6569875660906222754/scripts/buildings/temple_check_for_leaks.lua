dofile( "data/scripts/lib/utilities.lua" )

function material_area_checker_failed( pos_x, pos_y )

	local h = math.floor( pos_y / 512 )
	-- print( h )
	-- local temple_leaks = tonumber( GlobalsGetValue( "TEMPLE_LEAKED" ) )
	local leak_name = "TEMPLE_LEAKED_" .. tostring(h)
	local perk_count = GlobalsGetValue( "TEMPLE_PERK_COUNT" )
	if( perk_count == "" ) then 
		perk_count = 3
	else
		perk_count = tonumber(perk_count)
	end

	-- spawn workshop guard
	if( GlobalsGetValue( "TEMPLE_SPAWN_GUARDIAN" ) ~= "1" ) then
		-- execute_every_n_frame
		local workshop_exit_id = EntityGetClosestWithTag( pos_x, pos_y, "workshop_exit" )
		local guard_x = pos_x
		local guard_y = pos_y
		if( workshop_exit_id ~= 0  ) then
			guard_x, guard_y = EntityGetTransform( workshop_exit_id )
			guard_x = guard_x - 120
			guard_y = guard_y + 60
		end

		EntityLoad( "data/entities/animals/necromancer_shop.xml", guard_x, guard_y )
	end

	GlobalsSetValue( "TEMPLE_SPAWN_GUARDIAN", "1" )


	if( GlobalsGetValue( leak_name ) ~= "1" ) then
		GamePrintImportant( "$logdesc_temple_spawn_guardian", "" )
		GamePlaySound( "data/audio/Desktop/event_cues.snd", "event_cues/sampo_pick/create", pos_x, pos_y )
		GameScreenshake( 150 )
		-- NOTE( Petri ): Disabled loosing perks for now, since guardian
		--[[ 
		perk_count = perk_count - 1
		GlobalsSetValue( "TEMPLE_PERK_COUNT", tostring(perk_count) )
		-- remove all the perks
		local perk_id = EntityGetClosestWithTag( pos_x, pos_y, "perk" )
		
		if (perk_id ~= 0) then
			EntityKill( perk_id )
		end
		]]--
	end


	GlobalsSetValue( leak_name, "1" )

end

--[[function material_area_checker_failed( pos_x, pos_y )

	local h = math.floor( pos_y / 512 )
	-- print( h )
	-- local temple_leaks = tonumber( GlobalsGetValue( "TEMPLE_LEAKED" ) )
	if( GlobalsGetValue( "TEMPLE_LEAKED" ) ~= "1" ) then
		GamePrintImportant( "You have angered the Gods", "" )
		GameScreenshake( 150 )
	end

	GlobalsSetValue( "TEMPLE_LEAKED", "1" )

	-- remove all the perks
	local all_perks = EntityGetWithTag( "perk" )
	
	if (all_perks ~= nil) then
		for i,entity_perk in ipairs(all_perks) do
			EntityKill( entity_perk )
		end
	end
end
]]--