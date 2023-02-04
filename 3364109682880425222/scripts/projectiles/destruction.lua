dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local enemies = EntityGetWithTag( "destruction_target" )
local players = EntityGetWithTag( "player_unit" )

if ( #enemies > 0 ) then
	for _,enemy_id in ipairs(enemies) do
		local ex, ey = EntityGetTransform( enemy_id )
		
		local dist = math.abs( x - ex ) + math.abs( y - ey )
		
		if ( dist < 300 ) then
			EntityLoad( "data/entities/particles/destruction.xml", ex, ey )
			EntityKill( enemy_id )
		end
	end
end

if ( #players > 0 ) then
	for _,player_id in ipairs(players) do
		local px, py = EntityGetTransform( player_id )
		
		EntityLoad( "data/entities/particles/destruction.xml", px, py )
		
		local damagemodels = EntityGetComponent( player_id, "DamageModelComponent" )
		
		if( damagemodels ~= nil ) then
			for _,damagemodel in ipairs(damagemodels) do
				local max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) )
				local hp = tonumber( ComponentGetValue( damagemodel, "hp" ) )

				max_hp = math.max( 0.04, ( max_hp * 0.9 ) - 0.4 )
				
				ComponentSetValue( damagemodel, "hp", math.min( hp, max_hp ) )
				ComponentSetValue( damagemodel, "max_hp", max_hp )
			end
		end
	end
end

GameScreenshake( 100 )
EntityKill( entity_id )