dofile_once( "data/scripts/lib/coroutines.lua" )
dofile_once( "data/scripts/lib/utilities.lua" )

-- Description of overall boss behavior:
-- Boss waits for player to pick up item.
-- When item is collected, combat starts.
-- During combat if player is nearby, boss performs attacks and mauneuvers randomly (next_phase() sets phase variable).
-- Some attacks are performed several times in a row (phase_repeats).
-- If boss suffers enough damage it enters "aggro mode" with a different set of attacks.
-- If player moves away from the arena, boss gains cell eating ability and starts chasing.
-- Boss health and attacks vary based on how many orbs player has collected.

-- enum for changing C++ logic state. keep this in sync with the values in limbboss_system.cpp
local states = {
	MoveAroundNest = 0,
	FollowPlayer = 1,
	Escape = 2,
	DontMove = 3,
	MoveTo = 4,
	MoveDirectlyTowardsPlayer = 5,
}

local is_dead = false
local boss_chase = 0
local is_eye_open = false
local is_aggro = false
local orbcount = 0

function init_boss()
	local entity = GetUpdatedEntityID()
	
	local init_comp = get_variable_storage_component(entity, "initialized")

	-- look for stored initialization data
	--if get_variable_storage_component(entity, "initialized") == nil then
	if init_comp and ComponentGetValueBool(init_comp, "value_bool") == false then
		ComponentSetValue(init_comp, "value_bool", "1")
		
		-- Get the amount of orbs to adjust boss difficulty
		orbcount = GameGetOrbCountThisRun()
		
		-- Set boss HP based on orbs
		-- local boss_hp = 46.0 + orbcount * 15.0
		-- local boss_hp = 23.0 + ( 2.0 ^ (orbcount+1.5) ) + orbcount
		local boss_hp = 34.0 + ( 2.0 ^ (orbcount + 1.3) ) + (orbcount*15.5)

		local comp = EntityGetFirstComponent( entity, "DamageModelComponent" )
		if( comp ~= nil ) then
			ComponentSetValue( comp, "max_hp", tostring(boss_hp) )
			ComponentSetValue( comp, "hp", tostring(boss_hp) )
		end
	end
	
	-- Turn on the limbs
	local children = EntityGetAllChildren( entity )
	
	if children ~= nil then
		for _,it in ipairs(children) do
			EntitySetComponentsWithTagEnabled( it, "disabled_at_start", true )
		end
	end

	-- check if boss was in aggro mode
	is_aggro = get_variable_storage_component(entity, "aggro") ~= nil
end

init_boss()


-- gather some data we're gonna reuse --------------
local herd_id = get_herd_id( GetUpdatedEntityID() )
local subphase = 0
local phase_repeats = 0

-- Phase logic
function phase_chase_slow()
	close_eye()
	set_logic_state( states.FollowPlayer )
	boss_wait(2 * 60)
	next_phase()
end

function phase_chase_direct()
	close_eye()
	set_logic_state( states.MoveDirectlyTowardsPlayer )
	boss_wait(2 * 80)
	next_phase()
end

function phase_circleshot()
	move_to_reference()
	shield_on()
	open_eye()
	
	local shot_count = 10 + math.floor(orbcount / 3)
	local frame = GameGetFrameNum()
	local r = ProceduralRandomf(frame, frame)
	local spiral_speed = 25 * (r*2-1) -- random turn speed & direction with each attack
	
	for i=1,shot_count do
		circleshot(r * 180 + i*spiral_speed)
		boss_wait(12)
	end

	close_eye()
	boss_wait(60)

	set_logic_state( states.FollowPlayer )
	next_phase()
end

function phase_spawn_minion()
	set_logic_state( states.FollowPlayer )
	
	local spawn_count = 1 + math.floor(orbcount / 2)
	for i=1,spawn_count do
		if not minion_check_maxcount() then
			open_eye()
			spawn_minion()
			boss_wait(30)
		end
	end

	close_eye()
	next_phase()
end

function phase_chase()
	set_logic_state( states.FollowPlayer )
	close_eye()
	prepare_chase()
	chase_start()
	boss_wait(140)
	chase_stop()
	next_phase()
end

