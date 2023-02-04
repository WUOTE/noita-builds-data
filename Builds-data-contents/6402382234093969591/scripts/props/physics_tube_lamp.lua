dofile( "data/scripts/lib/utilities.lua" )

function physics_body_modified( is_destroyed )
	local entity_id = GetUpdatedEntityID()

	edit_all_components( entity_id, "LightComponent", function(comp,vars)
		vars.blinking_freq = 0.9
	end)

	edit_all_components( entity_id, "LuaComponent", function(comp,vars)
		 vars.script_physics_body_modified = ""
	end)
end