dofile_once("data/scripts/lib/utilities.lua")

function shot( entity_id )
	edit_component( entity_id, "ProjectileComponent", function(comp,vars)
		ComponentSetValue2( comp, "friendly_fire", true )
		ComponentSetValue2( comp, "collide_with_shooter_frames", 6 )
	end)
end