dofile( "data/scripts/game_helpers.lua" )
dofile( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

print("BOSS RUMBLES ANGRILY")

GamePlaySound( "data/audio/Desktop/event_cues.snd", "event_cues/orb_distant_monster/create", pos_x, pos_y )
GameScreenshake( 100 )

EntityKill( entity_id )