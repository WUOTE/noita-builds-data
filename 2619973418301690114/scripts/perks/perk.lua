dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/perks/perk_list.lua" )


local get_perk_flag_name = function( perk_id )
	return "PERK_" .. perk_id
end

-- returns true if perks can be picked many times
function perk_is_stackable( perk_data )
	return perk_data.stackable ~= nil and perk_data.stackable == true
end

 -- this generates global perk spawn order for current world seed
function perk_get_spawn_order()
	-- this function should return the same results no matter when or where during a run it is called.
	-- this function should have no side effects.
	local MIN_DISTANCE_BETWEEN_DUPLICATE_PERKS = 4
	local PERK_SPAWN_ORDER_LENGTH = 100
	local PERK_DUPLICATE_AVOIDANCE_TRIES = 200

	SetRandomSeed( 1, 2 ) 

	----
	local create_perk_pool = function()
		local result = {}

		for i,perk_data in ipairs(perk_list) do
			if ( perk_data.not_in_default_perk_pool == nil or perk_data.not_in_default_perk_pool == false ) then
				table.insert( result, perk_data )
			end
		end

		return result
	end

	----
	local perk_pool = create_perk_pool()

	local result = { }

	for i=1,PERK_SPAWN_ORDER_LENGTH do
		local tries = 0
		local perk_data = nil

		while tries < PERK_DUPLICATE_AVOIDANCE_TRIES do
			local ok = true
			if #perk_pool == 0 then
				perk_pool = create_perk_pool()
			end

			local index_in_perk_pool = Random( 1, #perk_pool )
			perk_data = perk_pool[index_in_perk_pool]

			if perk_is_stackable( perk_data ) then --  ensure stackable perks are not spawned too close to each other
				for ri= #result-MIN_DISTANCE_BETWEEN_DUPLICATE_PERKS,#result do
					if ri >= 1 and result[ri] == perk_data.id then
						ok = false
						break
					end
				end
			else
				table.remove( perk_pool, index_in_perk_pool ) -- remove non-stackable perks from the pool
			end

			if ok then
				break
			end

			tries = tries + 1
		end

		table.insert( result, perk_data.id )
	end


	-- debug - print duplicates
	-- for i,id in ipairs(result) do
	-- 	for i2,id2 in ipairs(result) do
	-- 		if id == id2 and i ~= i2 then
	-- 			print(id .. " " .. tostring(i) .. " and " .. tostring(i2))
	-- 		end
	-- 	end
	-- end

	return result
end


 -- spawns one perk
function perk_spawn( x, y, perk_id )
	local perk_data = get_perk_with_id( perk_list, perk_id )
	if ( perk_data == nil ) then
		print_error( "spawn_perk( perk_id ) called with'" .. perk_id .. "' - no perk with such id exists." )
		return
	end

	print( "spawn_perk " .. tostring( perk_id ) .. " " .. tostring( x ) .. " " .. tostring( y ) )

 	---
	local entity_id = EntityLoad( "data/entities/items/pickup/perk.xml", x, y )
	if ( entity_id == nil ) then
		return
	end

	-- init perk item
	EntityAddComponent( entity_id, "SpriteComponent", 
	{ 
		image_file = perk_data.perk_icon or "data/items_gfx/perk.xml",  
		offset_x = "8", 
		offset_y = "8", 
		update_transform = "1" ,
		update_transform_rotation = "0",
	} )

	EntityAddComponent( entity_id, "UIInfoComponent", 
	{ 
		name = perk_data.ui_name,
	} )

	EntityAddComponent( entity_id, "ItemComponent", 
	{ 
		item_name = perk_data.ui_name,
		ui_description = perk_data.ui_description,
		play_spinning_animation = "0",
		play_hover_animation = "1",
		play_pick_sound = "0",
	} )

	EntityAddComponent( entity_id, "VariableStorageComponent", 
	{ 
		name = "perk_id",
		value_string = perk_data.id,
	} )
end

-- this spawns perks in the temple
function perk_spawn_many( x, y )
	local perk_count = tonumber( GlobalsGetValue( "TEMPLE_PERK_COUNT", "3" ) )
	
	local count = perk_count
	local width = 60
	local item_width = width / count

	local perks = perk_get_spawn_order()

	for i=1,count do
		local next_perk_index = tonumber( GlobalsGetValue( "TEMPLE_NEXT_PERK_INDEX", "1" ) )
		local perk_data = get_perk_with_id( perk_list, perks[next_perk_index] )
		
		next_perk_index = next_perk_index + 1
		if next_perk_index > #perks then
			next_perk_index = 1
		end
		GlobalsSetValue( "TEMPLE_NEXT_PERK_INDEX", tostring(next_perk_index) )

		GameAddFlagRun( get_perk_flag_name(perk_data.id) )
		perk_spawn( x + (i-0.5)*item_width, y, perks[next_perk_index] )
	end
end