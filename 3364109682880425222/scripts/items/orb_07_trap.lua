dofile( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")

function spawn_group( names )
	-- pick spawn point
	local x = 3300
	local y = 825
	if ProceduralRandomf(49,12) < 0.2 then
		x = 2300
		y = 830
		-- extra group when spawning on opposite shore
		for _,v in ipairs(names) do
			EntityLoad("data/entities/animals/" .. v .. ".xml", x, y)
			x = x + 10
		end
	end

	-- spawn
	for _,v in ipairs(names) do
		EntityLoad("data/entities/animals/" .. v .. ".xml", x, y)
		x = x + 10
	end
end

function item_pickup( entity_item, entity_who_picked, item_name )
	local r = ProceduralRandomf(21,63)
	
	if r < 0.2 then	EntityLoad("data/entities/misc/loose_chunks_huge.xml", 3500, 900)
	elseif r < 0.3 then spawn_group( {"vault/scavenger_leader", "vault/scavenger_smg", "vault/scavenger_grenade"} )
	elseif r < 0.4 then	spawn_group( {"the_end/gazer"} )
	elseif r < 0.5 then	spawn_group( {"vault/tentacler", "vault/tentacler_small", "vault/tentacler_small"} )
	elseif r < 0.6 then	spawn_group( {"the_end/bloodcrystal_physics"} )
	elseif r < 0.7 then	spawn_group( {"crypt/crystal_physics", "crypt/crystal_physics"} )
	elseif r < 0.8 then	spawn_group( {"crypt/phantom_a", "crypt/phantom_a", "crypt/phantom_b"} )
	elseif r < 0.9 then	spawn_group( {"vault/lasershooter", "vault/acidshooter" } )
	elseif r < 0.999 then spawn_group( {"spearbot"} )
	else spawn_group( {"sheep", "sheep", "sheep", "sheep"} )
	end
end
