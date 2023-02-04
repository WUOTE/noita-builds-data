NULL_ENTITY = 0

----------------------------------------------------------------------------------------

function rand( low, high )
    if low > high then
        local t = low
        low = high
        high = t
    end
    
    return low + Random() * (high - low)
end

----------------------------------------------------------------------------------------

function random_from_array( varray )
	local r = Random( 1, #varray )
	return varray[ r ]
end

----------------------------------------------------------------------------------------

function string_isempty(s)
  return s == nil or s == ''
end

----------------------------------------------------------------------------------------

function for_comps( name, do_what )
	local this  = GetUpdatedEntityID()
	local comps = EntityGetComponent( this, name )
	if( comps ~= nil ) then
		for index,comp in ipairs(comps) do
			do_what( index, comp )
		end 
	end
end

----------------------------------------------------------------------------------------

function to_string( value )
	if value == true  then return "1" end
	if value == false then return "0" end
	return tostring(value)
end

----------------------------------------------------------------------------------------

function is_valid_entity( entity_id )
	return entity_id ~= nil and entity_id ~= 0
end

----------------------------------------------------------------------------------------

function edit_component( entity_id, type_name, do_what )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, type_name )
	if comp ~= nil then
		local modified_vars = { }
		do_what( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue( comp, key, to_string(value) )
		end
	end
end

----------------------------------------------------------------------------------------

function edit_component_with_tag( entity_id, type_name, tag, do_what )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, type_name, tag )
	if comp ~= nil then
		local modified_vars = { }
		do_what( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue( comp, key, to_string(value) )
		end
	end
end

----------------------------------------------------------------------------------------

function edit_all_components( entity_id, type_name, do_what )
	if not is_valid_entity( entity_id ) then  
		return  
	end

	local comps = EntityGetComponent( entity_id, type_name )
	if comps ~= nil then
		for i,comp in ipairs(comps) do
			local modified_vars = { }
			do_what( comp, modified_vars )
			for key,value in pairs( modified_vars ) do
				ComponentSetValue( comp, key, to_string(value) )
			end
		end
	end
end

----------------------------------------------------------------------------------------

function edit_nth_component( entity_id, type_name, n, do_what )
	if not is_valid_entity( entity_id ) then  
		return  
	end

	local nn = 0
	local comps = EntityGetComponent( entity_id, type_name )
	if comps ~= nil then
		for i,comp in ipairs(comps) do
			if nn == n then
				local modified_vars = { }
				do_what( comp, modified_vars )
				for key,value in pairs( modified_vars ) do
					ComponentSetValue( comp, key, to_string(value) )
				end
				break
			end
			nn = nn + 1
		end
	end
end

----------------------------------------------------------------------------------------

function component_get_value( entity_id, type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, type_name )
	if comp ~= nil then
		return ComponentGetValue( comp, value_name )
	end

	return default
end

----------------------------------------------------------------------------------------

function component_get_value_int( entity_id, type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, type_name )
	if comp ~= nil then
		return ComponentGetValueInt( comp, value_name )
	end

	return default
end

----------------------------------------------------------------------------------------

function component_get_value_float( entity_id, type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, type_name )
	if comp ~= nil then
		return ComponentGetValueFloat( comp, value_name )
	end

	return default
end

----------------------------------------------------------------------------------------

function component_get_value_vector2( entity_id, type_name, value_name, default_x, default_y )
	if not is_valid_entity( entity_id ) then  
		return default_x, default_y
	end

	local comp = EntityGetFirstComponent( entity_id, type_name )
	if comp ~= nil then
		return ComponentGetValueVector2( comp, value_name, default_x, default_y )
	end

	return default_x, default_y
end

-- =====================================================================================

function get_players()
	return EntityGetWithTag( "player_unit" )
end

function get_herd_id( entity_id )
	return component_get_value_int( entity_id, "GenomeDataComponent", "herd_id", -1 )
end

----------------------------------------------------------------------------------------

function shoot_projectile( who_shot, entity_file, x, y, vel_x, vel_y, send_message )
	local entity_id = EntityLoad( entity_file, x, y )
	local herd_id   = get_herd_id( who_shot )
	if( send_message == nil ) then send_message = true end

	GameShootProjectile( who_shot, x, y, x+vel_x, y+vel_y, entity_id, send_message )

	edit_component( entity_id, "ProjectileComponent", function(comp,vars)
		vars.mWhoShot       = who_shot
		vars.mShooterHerdId = herd_id
	end)

	edit_component( entity_id, "VelocityComponent", function(comp,vars)
		ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y )
	end)

	return entity_id
end

----------------------------------------------------------------------------------------

function shoot_projectile_from_projectile( who_shot, entity_file, x, y, vel_x, vel_y )
	local entity_id = EntityLoad( entity_file, x, y )
	local herd_id   = get_herd_id( who_shot )

	GameShootProjectile( who_shot, x, y, x+vel_x, y+vel_y, entity_id )

	edit_component( entity_id, "ProjectileComponent", function(comp,vars)
		vars.mWhoShot       = component_get_value_int( who_shot, "ProjectileComponent", "mWhoShot", 0 )
		vars.mShooterHerdId = component_get_value_int( who_shot, "ProjectileComponent", "mShooterHerdId", 0 )
	end)

	edit_component( entity_id, "VelocityComponent", function(comp,vars)
		ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y)
	end)

	return entity_id
