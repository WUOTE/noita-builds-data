dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local state = 0
local comps = EntityGetComponent( entity_id, "VariableStorageComponent" )
if ( comps ~= nil ) then
	for i,v in ipairs( comps ) do
		local n = ComponentGetValue2( v, "name" )
		if ( n == "stage" ) then
			state = ComponentGetValue2( v, "value_int" )
			
			state = state + 1
			
			ComponentSetValue2( v, "value_int", state )
			break
		end
	end
end

local stage_names = { "$item_mcguffin_0", "$item_mcguffin_1", "$item_mcguffin_2", "$item_mcguffin_3", "$item_mcguffin_4", "$item_mcguffin_5", "$item_mcguffin_6", "$item_mcguffin_7", "$item_mcguffin_8", "$item_mcguffin_9", "$item_mcguffin_10", "$item_mcguffin_11", "$item_mcguffin_12", "$item_mcguffin_13" }

GamePrintImportant( stage_names[state] or "", "" )

print( tostring( state ) )

local p = EntityGetWithTag( "player_unit" )
if ( #p == 0 ) then
	EntityKill( entity_id )
end

if ( state == 1 ) then
	EntityLoad( "data/entities/projectiles/remove_ground.xml", x, y )
elseif ( state == 2 ) then
	EntityLoad( "data/entities/projectiles/deck/sea_lava.xml", x, y )
elseif ( state == 3 ) then
	for i=0,15 do
		local angle = math.pi * 0.125 * i
		local ox = math.cos( angle ) * 160
		local oy = 0 - math.sin( angle ) * 160
		
		EntityLoad( "data/entities/props/physics_propane_tank.xml", x + ox, y + oy )
	end
elseif ( state == 4 ) then
	for i=0,31 do
		local angle = math.pi * 0.625 * i
		local ox = math.cos( angle ) * 400
		local oy = 0 - math.sin( angle ) * 400
		
		shoot_projectile( entity_id, "data/entities/projectiles/wraith_glowing_laser.xml", x + math.cos( angle ) * 20, y - math.sin( angle ) * 20, ox, oy )
	end
elseif ( state == 5 ) then
	EntityLoad( "data/entities/projectiles/deck/sea_acid.xml", x, y )
elseif ( state == 6 ) then
	for i=0,31 do
		local angle = math.pi * 0.625 * i
		local ox = math.cos( angle ) * 600
		local oy = 0 - math.sin( angle ) * 600
		
		shoot_projectile( entity_id, "data/entities/projectiles/deck/fireball.xml", x + math.cos( angle ) * 20, y - math.sin( angle ) * 20, ox, oy )
	end
elseif ( state == 7 ) then
	EntityLoad( "data/entities/projectiles/circle_blood.xml", x, y )
elseif ( state == 8 ) then
	for i=0,31 do
		local angle = math.pi * 0.625 * i
		local ox = math.cos( angle ) * 300
		local oy = 0 - math.sin( angle ) * 300
		
		shoot_projectile( entity_id, "data/entities/projectiles/deck/laser.xml", x + math.cos( angle ) * 20, y - math.sin( angle ) * 20, ox, oy )
	end
elseif ( state == 9 ) then
	for i=0,7 do
		local angle = math.pi * 0.25 * i
		local ox = math.cos( angle ) * 160
		local oy = 0 - math.sin( angle ) * 160
		
		shoot_projectile( entity_id, "data/entities/animals/boss_pit/wand.xml", x + math.cos( angle ) * 20, y - math.sin( angle ) * 20, ox, oy )
	end
elseif ( state == 10 ) then
	EntityLoad( "data/entities/projectiles/deck/crumbling_earth.xml", x, y )
elseif ( state == 11 ) then
	for i=0,3 do
		local angle = math.pi * 0.5 * i
		local ox = math.cos( angle ) * 160
		local oy = 0 - math.sin( angle ) * 160
		
		EntityLoad( "data/entities/animals/worm_big.xml", x + ox, y + oy )
	end
elseif ( state == 12 ) then
	for i=0,7 do
		local angle = math.pi * 0.25 * i
		local ox = math.cos( angle ) * 160
		local oy = 0 - math.sin( angle ) * 160
		
		EntityLoad( "data/entities/items/pickup/potion.xml", x + ox, y + oy )
	end
elseif ( state == 12 ) then
	EntityLoad( "data/entities/projectiles/rain_gold.xml", x, y )
elseif ( state == 13 ) then
	for i=0,7 do
		local angle = math.pi * 0.25 * i
		local ox = math.cos( angle ) * 160
		local oy = 0 - math.sin( angle ) * 160
		
		shoot_projectile( entity_id, "data/entities/projectiles/deck/nuke.xml", x + math.cos( angle ) * 20, y - math.sin( angle ) * 20, ox, oy )
		EntityKill( entity_id )
	end
end