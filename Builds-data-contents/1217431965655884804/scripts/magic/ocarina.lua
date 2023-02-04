dofile_once("data/scripts/lib/utilities.lua")

local ocarina_songs = { 
	portal = { "a", "f", "d", "e", "a2" },
	bomb = { "f", "c", "d", "c" },
	worm = { "gsharp", "f", "e", "b", "d" },
}

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local players = EntityGetInRadiusWithTag( x, y, 24, "player_unit" )

if ( #players > 0 ) then
	local player_id = players[1]
	
	local variables = EntityGetComponent( entity_id, "VariableStorageComponent" )
	local note = ""

	if ( variables ~= nil ) then
		for i,comp in ipairs(variables) do
			local name = ComponentGetValue( comp, "name" )
			
			if ( name == "ocarina_note" ) then
				note = ComponentGetValue( comp, "value_string" )
			end
		end
	end
	
	if ( string.len(note) > 0 ) then
		local song_state = -1
		local do_portal_magic = false
		local do_bomb_magic = false
		local do_worm_magic = false
		local found = false
		
		variables = EntityGetComponent( player_id, "VariableStorageComponent" )
		
		if ( variables ~= nil ) then
			for i,comp in ipairs(variables) do
				local name = ComponentGetValue( comp, "name" )
				
				if ( name == "ocarina" ) then
					song_state = ComponentGetValueInt( comp, "value_int" )
					
					local limiter = false
					
					for song,b in pairs( ocarina_songs ) do
						local current_note_pos = song_state + 1
						local song_length = #b
						current_note_pos = math.min( song_length, current_note_pos )
						local current_note = b[current_note_pos]
						
						if ( current_note_pos < song_length ) and ( note == current_note ) then
							if ( limiter == false ) then
								song_state = song_state + 1
								print( current_note )
								found = true
								limiter = true
							end
						elseif ( current_note_pos == song_length ) and ( note == current_note ) then
							song_state = 0
							
							if ( song == "portal" ) then
								do_portal_magic = true
							elseif ( song == "bomb" ) then
								do_bomb_magic = true
							elseif ( song == "worm" ) then
								do_worm_magic = true
							end
						end
					end
					
					if ( found == false ) then
						song_state = 0
					end
					
					ComponentSetValue( comp, "value_int", song_state )
				end
			end
		end
		
		if ( do_portal_magic ) then
			local already_done = GameHasFlagRun( "ocarina_secret_00" )
			
			if ( already_done == false ) then
				EntityLoad( "data/entities/buildings/mystery_teleport_back.xml", x, y - 48 )
				GamePrintImportant( "$log_ocarina", "$logdesc_ocarina" )
				GameAddFlagRun( "ocarina_secret_00" )
			else
				GamePrint( "$log_ocarina_done" )
			end
		end
		
		if ( do_bomb_magic ) then
			local already_done = GameHasFlagRun( "ocarina_secret_01" )
			
			if ( already_done == false ) then
				EntityLoad( "data/entities/projectiles/bomb_holy.xml", x, y )
				GamePrintImportant( "$log_ocarina", "$logdesc_ocarina" )
				GameAddFlagRun( "ocarina_secret_01" )
			else
				GamePrint( "$log_ocarina_done" )
			end
		end
		
		if ( do_worm_magic ) then
			local already_done = GameHasFlagRun( "ocarina_secret_02" )
			
			if ( already_done == false ) then
				EntityLoad( "data/entities/animals/worm_big.xml", x, y - 64 )
				GamePrintImportant( "$log_ocarina", "$logdesc_ocarina" )
				GameAddFlagRun( "ocarina_secret_02" )
			else
				GamePrint( "$log_ocarina_done" )
			end
		end
	end	
end		