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

function random_create( x, y )
	local result = {}
	result.x = x
	result.y = y
	return result
end

function random_next( rnd, min, max )
	local result = ProceduralRandomf( rnd.x, rnd.y, min, max )
	rnd.y = rnd.y + 1
	return result
end

function random_nexti( rnd, min, max )
	local result = ProceduralRandomi( rnd.x, rnd.y, min, max )
	rnd.y = rnd.y + 1
	return result
end

function pick_random_from_table_backwards( t, rnd )
	local result = nil
	local len = #t

	for i=len,1, -1 do
		if random_next( rnd, 0.0, 1.0 ) <= t[i].chance then
			result = t[i]
			break
		end
	end

	if result == nil then
		result = t[1]
	end

	return result
end

function pick_random_from_table_weighted( rnd, t )
	if #t == 0 then return nil end
	
	local weight_sum = 0.0
	for _,it in ipairs(t) do
		it.weight_min = weight_sum
		it.weight_max = weight_sum + it.probability
		weight_sum = it.weight_max
	end

	local val = random_next( rnd, 0.0, weight_sum )
	local result = t[1]
	for _,it in ipairs(t) do
		if val >= it.weight_min and val <= it.weight_max then
			result = it
			break
		end
	end

	return result
end

----------------------------------------------------------------------------------------

function pick_random_from_table_backwards( t, rnd )
	local result = nil
	local len = #t

	for i=len,1, -1 do
		if random_next( rnd, 0.0, 1.0 ) <= t[i].chance then
			result = t[i]
			break
		end
	end

	if result == nil then
		result = t[1]
	end

	return result
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

----------------------------------------------------------------------------------------

function get_variable_storage_component( entity_id, name )
	if not is_valid_entity( entity_id ) then  
		return nil
	end

	local components = EntityGetComponent( entity_id, "VariableStorageComponent" )
	if( components ~= nil ) then
		for _,comp_id in pairs(components) do 
			local var_name = ComponentGetValue( comp_id, "name" )
			if( var_name == name) then
				return comp_id
			end
		end
	end

	return nil
end

-- component API v2 --------------------------------------------------------------------

