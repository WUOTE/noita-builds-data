dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )

local x = pos_x + Random( -200, 200 )
local y = pos_y + Random( -300, -160 )

local eid = EntityLoad( "data/entities/animals/worm_big.xml", x, y )
EntitySetComponentsWithTagEnabled( eid, "death_reward", false )

GameScreenshake( 10 )