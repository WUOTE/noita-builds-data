dofile( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")
dofile_once( "data/scripts/perks/perk_list.lua" )

function give_perk_to_enemy( perk_data, entity_who_picked, entity_item )
	-- fetch perk info ---------------------------------------------------

	local pos_x, pos_y = EntityGetTransform( entity_who_picked )

	local perk_id = perk_data.id
	
	-- add game effect
	if perk_data.game_effect ~= nil then
		local game_effect_comp = GetGameEffectLoadTo( entity_who_picked, perk_data.game_effect, true )
		if game_effect_comp ~= nil then
			ComponentSetValue( game_effect_comp, "frames", "-1" )
		end
	end
	
	if perk_data.func_enemy ~= nil then
		perk_data.func_enemy( entity_item, entity_who_picked )
	elseif perk_data.func ~= nil then
		perk_data.func( entity_item, entity_who_picked )
	end

	-- add ui icon etc
	local entity_icon = EntityLoad( "data/entities/misc/perks/enemy_icon.xml", pos_x, pos_y )
	edit_component( entity_icon, "SpriteComponent", function(comp,vars)
		ComponentSetValue( comp, "image_file", perk_data.ui_icon )
	end)
	EntityAddChild( entity_who_picked, entity_icon )
end

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
local targets = EntityGetInRadiusWithTag( x, y, 40, "mortal" )

SetRandomSeed( x, y )

if ( #targets > 0 ) then
	local target = targets[1]
	
	local worm = EntityGetComponent( target, "WormAIComponent" )
	local dragon = EntityGetComponent( target, "BossDragonComponent" )
	local ghost = EntityGetComponent( target, "GhostComponent" )
	local lukki = EntityGetComponent( target, "LimbBossComponent" )
	
	if ( worm == nil ) and ( dragon == nil ) and ( ghost == nil ) and ( lukki == nil ) then
		local valid_perks = {}
		
		for i,perk_data in ipairs( perk_list ) do
			if ( perk_data.usable_by_enemies ~= nil ) and perk_data.usable_by_enemies then
				table.insert( valid_perks, i )
			end
		end
		
		if ( #valid_perks > 0 ) then
			local rnd = Random( 1, #valid_perks )
			local result = valid_perks[rnd]
			
			local perk_data = perk_list[result]
			
			give_perk_to_enemy( perk_data, target, entity_id )
		end
	end
end

EntityKill( entity_id )
	