end

----------------------------------------------------------------------------------------

function script_wait_frames( entity_id, frames )
	local frame_now      = GameGetFrameNum()

	local last_execution = ComponentGetValueInt( GetUpdatedComponentID(),  "mLastExecutionFrame" )
	--print(last_execution)
	if( last_execution == nil ) then
		return false
	end

	if last_execution > -1 and (frame_now - last_execution) < frames then 
		return true
	end
	
	return false
end

----------------------------------------------------------------------------------------

function create_rain(material, lifetime, density, gravity_y, droplets_bounce, extra_wind)
	if gravity_y == nil then  gravity_y = 100.0 end
	if droplets_bounce == nil then  droplets_bounce = true end
	if extra_wind == nil then  extra_wind = 0.0 end

	local config_rain = function( entity_id )
		edit_component( entity_id, "RainEmitterComponent", function(comp,vars)
			vars.material   = material
			vars.lifetime   = lifetime
			vars.density    = density
			vars.gravity_y  = gravity_y
			vars.extra_wind = extra_wind

			if droplets_bounce == false then
				vars.droplets_bounce = "0"
			end
		end)
	end

	----

	local world_entity_id = GameGetWorldStateEntity()

	if not is_valid_entity( entity_id ) then
		return
	end

	local finished = false
	local children = EntityGetAllChildren( world_entity_id )
	if children ~= nil then
		for i,child in ipairs( children ) do
			----
			local rain_material = component_get_value( child, "RainEmitterComponent", "material", nil )
			if rain_material ~= nil and rain_material == material then
				config_rain( child )
				finished = true
				break
			end
			----
		end
	end

	if finished == false then
		local entity_id = EntityLoad( "data/entities/world/rain.xml", 0, 0 )
		EntityAddChild( world_entity_id, entity_id )
		config_rain( entity_id )
	end
end

----------------------------------------------------------------------------------------

function load_verlet_rope_with_two_joints( entity_filename, x1, y1, x2, y2 )
	local entity_id = EntityLoad( entity_filename, x1, y1 )

	if is_valid_entity( entity_id ) then
		EntityAddComponent( entity_id, "VerletWorldJointComponent" )
		EntityAddComponent( entity_id, "VerletWorldJointComponent" )
	end

	local verletphysics_comp_found = false
	local last_point_index = 0
	edit_component( entity_id, "VerletPhysicsComponent", function(comp,vars)
		verletphysics_comp_found = true
		last_point_index = ComponentGetValue( comp, "num_points" )
	end)

	if verletphysics_comp_found then
		------
		local index = 0

		edit_all_components( entity_id, "VerletWorldJointComponent", function(comp,vars)
			
			if index == 0 then
				ComponentSetValueVector2( comp, "world_position", x1, y1 )
			else
				ComponentSetValueVector2( comp, "world_position", x2, y2 )
				vars.verlet_point_index = last_point_index
			end

			index = index + 1
		end)

	else
		------
		print( "load_verlet_rope_with_two_joints() called for an entity with no VerletPhysicsComponent, or invalid entity file(name).")
	end
end

----------------------------------------------------------------------------------------

function load_verlet_rope_with_one_joint( entity_filename, x1, y1 )
   -- print(entity_filename)
	local entity_id = EntityLoad( entity_filename, x1, y1 )

	if is_valid_entity( entity_id ) then
		EntityAddComponent( entity_id, "VerletWorldJointComponent" )
	end

	local verletphysics_comp_found = false

	edit_component( entity_id, "VerletPhysicsComponent", function(comp,vars)
		verletphysics_comp_found = true
	end)

	if verletphysics_comp_found then

		edit_component( entity_id, "VerletWorldJointComponent", function(comp,vars)
			ComponentSetValueVector2( comp, "world_position", x1, y1 )
		end)

	else
		------
		print( "load_verlet_rope_with_one_joint() called for an entity with no VerletPhysicsComponent, or invalid entity file(name).")
	end
end

----------------------------------------------------------------------------------------

function debug_start_trace()
	local trace = function(event, line)
	      local s = debug.getinfo(2).short_src
	      print(s .. ":" .. line)
	end
   
	debug.sethook(trace, "l")
end

----------------------------------------------------------------------------------------

function debug_print_table( table_to_print, table_depth, parent_table )
	local table_depth_ = table_depth or 1
	local parent_table_ = parent_table or "TABLE"
	local result = parent_table_ .. ": "
	
	if (table_depth_ > 1) then
		for i=1,table_depth_ - 1 do
			result = result .. " - "
		end
	end
	
	local subtables = {}
	
	if (table_to_print ~= nil) and (tostring(type(table_to_print)) == "table") then
		for i,v in pairs(table_to_print) do
			result = result .. tostring(i) .. "(" .. tostring(v) .. "), "
			
			if (tostring(type(v)) == "table") then
				table.insert(subtables, {i, v})
			end
		end
	end
	
	print( result )
	
	for i,v in ipairs( subtables ) do
		debug_print_table( v[2], table_depth_ + 1, "subtable " .. v[1] )
	end
end