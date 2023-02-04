dofile( "data/scripts/game_helpers.lua" )
dofile( "data/scripts/lib/utilities.lua" )

function item_pickup( entity_item, entity_who_picked, item_name )
	local pos_x, pos_y = EntityGetTransform( entity_item )
	
	local money = 0
	
	edit_component( entity_who_picked, "WalletComponent", function(comp,vars)
		money = ComponentGetValueInt( comp, "money")
	end)
	
	local value = 10
	local extra_money_count = GameGetGameEffectCount( entity_who_picked, "EXTRA_MONEY" )
	if extra_money_count > 0 then
		for i=1,extra_money_count do
			value = value * 2
		end
	end

	money = money + value
	
	edit_component( entity_who_picked, "WalletComponent", function(comp,vars)
		vars.money = money
	end)

	shoot_projectile( entity_item, "data/entities/particles/gold_pickup.xml", pos_x, pos_y, 0, 0 )
	EntityKill( entity_item )
end