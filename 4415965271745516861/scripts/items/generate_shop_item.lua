dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/gun/gun_actions.lua" )


-- cardcost = tostring(math.max(40, cardcost + math.random(-4,4) * 10))

function generate_shop_item( x, y, cheap_item, biomeid_, is_stealable )
	-- this makes the shop items deterministic
	SetRandomSeed( x, y )

	local biomes =
	{
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 1,
		[5] = 1,
		[6] = 1,
		[7] = 2,
		[8] = 2,
		[9] = 2,
		[10] = 2,
		[11] = 2,
		[12] = 2,
		[13] = 3,
		[14] = 3,
		[15] = 3,
		[16] = 3,
		[17] = 4,
		[18] = 4,
		[19] = 4,
		[20] = 4,
		[21] = 5,
		[22] = 5,
		[23] = 5,
		[24] = 5,
		[25] = 6,
		[26] = 6,
		[27] = 6,
		[28] = 6,
		[29] = 6,
		[30] = 6,
		[31] = 6,
		[32] = 6,
		[33] = 6,
	}


	local biomepixel = math.floor(y / 512)
	local biomeid = biomes[biomepixel] or 0
	
	if (biomes[biomepixel] == nil) then
		print("Unable to find biomeid for chunk at depth " .. tostring(biomepixel))
	end
	
	if (biomeid_ ~= nil) then
		biomeid = biomeid_
	end

	if( is_stealable == nil ) then
		is_stealable = false
	end

	local item = ""
	local cardcost = 0

	local validcards = {}

	-- Note( Petri ): Testing how much squaring the biomeid for prices affects things
	biomeid = biomeid * biomeid

	for i,thisitem in ipairs(actions) do
		local spawnids = thisitem.spawn_level
		local sid_string = ""
		local sid_value = -99

		--[[
		for i=1,string.len(spawnids) do
			local letter = string.sub(spawnids, i, i)
			
			if (letter ~= ",") then
				sid_string = sid_string .. letter
			end
			
			if (letter == ",") or (i == string.len(spawnids)) then
				sid_value = tonumber(sid_string)
				sid_string = ""
			end
			
			if (sid_value == biomeid) then
				-- 15.1.2018 - Design hax to make the prices a bit more user friendly
				price = math.floor( ( (thisitem.price * 0.75) + (30 * biomeid) ) / 10 ) * 10
				table.insert(validcards, {string.lower(thisitem.id), price})
				break
			end
		end
		]]--
		
		price = math.max(math.floor( ( (thisitem.price * 0.45) + (70 * biomeid) ) / 10 ) * 10, 10)
		table.insert(validcards, {string.lower(thisitem.id), price})
	end

	if (#validcards > 0) then
		local randomcard = Random(1,#validcards)
		
		local card = validcards[randomcard]
		item = card[1]
		cardcost = card[2]
		if( cheap_item ) then
			cardcost = 0.5 * cardcost
		end
	end

	local eid = CreateItemActionEntity( item, x, y )

	if( cheap_item ) then
		EntityLoad( "data/entities/misc/sale_indicator.xml", x, y )
	end

	-- local x, y = EntityGetTransform( entity_id )
	-- SetRandomSeed( x, y )

	EntityAddComponent( eid, "SpriteComponent", { 
		_tags="shop_cost,enabled_in_world",
		image_file="data/fonts/font_pixel_white.xml", 
		is_text_sprite="1", 
		offset_x="7", 
		offset_y="25", 
		update_transform="1" ,
		update_transform_rotation="0",
		text="111",
		} )

	local stealable_value = "0"
	if( is_stealable ) then 
		stealable_value = "1"
	end
	
	EntityAddComponent( eid, "ItemCostComponent", { 
		_tags="shop_cost,enabled_in_world", 
		cost=cardcost,
		stealable=stealable_value
		} )
		
	EntityAddComponent( eid, "LuaComponent", { 
		script_item_picked_up="data/scripts/items/shop_effect.lua",
		} )
	-- shop_item_pickup2.lua

	-- display uses remaining, if any
	--  NOTE(Olli): removed this because it didn't work with low resolution rendering
	--[[edit_component( eid, "ItemComponent", function(comp,vars)
		local uses_remaining = tonumber( ComponentGetValue(comp, "uses_remaining" ) )
		if uses_remaining > -1 then
			EntityAddComponent( eid, "SpriteComponent", { 
				_tags="shop_cost,enabled_in_world",
				image_file="data/fonts/font_pixel_white.xml", 
				is_text_sprite="1", 
				offset_x="16", 
				offset_y="32", 
				has_special_scale="1",
				special_scale_x="0.5",
				special_scale_y="0.5",
				update_transform="1" ,
				update_transform_rotation="0",
				text=tostring(uses_remaining),
				} )
		end
	end)]]--
end

------------ generate shop wand -----------------------------------------------

function generate_shop_wand( x, y, cheap_item, biomeid_ )
	-- this makes the shop items deterministic
	SetRandomSeed( x, y )

	local biomes =
	{
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 1,
		[5] = 1,
		[6] = 1,
		[7] = 2,
		[8] = 2,
		[9] = 2,
		[10] = 2,
		[11] = 2,
		[12] = 2,
		[13] = 3,
		[14] = 3,
		[15] = 3,
		[16] = 3,
		[17] = 4,
		[18] = 4,
		[19] = 4,
		[20] = 4,
		[21] = 5,
		[22] = 5,
		[23] = 5,
		[24] = 5,
		[25] = 6,
		[26] = 6,
		[27] = 6,
		[28] = 6,
		[29] = 6,
		[30] = 6,
		[31] = 6,
		[32] = 6,
		[33] = 6,
	}


	local biomepixel = math.floor(y / 512)
	local biomeid = biomes[biomepixel] or 0
	
	if (biomes[biomepixel] == nil) then
		print("Unable to find biomeid for chunk at depth " .. tostring(biomepixel))
	end
	if (biomeid_ ~= nil) then
		biomeid = biomeid_
	end

	if( biomeid < 1 ) then biomeid = 1 end
	if( biomeid > 6 ) then biomeid = 6 end

	local item = "data/entities/items/"

	local r = Random(0,100)
	if( r <= 50 ) then 
		item = item .. "wand_level_0"
	else
		item = item .. "wand_unshuffle_0"
	end

	item = item .. tostring(biomeid) .. ".xml"

	
	-- Note( Petri ): Testing how much squaring the biomeid for prices affects things
	biomeid = (0.5 * biomeid) + ( 0.5 * biomeid * biomeid )
	local wandcost = ( 50 + biomeid * 210 ) + ( Random( -15, 15 ) * 10 )

	if( cheap_item ) then
		wandcost = 0.5 * wandcost
	end

	if( cheap_item ) then
		EntityLoad( "data/entities/misc/sale_indicator.xml", x, y )
	end

	-- local x, y = EntityGetTransform( entity_id )
	-- SetRandomSeed( x, y )
	local eid = EntityLoad( item, x, y )

	EntityAddComponent( eid, "SpriteComponent", { 
		_tags="shop_cost,enabled_in_world",
		image_file="data/fonts/font_pixel_white.xml", 
		is_text_sprite="1", 
		offset_x="7", 
		offset_y="25", 
		update_transform="1" ,
		update_transform_rotation="0",
		text="111"
		} )

	EntityAddComponent( eid, "ItemCostComponent", { 
		_tags="shop_cost,enabled_in_world", 
		cost=wandcost,
		stealable="1"
		} )
		
	EntityAddComponent( eid, "LuaComponent", { 
		script_item_picked_up="data/scripts/items/shop_effect.lua"
		} )

end
