dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()

local comp = EntityGetFirstComponent( entity_id, "LaserEmitterComponent" )
if ( comp ~= nil ) then
	ComponentSetValue2( comp, "is_emitting", true )
end