function phase_orb_mat()
	move_to_reference()
	
	--set_main_animation( "open", "opened" )
	--boss_wait(55)
	open_eye()

	orb_mat()
	
	if (orbcount > 2) then
		boss_wait(85)
		orb_mat()
	end
	
	if (orbcount > 6) then
		boss_wait(85)
		orb_mat()
	end
	
	boss_wait(20)
	--set_main_animation( "close", get_idle_animation_name() )
	--boss_wait(50)
	close_eye()
	set_logic_state( states.FollowPlayer )
	next_phase()
end

function phase_firepillar()
	move_to_reference()

	shield_on()
	open_eye()
	firepillar()
	boss_wait(60)
	close_eye()
	
	set_logic_state( states.FollowPlayer )
	next_phase()
end

function phase_explosion()
	set_logic_state( states.FollowPlayer )
	open_eye()
	
	if (orbcount < 6) then
		explode()
	else
		explode(true)
	end
	
	boss_wait(20)
	close_eye()
	
	set_logic_state( states.FollowPlayer )
	next_phase()
end

function phase_homingshot()
	open_eye()
	
	local shot_count = 4 + math.floor(orbcount * 0.5)
	for i=1,shot_count do
		homingshot()
		boss_wait(20)
	end

	close_eye()
	next_phase()
end

function phase_melee()
	open_eye()
	melee_attack()
	close_eye()
	next_phase()
end

function phase_clean_materials()
	set_logic_state( states.FollowPlayer )
	boss_wait(25)
	clear_materials()
	next_phase()
end


function phase_aggro()
	set_force_coeff_mult(5)
	set_main_animation("aggro", "aggro")
	
	boss_wait(60)

	-- circle shots to random directions
	local shot_count = 12 + math.floor(orbcount / 3)
	local frame = GameGetFrameNum()
	for i=1,shot_count do
		circleshot_aggro()
		boss_wait(12)
	end
	
	boss_wait(20)
	melee_attack()

	boss_wait(60)

	set_logic_state( states.FollowPlayer )
	next_phase()
end

function next_phase()
	shield_off()

	-- set a new phase
	local entity_id = GetUpdatedEntityID()
	local players = EntityGetWithTag( "player_unit" )
	if #players > 0 then
		local player_id = players[1]
		
		local xe,ye = EntityGetTransform( entity_id )
		local xp,yp = EntityGetTransform( player_id )
		
		local dist = get_distance(xp,yp,xe,ye)
		
		local phases = -- { phase, repeat amount }
		{
			{ phase_chase_slow, 0 },
			{ phase_circleshot, 2 },
			{ phase_spawn_minion, 0 },
			{ phase_chase, 0 },
			--{ phase_orb_mat, 0 }, -- TODO
			{ phase_firepillar, 3 },
			{ phase_homingshot, 0 },
			--{ phase_explosion, 0 }, -- TODO
		}

		if is_aggro then
			-- aggro mode, replace the usual phases with a more difficult selection
			phases =
			{
				--{ phase_chase, 0 },
				{ phase_aggro, 0 },
			}
		end

		if dist < 65 and not is_aggro then
			-- do a melee attack
			phase = phase_melee
			phase_repeats = 0
		elseif dist < 700 then -- use attack phases
			-- see if phase has repeats queued before picking a new one
			if phase_repeats > 0 then
				phase_repeats = phase_repeats - 1
				return
			end

			-- Every phase increases a 'subphase' variable, and at 6 subphase forces the boss to use the clean_materials phase
			if subphase < 6 then
				SetRandomSeed(xe+xp+subphase, ye+yp)
				local next_phase = random_from_array(phases)
				phase = next_phase[1]
				phase_repeats = next_phase[2]
				
				subphase = subphase + 1
			else
				subphase = 0
				phase_repeats = 0
				phase = phase_clean_materials
			end
		else -- further away: start chasin'
			phase = phase_chase_direct
		end
		
		-- If player is way too far, boss assumes they have left the arena entirely and sets up phase 2
		if (dist > 1300) and (boss_chase == 0) then
			boss_chase = 1
			
			local celleater = EntityGetFirstComponent( GetUpdatedEntityID(), "CellEaterComponent" )
		
			if (celleater ~= nil) then
				ComponentSetValue( celleater, "eat_probability", tostring(100.0) )
				ComponentSetValue( celleater, "radius", tostring(64.0) )
			end
			
			set_force_coeff_mult(5)

			
			phase = phase_chase_direct
		end
		
		--print("Boss distance: " .. tostring(dist))
	end
