dofile( "data/scripts/lib/utilities.lua" )

function drop_random_reward( x, y, entity_id )
	-- local set_rnd = set_rnd_ or true
	local set_rnd = false
	if( set_rnd ) then
		SetRandomSeed( x, y )
	end
	
	local count = 1
	while( count > 0 ) do
		count = count - 1
		local rnd = Random(1,100)
	
		if( rnd <= 7 ) then
			-------------------------------------------------------------------
			-- Bomb
			-------------------------------------------------------------------
			EntityLoad( "data/entities/projectiles/bomb_small.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
		elseif( rnd <= 40 ) then
			-------------------------------------------------------------------
			-- Gold (I think the reason there's empty is chests is goldnuggets)
			-------------------------------------------------------------------
			local amount = 5
			rnd = Random(0,100)
			if (rnd <= 80) then
				amount = 7
			elseif (rnd <= 95) then
				amount = 10
			elseif (rnd <= 100) then
				amount = 20
			end

			for i=1,amount do
				local gold_entity_id = EntityLoad( "data/entities/items/pickup/goldnugget.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
				edit_component( gold_entity_id, "ItemComponent", function(comp,vars)
					vars.next_frame_pickable = GameGetFrameNum() + 30
				end)
			end
		elseif( rnd <= 50 ) then
			-------------------------------------------------------------------
			-- Potion
			-------------------------------------------------------------------
			rnd = Random(0,100)
			if (rnd <= 98) then
				EntityLoad( "data/entities/items/pickup/potion.xml", x + Random(-10,10), y - 4 + Random(-5,5) )
			elseif (rnd <= 100) then
				rnd = Random(0,100)
				if( rnd <= 98 ) then
					EntityLoad( "data/entities/items/pickup/potion_secret.xml", x + Random(-10,10), y - 4 + Random(-5,5) )
				elseif( rnd <= 100 ) then
					EntityLoad( "data/entities/items/pickup/potion_random_material.xml", x + Random(-10,10), y - 4 + Random(-5,5) )
				end
			end
			
		elseif( rnd <= 65 ) then
			-------------------------------------------------------------------
			-- Random card
			-------------------------------------------------------------------
			EntityLoad( "data/entities/items/pickup/random_card.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
		elseif( rnd <= 84 ) then
			-------------------------------------------------------------------
			-- Wand
			-------------------------------------------------------------------

			rnd = Random(0,100)
			
			if( rnd <= 25 ) then
				EntityLoad( "data/entities/items/wand_level_01.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif( rnd <= 50 ) then
				EntityLoad( "data/entities/items/wand_unshuffle_01.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif( rnd <= 75 ) then
				EntityLoad( "data/entities/items/wand_level_02.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif( rnd <= 90 ) then
				EntityLoad( "data/entities/items/wand_unshuffle_02.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif( rnd <= 96 ) then
				EntityLoad( "data/entities/items/wand_level_03.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif( rnd <= 98 ) then
				EntityLoad( "data/entities/items/wand_unshuffle_03.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif( rnd <= 99 ) then
				EntityLoad( "data/entities/items/wand_level_04.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif( rnd <= 100 ) then
				EntityLoad( "data/entities/items/wand_unshuffle_04.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			end
		elseif( rnd <= 95 ) then
			-------------------------------------------------------------------
			-- Heart(s)
			-------------------------------------------------------------------
			rnd = Random(0,100)
			
			if (rnd <= 89) then
				EntityLoad( "data/entities/items/pickup/heart.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			elseif (rnd <= 99) then
				EntityLoad( "data/entities/items/pickup/heart_better.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			else
				EntityLoad( "data/entities/items/pickup/heart_fullhp.xml", x + Random(-10,10), y - 4 + Random(-10,10) )
			end
		elseif( rnd <= 98 ) then
			-------------------------------------------------------------------
			-- Converts the chest into gold
			-------------------------------------------------------------------
			EntityConvertToMaterial( entity_id, "gold")
		elseif( rnd <= 99 ) then
			-------------------------------------------------------------------
			-- exploding "dice"
			-------------------------------------------------------------------

			-- explode the random table
			-- do random reward 2 times...
			count = count + 2
		elseif( rnd <= 100 ) then
			-- explode the random table
			-- do random reward 3 times...
			count = count + 3
		end
	end
end

function drop_money( entity_item )
	
	-- 
end

function on_open( entity_item )
	local x, y = EntityGetTransform( entity_item )
	local rand_x = x
	local rand_y = y

	-- PositionSeedComponent
	local position_comp = EntityGetFirstComponent( entity_item, "PositionSeedComponent" )
	if( position_comp ) then
		rand_x = tonumber(ComponentGetValue( position_comp, "pos_x") )
		rand_y = tonumber(ComponentGetValue( position_comp, "pos_y") )
	end

	SetRandomSeed( rand_x, rand_yy )

	EntityLoad("data/entities/particles/image_emitters/chest_effect.xml", x, y)

	-- money
	-- card
	-- potion
	-- wand
	-- bunch of spiders
	-- bomb
	drop_random_reward( x, y, entity_item )
end

function item_pickup( entity_item, entity_who_picked, name )
	GamePrintImportant( "$log_chest", "" )
	-- GameTriggerMusicCue( "item" )

	--if (remove_entity == false) then
	--	EntityLoad( "data/entities/misc/chest_random_dummy.xml", x, y )
	--end

	on_open( entity_item )
	
	EntityKill( entity_item )
end

function physics_body_modified( is_destroyed )
	-- GamePrint( "A chest was broken open" )
	-- GameTriggerMusicCue( "item" )
	local entity_item = GetUpdatedEntityID()
	
	on_open( entity_item )

	edit_component( entity_item, "ItemComponent", function(comp,vars)
		EntitySetComponentIsEnabled( entity_item, comp, false )
	end)
	
	EntityKill( entity_item )
end