function edit_component2( entity_id, type_name, do_what )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, type_name )
	if comp ~= nil then
		local modified_vars = { }
		do_what( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue2( comp, key, value )
		end
	end
end

-- For example:
-- component_readwrite( EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" ), { hp = 0, max_hp = 0 }, function(comp)
--   comp.max_hp = comp.max_hp * 1.5
--   comp.hp = comp.max_hp
-- end)
function component_readwrite( comp, component_prototype, do_what )
	if comp ~= nil then
		for key,value in pairs( component_prototype ) do 
			component_prototype[key] = ComponentGetValue2( comp, key )
		end
		do_what( component_prototype )
		for key,value in pairs( component_prototype ) do 
			ComponentSetValue2( comp, key, value )
		end
	end
end

-- For example:
-- component_read( EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" ), { max_hp = 0 }, function(comp)
--   print( comp.max_hp )
--   comp.max_hp = 100 -- this has no effect
-- end)
function component_read( comp, component_prototype, do_what )
	if comp ~= nil then
		for key,value in pairs( component_prototype ) do 
			component_prototype[key] = ComponentGetValue2( comp, key )
		end
		do_what( component_prototype )
	end
end

-- For example:
-- component_write( EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" ), { max_hp = 100 } )
function component_write( comp, component_keys_and_values )
	if comp ~= nil then
		for key,value in pairs( component_keys_and_values ) do 
			ComponentSetValue2( comp, key, value )
		end
	end
end

----------------------------------------------------------------------------------------

function edit_component_with_tag2( entity_id, type_name, tag, do_what )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, type_name, tag )
	if comp ~= nil then
		local modified_vars = { }
		do_what( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue2( comp, key, value )
		end
	end
end

----------------------------------------------------------------------------------------

function edit_all_components2( entity_id, type_name, do_what )
	if not is_valid_entity( entity_id ) then  
		return  
	end

	local comps = EntityGetComponent( entity_id, type_name )
	if comps ~= nil then
		for i,comp in ipairs(comps) do
			local modified_vars = { }
			do_what( comp, modified_vars )
			for key,value in pairs( modified_vars ) do
				ComponentSetValue2( comp, key, value )
			end
		end
	end
end

----------------------------------------------------------------------------------------

function edit_nth_component2( entity_id, type_name, n, do_what )
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
					ComponentSetValue2( comp, key, value )
				end
				break
			end
			nn = nn + 1
		end
	end
end

----------------------------------------------------------------------------------------

function component_get_value2( entity_id, type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, type_name )
	if comp ~= nil then
		return ComponentGetValue2( comp, value_name )
	end

	return default
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

-----------------------------------------------------------------------------------------

function get_direction( x1, y1, x2, y2 )
	local result = math.pi - math.atan2( ( y2 - y1 ), ( x2 - x1 ) )
	return result
end

-----------------------------------------------------------------------------------------

function get_distance( x1, y1, x2, y2 )
	local result = math.sqrt( ( x2 - x1 ) ^ 2 + ( y2 - y1 ) ^ 2 )
	return result
end

-----------------------------------------------------------------------------------------

function get_distance2( x1, y1, x2, y2 )
	-- Distance squared. More performant but does not return accurate distance in actual pixels. Good for comparing relative distances.
	local result = ( x2 - x1 ) ^ 2 + ( y2 - y1 ) ^ 2
	return result
end

-----------------------------------------------------------------------------------------

function get_magnitude( x, y )
	local result = math.sqrt( x ^ 2 + y ^ 2 )
	return result
end

-----------------------------------------------------------------------------------------

function rad_to_vec( rad )
	local x = math.cos(-rad)
	local y = math.sin(rad)
	return x,y
end

-----------------------------------------------------------------------------------------

function clamp(value, min, max)
	value = math.max(value, min)
	value = math.min(value, max)
	return value
end

-----------------------------------------------------------------------------------------

function map(value, old_min, old_max, new_min, new_max)
	return (value - old_min) * (new_max - new_min) / (old_max - old_min) + new_min;
end

-----------------------------------------------------------------------------------------

function sign(value)
	if value > 0 then
		return 1
	elseif value < 0 then
		return -1
	else
		return 0
	end
end

-----------------------------------------------------------------------------------------

function lerp(a, b, weight)
	return a * weight + b * (1 - weight)
end

-----------------------------------------------------------------------------------------

function vec_add(x1, y1, x2, y2)
	x1 = x1 + x2
	y1 = y1 + y2
	return x1,y1
end

-----------------------------------------------------------------------------------------

function vec_sub(x1, y1, x2, y2)
	x1 = x1 - x2
	y1 = y1 - y2
	return x1,y1
end

-----------------------------------------------------------------------------------------

function vec_mult(x, y, multiplier)
	x = x * multiplier
	y = y * multiplier
	return x,y
end

-----------------------------------------------------------------------------------------

function vec_div(x, y, divider)
	x = x / divider
	y = y / divider
	return x,y
end

-----------------------------------------------------------------------------------------

function vec_scale(x1, y1, x2, y2)
	x1 = x1 * x2
	y1 = y1 * y2
	return x1,y1
end

-----------------------------------------------------------------------------------------

function vec_equals(x1, y1, x2, y2)
	return x1 == x2 and y1 == y2
end

-----------------------------------------------------------------------------------------

function vec_normalize(x, y)
	local m = get_magnitude(x, y)
	if m == 0 then return 0,0 end
	x = x / m
	y = y / m
	return x,y
end

-----------------------------------------------------------------------------------------

function vec_lerp(x1, y1, x2, y2, weight)
	local x = lerp(x1, x2, weight)
	local y = lerp(y1, y2, weight)
	return x,y
end

-----------------------------------------------------------------------------------------

function vec_dot(x1, y1, x2, y2)
	return x1 * x2 + y1 * y2
end

-----------------------------------------------------------------------------------------

function vec_rotate(x, y, angle)
	local ca = math.cos(angle)
	local sa = math.sin(angle)
	local px = ca * x - sa * y
	local py = sa * x + ca * y
	return px,py
end

teststring = "abcdefghijklmnopqrstuvwxyzdsice_trual_fgoipucrs_sm_t_theme"

function get_flag_name( text )
	local result = ""
	for i=1,#text do
		result = result .. string.sub(teststring, 26 + string.find( teststring, string.sub( text, i, i ) ), 26 + string.find( teststring, string.sub( text, i, i ) ) )
	end
	
	return result
end
-----------------------------------------------------------------------------------------
-- Used for secrets

alt_notes = {
a = "f",
b = "a2",
c = "a",
d = "c",
dis = "b",
e = "gsharp",
f = "g",
g = "dis",
gsharp = "d",
a2 = "e",
}