end


-- actual boss attacks -----------------

function circleshot(angle)
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local branches = 6 + orbcount - phase_repeats
	local space = math.floor(360 / branches)
	local speed = 80
	
	-- spawn projectiles on each branch
	for i=1,branches do
		local vel_x = math.cos( math.rad(angle) ) * speed
		local vel_y = math.sin( math.rad(angle) ) * speed
		shoot_projectile( this, "data/entities/animals/boss_centipede/orb_circleshot.xml", pos_x, pos_y, vel_x, vel_y )
		angle = angle + space
	end

	-- muzzle flash
	EntityLoad( "data/entities/particles/muzzle_flashes/muzzle_flash_circular_pink.xml", pos_x, pos_y)
end

function circleshot_aggro()
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local branches = 4 + orbcount
	local speed = 120
	local frame = GameGetFrameNum()
	
	-- spawn projectiles to random directions
	for i=1,branches do
		local r = ProceduralRandomf(frame + i, frame)
		local angle = r * 360
		local vel_x = math.cos( math.rad(angle) ) * speed
		local vel_y = math.sin( math.rad(angle) ) * speed
		shoot_projectile( this, "data/entities/animals/boss_centipede/orb_circleshot.xml", pos_x, pos_y, vel_x, vel_y )
	end

	GameCreateParticle( "slime_green", pos_x, pos_y, 50, 0, -20, true, false )

	-- muzzle flash
	EntityLoad( "data/entities/particles/muzzle_flashes/muzzle_flash_circular_pink.xml", pos_x, pos_y)
end

function homingshot()
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local vel_x = 0
	local vel_y = ProceduralRandomf(pos_x, pos_y + GameGetFrameNum(), -200, 50)

	shoot_projectile( this, "data/entities/animals/boss_centipede/orb_homing.xml", pos_x, pos_y, vel_x, vel_y )
end

function firepillar()
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local amount = 10 + orbcount - phase_repeats * 2
	local space  = math.floor(180 / amount)
	local speed  = 150
	local angle  = space * 0.5
	
	for i=1,amount do
		local vel_x = math.cos( math.rad(angle) ) * speed
		local vel_y = math.sin( math.rad(angle) ) * speed
		vel_y = vel_y - 200
		shoot_projectile( this, "data/entities/animals/boss_centipede/firepillar.xml", pos_x, pos_y, vel_x, vel_y )
		
		angle = angle + space
	end
	-- muzzle flash
	EntityLoad( "data/entities/particles/muzzle_flashes/muzzle_flash_circular.xml", pos_x, pos_y)
end

function explode(big_explosion_)
	local big_explosion = big_explosion_ or false
	
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	if big_explosion then
		shoot_projectile( this, "data/entities/animals/boss_centipede/boss_centipede_explosion_large.xml", pos_x, pos_y, 0, 0 )
	else
		shoot_projectile( this, "data/entities/animals/boss_centipede/boss_centipede_explosion.xml", pos_x, pos_y, 0, 0 )
	end
end

