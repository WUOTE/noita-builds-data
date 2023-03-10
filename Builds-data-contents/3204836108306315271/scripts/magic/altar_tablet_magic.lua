dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local tablets = EntityGetWithTag( "tablet" )
local worm_crystals = EntityGetWithTag( "worm_crystal" )

if ( #worm_crystals > 0 ) then
	local collected = false
	local players = EntityGetWithTag( "player_unit" )
	
	if ( #players > 0 ) then
		local player_id = players[1]
		local px, py = EntityGetTransform( player_id )
		
		for i,crystal_id in ipairs(worm_crystals) do
			local cx, cy = EntityGetTransform( crystal_id )
			
			local distance = math.abs( x - cx ) + math.abs( y - cy )
		
			if ( distance < 48 ) then
				local eid = EntityLoad("data/entities/misc/worm_rain.xml", px, py)
				EntityAddChild( player_id, eid )
				collected = true
				EntityKill( crystal_id )
			end
		end
	end
	
	if collected then
		GamePrintImportant( "$log_altar_magic_worm", "" )
	end
end

if ( #tablets > 0 ) then
	local collected = false
	
	for i,tablet_id in ipairs(tablets) do
		local in_world = false
		local components = EntityGetComponent( tablet_id, "PhysicsBodyComponent" )
		
		if( components ~= nil ) then
			in_world = true
		end
		
		local tx, ty = EntityGetTransform( tablet_id )
		SetRandomSeed( tx+236, ty-4125 )
		
		if in_world then
			local tx, ty = EntityGetTransform( tablet_id )
			
			local distance = math.abs(x - tx) + math.abs(y - ty)
		
			if ( distance < 48 ) then
				EntityLoad("data/entities/particles/image_emitters/chest_effect.xml", tx, ty)
				EntityConvertToMaterial( tablet_id, "gold")
				collected = true
				EntityKill( tablet_id )
			end
		end
	end
	
	if collected then
		local variablestorages = EntityGetComponent( entity_id, "VariableStorageComponent" )
		local tablets_eaten = 0
		
		if( variablestorages ~= nil ) then
			for i,variablestorage in ipairs(variablestorages) do
				if ( ComponentGetValue( variablestorage, "name" ) == "tablets_eaten" ) then
					tablets_eaten = ComponentGetValueInt( variablestorage, "value_int" )
					
					tablets_eaten = tablets_eaten + 1

					ComponentSetValue( variablestorage, "value_int", tablets_eaten )
				end
			end
		end
		
		local spawn_monster = false
		
		if (tablets_eaten > 2) then
			local lower_limit = math.min(tablets_eaten, 8)
			
			local rnd = Random( lower_limit, 9 )
			
			if (rnd == 9) then
				spawn_monster = true
				
				for i=1,3 do
					local ox = Random( -10, 10 )
					local oy = Random( -10, 10 )
					EntityLoad( "data/entities/animals/gazer.xml", x + ox, y + oy )
				end
			end
		end
		
		if ( spawn_monster == false ) then
			GamePrintImportant( "$log_altar_magic", "" )
		else
			EntityLoad("data/entities/particles/image_emitters/altar_tablet_curse_symbol.xml", tx, ty)
			GamePrintImportant( "$log_altar_magic_monster", "" )
		end
	end
end