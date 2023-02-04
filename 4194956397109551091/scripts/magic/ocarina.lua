dofile_once("data/scripts/lib/utilities.lua")

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
		local do_magic = false
		
		variables = EntityGetComponent( player_id, "VariableStorageComponent" )
		
		if ( variables ~= nil ) then
			for i,comp in ipairs(variables) do
				local name = ComponentGetValue( comp, "name" )
				
				if ( name == "ocarina" ) then
					song_state = ComponentGetValueInt( comp, "value_int" )
					
					if ( song_state == 0 ) and ( note == "a" ) then
						song_state = 1
					elseif ( song_state == 1 ) and ( note == "f" ) then
						song_state = 2
					elseif ( song_state == 2 ) and ( note == "d" ) then
						song_state = 3
					elseif ( song_state == 3 ) and ( note == "e" ) then
						song_state = 4
					elseif ( song_state == 4 ) and ( note == "a2" ) then
						song_state = 0
						do_magic = true
					else
						song_state = 0
					end
					
					ComponentSetValue( comp, "value_int", song_state )
				end
			end
		end
		
		local already_done = GameHasFlagRun( "ocarina" )
		
		if ( do_magic ) then
			if ( already_done == false ) then
				EntityLoad( "data/entities/buildings/mystery_teleport_back.xml", x, y - 64 )
				GamePrintImportant( "$log_ocarina", "$logdesc_ocarina" )
				GameAddFlagRun( "ocarina" )
			else
				GamePrint( "$log_ocarina_done" )
			end
		end
	end	
end		