function orb_mat()
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )
	
	--local dir = math.random(0,1) * 2 - 1
	--local vel_x = dir * math.random(50,100)
	--local vel_y = math.random(-50,50)
	local frame = GameGetFrameNum()
	local dir = ProceduralRandomf(math.floor(pos_x + frame), pos_y, -1, 1)
	local vel_x = dir * ProceduralRandomf(pos_x + 1.0532, pos_y - 0.9622, 50, 100)
	local vel_y = ProceduralRandomf(pos_x, math.floor(pos_y + frame), -50,50)

	local names = {"lava","radioactive","blood"}
	
	if (orbcount > 2) then
		names = {"lava","radioactive","blood"}
	end
	
	if (orbcount > 6) then
		names = {"lava","radioactive","blood","oil"}
	end

	--local rnd = math.random(#names)
	local rnd = math.floor(ProceduralRandom(frame, frame, #names-1))+1
	shoot_projectile( this, "data/entities/animals/boss_centipede/orb_mat_" .. names[rnd] .. ".xml", pos_x, pos_y, vel_x, vel_y )
end

function melee_attack()
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local attack = shoot_projectile( this, "data/entities/animals/boss_centipede/melee.xml", pos_x, pos_y, 0, 0 )
end

function clear_materials()
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	shoot_projectile( this, "data/entities/animals/boss_centipede/clear_materials.xml", pos_x, pos_y, 0, 0 )
end

function minion_check_maxcount()
	return #EntityGetWithTag("boss_centipede_minion") >= 3 + orbcount
end

function spawn_minion()
	-- check that we only have less than N minions
	--if minion_check_maxcount() then return end
		
	-- spawn
	local x, y = EntityGetTransform( GetUpdatedEntityID() )
	EntityLoad( "data/entities/animals/boss_centipede/boss_centipede_minion.xml", x, y )
	EntityLoad( "data/entities/particles/muzzle_flashes/muzzle_flash_circular_blue.xml", x, y)
end

function shield_on()
	local children = EntityGetAllChildren( GetUpdatedEntityID())
	if children == nil then return end
	for _,v in ipairs(children) do
		if EntityGetName(v) == "shield_entity" then
			EntitySetComponentsWithTagEnabled( v, "shield", true )
			return
		end
	end
end

function shield_off()
	local children = EntityGetAllChildren( GetUpdatedEntityID())
	if children == nil then return end
	for _,v in ipairs(children) do
		if EntityGetName(v) == "shield_entity" then
			EntitySetComponentsWithTagEnabled( v, "shield", false )
			return
		end
	end
end

function prepare_chase()
	boss_wait(40)
end

function chase_start()
	set_force_coeff_mult(5)
	
	local celleater = EntityGetFirstComponent( GetUpdatedEntityID(), "CellEaterComponent" )
	
	if (celleater ~= nil) then
		--ComponentSetValue( celleater, "eat_probability", tostring(100.0) )
	end
end

function chase_stop()
	set_force_coeff_mult(1)
	
	local celleater = EntityGetFirstComponent( GetUpdatedEntityID(), "CellEaterComponent" )
	
	if (celleater ~= nil) then
		--ComponentSetValue( celleater, "eat_probability", tostring(0.0) )
	end
end

-- Setting the boss movement logic state
function set_logic_state( state )
	edit_component( GetUpdatedEntityID(), "LimbBossComponent", function(comp,vars)
		vars.state = state
	end)

	-- DEBUG:
	local ai = EntityGetFirstComponent( GetUpdatedEntityID(), "LimbBossComponent" )
	local old = 0
	
	if (ai ~= nil) then
		old = tonumber(ComponentGetValue( ai, "state" ))
	end
	
	local on,nn = "",""
	
	for i,v in pairs(states) do
		if (v == old) then
			on = i
		end
		
		if (v == state) then
			nn = i
		end
	end
	
	--print("Changing state from " .. tostring(on) .. " to " .. tostring(nn))
end

-- Special code for moving to a set position
function move_to_reference()
	if ( boss_chase == 0 ) then
		local reference = EntityGetWithTag( "reference" )
		if ( #reference > 0 ) then
			local reference_id = reference[1]
			local x,y = EntityGetTransform( reference_id )
			move_to( x, y )
		else
			print("Boss - NO REFERENCE FOUND!!!")
		end
	else
		set_logic_state( states.FollowPlayer )
	end
end

function move_to( x, y )
	set_logic_state( states.MoveTo )

	edit_component( GetUpdatedEntityID(), "LimbBossComponent", function(comp,vars)
		vars.mMoveToPositionX = x
		vars.mMoveToPositionY = y
	end)
end

function open_eye()
	if is_eye_open then return end
	set_main_animation( "open", "opened" )
	is_eye_open = true
	boss_wait(55)
end

function close_eye()
	-- don't close eye if there's still attacks lined up
	if not is_eye_open or phase_repeats > 0 then return end
	set_main_animation("close", get_idle_animation_name())
	is_eye_open = false
	boss_wait(50)
end

-- The boss can't die normally; if their HP is zero, this does stuff instead
function check_death()
	if is_dead then return end
	
	local entity_id = GetUpdatedEntityID()
	SetRandomSeed( GameGetFrameNum(), GameGetFrameNum() )

	local comp = EntityGetFirstComponent( entity_id, "DamageModelComponent" )
	if( comp ~= nil ) then
		local hp = ComponentGetValueFloat( comp, "hp" )

		-- check aggro
		if not is_aggro then
			local max_hp = ComponentGetValueInt( comp, "max_hp")
			is_aggro = hp <= clamp(max_hp * 0.1, 9, 40)
			--print("hp/max: " .. hp .. " / " .. max_hp)

			-- enter aggro mode
			if is_aggro then
				-- store aggro to entity
				EntityAddComponent( entity_id, "VariableStorageComponent", 
				{ 
					name = "aggro",
				})

				set_main_animation("aggro", "aggro")

				-- spawn body chunks
				local x,y = EntityGetTransform( entity_id )
				local o = EntityLoad( "data/entities/animals/boss_centipede/body_chunks.xml", x, y)
				PhysicsApplyForce( o, 0, -600)
				PhysicsApplyTorque( o, 200)
				GameCreateParticle( "slime_green", x+20, y, 250, 0, -20, true, false )
			
				phase_repeats = 0
				next_phase()
			end
		end

		-- check death
		if ( hp <= 0.0 ) then
			move_to_reference()
			GameTriggerMusicFadeOutAndDequeueAll()

			local o = EntityLoad( "data/entities/animals/boss_centipede/body_chunks.xml", x, y)
				PhysicsApplyForce( o, 0, -600)
				PhysicsApplyTorque( o, 200)

			for i = 1,40 do
				local rand = function() return Random( -10, 10 ) end
				local x,y = EntityGetTransform( entity_id )
				GameScreenshake( i * 1, x, y )
				GameCreateParticle( "slime_green",            x + rand(), y + rand(), 10, i * 5.5, i * 5.5, true, false )
				if i > 20 then
					GameCreateParticle( "gunpowder_unstable", x + rand(), y + rand(), 3,  40.0,    40.0,    true, false )
				end

				wait( 3 )
			end
			
			local reference = EntityGetWithTag( "reference" )
			local x_portal,y_portal = EntityGetTransform( GetUpdatedEntityID() )
			
			if ( #reference > 0 ) then
				local ref_id = reference[1]
				x_portal,y_portal = EntityGetTransform( ref_id )
				EntityKill( ref_id )
			end
			
			EntityLoad( "data/entities/buildings/teleport_ending_victory.xml", x_portal, y_portal )

			-- kill
			comp = EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" )
			if( comp ~= nil ) then
				ComponentSetValue( comp, "kill_now", "1" )
			end

			StatsLogPlayerKill() -- this is needed because otherwise the boss kill doesn't get registered as a kill for the player
			is_dead = true

			return
		end
	end
end

-- Basic idle function
function boss_wait( frames )
	check_death()
	wait( frames )
	check_death()
end

function animate_sprite( sprite, current_name, next_name )
	GamePlayAnimation( GetUpdatedEntityID(), current_name, 0, next_name, 0 )
end

function get_idle_animation_name()
	return "stand"
end

function set_main_animation( current_name, next_name )
	local sprite = EntityGetFirstComponent( GetUpdatedEntityID(), "SpriteComponent" )
	if ( sprite ~= nil ) then
		if not is_aggro then
			animate_sprite( sprite, current_name, next_name )
		else
			-- aggro overrides animations
			animate_sprite( sprite, "aggro", "aggro" )
		end
	end
end

function set_force_coeff_mult( mult )
	local entity_id = GetUpdatedEntityID()
	local physics_ai = EntityGetFirstComponent( entity_id, "PhysicsAIComponent" )

	if (physics_ai ~= nil) then
		-- use a hardcoded value instead of getting from comp to avoid varying the value across save/load serialization
		-- remember to update value here if changed in the component
		local force_coeff_orig = 14.0
		ComponentSetValue( physics_ai, "force_coeff", tostring( force_coeff_orig * mult ) )
	end
end

-- run phase state machine -----------------

next_phase()
-- always start combat with circle shots
--if get_initialized() then
--	phase = phase_circleshot
--	phase_repeats = 2
--end

async_loop(function()

	-- alive
	if is_dead then
		wait(60 * 10)
	else
		phase()
	end

end)