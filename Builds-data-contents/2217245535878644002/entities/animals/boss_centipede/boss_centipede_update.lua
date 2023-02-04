dofile( "data/scripts/lib/coroutines.lua" )
dofile( "data/scripts/lib/utilities.lua" )

-- enum for changing C++ logic state. keep this in sync with the values in limbboss_system.cpp

local states = {
	MoveAroundNest = 0,
	FollowPlayer = 1,
	Escape = 2,
	DontMove = 3,
	MoveTo = 4,
	MoveDirectlyTowardsPlayer = 5,
}

local details_hidden 	= false
local is_dead        	= false
local boss_chase		= 0

function init_boss()
	-- Get the amount of orbs to adjust boss difficulty
	orbcount = GameGetOrbCountThisRun()
	--orbcount = 10
	
	-- Set boss HP based on orbs
	-- local boss_hp = 46.0 + orbcount * 15.0
	-- local boss_hp = 23.0 + ( 2.0 ^ (orbcount+1.5) ) + orbcount
	local boss_hp = 18.0 + ( 2.0 ^ (orbcount+1.5) ) + (orbcount*7.5)

	comp = EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" )
	if( comp ~= nil ) then
		ComponentSetValue( comp, "max_hp", tostring(boss_hp) )
		ComponentSetValue( comp, "hp", tostring(boss_hp) )
	end
	
	-- Turn on the limbs
	local children = EntityGetAllChildren( GetUpdatedEntityID() )
	
	if children ~= nil then
		for i,it in ipairs(children) do
			EntitySetComponentsWithTagEnabled( it, "disabled_at_start", true )
		end
	end
	
	--set_main_animation( get_idle_animation_name(), get_idle_animation_name() )
end

init_boss()

-- gather some data we're gonna reuse --------------
local herd_id = get_herd_id( GetUpdatedEntityID() )
local force_coeff_orig = component_get_value_float(  GetUpdatedEntityID(), "PhysicsAIComponent", "force_coeff", 10.0 )
local subphase = 0

-- Phase logic
function phase_chase_slow()
	--print("phase_chase_slow")
	set_logic_state( states.FollowPlayer )
	boss_wait(2 * 60)
	choose_random_phase()
end

function phase_chase_direct()
	--print("phase_chase_slow")
	set_logic_state( states.MoveDirectlyTowardsPlayer )
	boss_wait(2 * 80)
	choose_random_phase()
end

function phase_circleshot()
	--print("phase_circleshot")
	move_to_reference()
	
	local wait_duration = 50 - orbcount * 2
	local shot_count = 2 + math.floor(orbcount * 0.5)
	
	set_main_animation( "open", "opened" )
	
	boss_wait(70)
	for i=1,shot_count do
		circleshot()
		boss_wait(wait_duration)
	end
	
	boss_wait(25)
	
	set_main_animation( "close", get_idle_animation_name() )
	
	boss_wait(65)
	set_logic_state( states.FollowPlayer )
	choose_random_phase()
end

function phase_spawn_minion()
	--print("phase_spawn_minion")
	set_logic_state( states.FollowPlayer )
	
	local at_maximum = minion_check_maxcount()
	
	if ( at_maximum == false ) then
		set_main_animation( "open", "opened" )
		
		boss_wait(40)
		spawn_minion()
		
		if (orbcount > 4) then
			boss_wait(70)
			spawn_minion()
		end
		
		if (orbcount >= 10) then
			boss_wait(70)
			spawn_minion()
		end
		
		boss_wait(20)
		set_main_animation( "close", get_idle_animation_name() )
		boss_wait(50)
	else
		boss_wait(20)
	end
	
	choose_random_phase()
end

function phase_chase()
	--print("phase_chase")
	set_logic_state( states.FollowPlayer )
	prepare_chase()
	chase_start()
	boss_wait(140)
	chase_stop()
	choose_random_phase()
end

function phase_orb_mat()
	--print("phase_orb_mat")
	move_to_reference()
	
	set_main_animation( "open", "opened" )
	boss_wait(40)
	
	orb_mat()
	
	if (orbcount > 2) then
		boss_wait(70)
		orb_mat()
	end
	
	if (orbcount > 6) then
		boss_wait(70)
		orb_mat()
	end
	
	boss_wait(20)
	set_main_animation( "close", get_idle_animation_name() )
	boss_wait(50)
	set_logic_state( states.FollowPlayer )
	choose_random_phase()
end

function phase_firepillar()
	--print("phase_firepillar")
	move_to_reference()

	set_main_animation( "open", "opened" )
	
	boss_wait(50)
	firepillar()

	if (orbcount > 6) then
		boss_wait(80)
		firepillar()
	end
	
	boss_wait(20)
	
	set_main_animation( "close", get_idle_animation_name() )
	
	boss_wait(80)
	
	set_logic_state( states.FollowPlayer )
	choose_random_phase()
end

function phase_homingshot()

	set_main_animation( "open", "opened" )
	
	boss_wait(40)
	
	local shot_count = 2 + math.floor(orbcount * 0.5)
	for i=1,shot_count do
		homingshot()
		boss_wait(20)
	end
	
	set_main_animation( "close", get_idle_animation_name() )
	boss_wait(50)
	
	choose_random_phase()
end

function phase_clean_materials()
	--print("phase_clean_materials")
	set_logic_state( states.FollowPlayer )
	boss_wait(10)
	clear_materials()
	choose_random_phase()
end

-- Function for picking the next phase
function choose_random_phase()
	local entity_id = GetUpdatedEntityID()
	local player = EntityGetWithTag( "player_unit" )
	
	if (player ~= nil) then
		local player_id = player[1]
		
		local xe,ye = EntityGetTransform( entity_id )
		local xp,yp = EntityGetTransform( player_id )
		local xdist = (xp - xe)
		local ydist = (yp - ye)

		local dist = math.sqrt( xdist*xdist + ydist*ydist )
		
		-- If near player, use normal phases
		if (dist < 700) then
			-- Every phase increases a 'subphase' variable, and at 10 subphase forces the boss to use the clean_materials phase
			if (subphase < 10) then
				local r = math.random(0,6)
				print("Boss subphase: " .. tostring(subphase) .. ", phase: " .. tostring(r))
				if     r == 0 then phase = phase_chase_slow
				elseif r == 1 then phase = phase_circleshot
				elseif r == 2 then phase = phase_spawn_minion
				elseif r == 3 then phase = phase_chase
				elseif r == 4 then phase = phase_orb_mat
				elseif r == 5 then phase = phase_firepillar
				elseif r == 6 then phase = phase_homingshot
				end
				
				subphase = subphase + 1
			else
				subphase = 0
				phase = phase_clean_materials
			end
		else
			-- If further from player, start chasin'
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
			
			local physics_ai = EntityGetFirstComponent( GetUpdatedEntityID(), "PhysicsAIComponent" )
			
			if (physics_ai ~= nil) then
				ComponentSetValue( physics_ai, "force_coeff", tostring( force_coeff_orig * 5.0 ) )
			end
			
			phase = phase_chase_direct
		end
		
		print("Boss distance: " .. tostring(dist))
	end
end


-- actual boss attacks -----------------

function circleshot()
	--print("circleshot")
	boss_wait(15)

	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local angle  = 0
	local amount = 8 + orbcount
	local space  = math.floor(360 / amount)
	local speed  = 130
	
	for i=1,amount do
		local vel_x = math.cos( math.rad(angle) ) * speed
		local vel_y = math.sin( math.rad(angle) ) * speed
		angle = angle + space

		local orb = shoot_projectile( this, "data/entities/animals/boss_centipede/orb_circleshot.xml", pos_x, pos_y, vel_x, vel_y )
	end
end

function homingshot()
	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local vel_x = 0
	local vel_y = -30

	shoot_projectile( this, "data/entities/animals/boss_centipede/orb_homing.xml", pos_x, pos_y, vel_x, vel_y )
end

function firepillar()
	boss_wait(15)

	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local amount = 8 + math.floor(orbcount * 0.2)
	local space  = math.floor(180 / amount)
	local speed  = 40 + orbcount * 5
	local angle  = space * 0.5
	
	for i=1,amount do
		local vel_x = math.cos( math.rad(angle) ) * speed
		local vel_y = math.sin( math.rad(angle) ) * speed
		angle = angle + space

		local pillar = shoot_projectile( this, "data/entities/animals/boss_centipede/firepillar.xml", pos_x, pos_y, vel_x, vel_y )
	end
end

function orb_mat()
	boss_wait(15)

	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )
	
	local dir = math.random(0,1) * 2 - 1
	local vel_x = dir * math.random(50,100)
	local vel_y = math.random(-50,50)

	local names = {"lava","radioactive","blood"}
	
	if (orbcount > 2) then
		names = {"lava","radioactive","blood"}
	end
	
	if (orbcount > 6) then
		names = {"lava","radioactive","blood","oil"}
	end

	local rnd = math.random(#names)
	local pillar = shoot_projectile( this, "data/entities/animals/boss_centipede/orb_mat_" .. names[rnd] .. ".xml", pos_x, pos_y, vel_x, vel_y )
end

function clear_materials()
	boss_wait(15)

	local this         = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( this )

	local pillar = shoot_projectile( this, "data/entities/animals/boss_centipede/clear_materials.xml", pos_x, pos_y, 0, 0 )
end

function minion_check_maxcount()
	local result = false
	
	local existing_minion_count = 0
	local existing_minions = EntityGetWithTag( "boss_centipede_minion" )
	if existing_minions ~= nil then
		existing_minion_count = #existing_minions
	end
	
	local minion_max = 1 + math.floor(orbcount / 3)

	if existing_minion_count >= minion_max then
		result = true
	end
	
	return result
end

function spawn_minion()
	-- check that we only have less than N minions
	if (minion_check_maxcount() == false) then
		-- spawn
		local x, y = EntityGetTransform( GetUpdatedEntityID() )
		EntityLoad( "data/entities/animals/boss_centipede/boss_centipede_minion.xml", x, y )
	end
end

function prepare_chase()
	boss_wait(40)
end

function chase_start()
	local physics_ai = EntityGetFirstComponent( GetUpdatedEntityID(), "PhysicsAIComponent" )
	
	if (physics_ai ~= nil) then
		ComponentSetValue( physics_ai, "force_coeff", tostring( force_coeff_orig * 5.0 ) )
	end
	
	local celleater = EntityGetFirstComponent( GetUpdatedEntityID(), "CellEaterComponent" )
	
	if (celleater ~= nil) then
		--ComponentSetValue( celleater, "eat_probability", tostring(100.0) )
	end
end

function chase_stop()
	local physics_ai = EntityGetFirstComponent( GetUpdatedEntityID(), "PhysicsAIComponent" )
	
	if (physics_ai ~= nil) then
		ComponentSetValue( physics_ai, "force_coeff", tostring( force_coeff_orig ) )
	end
	
	local celleater = EntityGetFirstComponent( GetUpdatedEntityID(), "CellEaterComponent" )
	
	if (celleater ~= nil) then
		--ComponentSetValue( celleater, "eat_probability", tostring(0.0) )
	end
end

-- Setting the boss movement logic state
function set_logic_state( state )
	local ai = EntityGetFirstComponent( GetUpdatedEntityID(), "LimbBossComponent" )
	local old = 0
	
	if (ai ~= nil) then
		old = tonumber(ComponentGetValue( ai, "state" ))
	end
	
	edit_component( GetUpdatedEntityID(), "LimbBossComponent", function(comp,vars)
		vars.state = state
	end)
	
	local on,nn = "",""
	
	for i,v in pairs(states) do
		if (v == old) then
			on = i
		end
		
		if (v == state) then
			nn = i
		end
	end
	
	print("Changing state from " .. tostring(on) .. " to " .. tostring(nn))
end

-- Special code for moving to a set position
function move_to_reference()
	if ( boss_chase == 0 ) then
		local reference = EntityGetWithTag( "reference" )
		if reference ~= nil then
			local reference_id = reference[1]
			local x,y = EntityGetTransform( reference_id )
			move_to( x, y )
		else
			print("Boss - NO REFERENCE FOUND!!!")
		end
	else
		print("geg")
		set_logic_state( states.FollowPlayer )
		print("gog")
	end
end

function move_to( x, y )
	set_logic_state( states.MoveTo )

	edit_component( GetUpdatedEntityID(), "LimbBossComponent", function(comp,vars)
		vars.mMoveToPositionX = x
		vars.mMoveToPositionY = y
	end)
end

-- The boss can't die normally; if their HP is zero, this does stuff instead
function check_death()
	local comp = EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" )
	if( comp ~= nil ) then
		local hp = ComponentGetValueFloat( comp, "hp" )
		if ( hp <= 0.0 ) then
			-- NOTE( Petri ): This function gets called twice in the boss death sequence
			print("IT'S DEAD")
			move_to_reference()
			GameTriggerMusicFadeOutAndDequeueAll()

			for i = 1,40 do
				local rand = function() return Random( -10, 10 ) end
				local x,y = EntityGetTransform( GetUpdatedEntityID() )
				GameScreenshake( i * 1, x, y )
				GameCreateParticle( "slime_green",            x + rand(), y + rand(), 10, i * 5.5, i * 5.5, true, false )
				if i > 20 then
					GameCreateParticle( "gunpowder_unstable", x + rand(), y + rand(), 3,  40.0,    40.0,    true, false )
				end
				wait( 3 )
			end
			
			local reference = EntityGetWithTag( "reference" )
			local x_portal,y_portal = EntityGetTransform( GetUpdatedEntityID() )
			
			if (reference ~= nil) then
				local ref_id = reference[1]
				local x_portal,y_portal = EntityGetTransform( ref_id )
				EntityKill( ref_id )
			end
			
			EntityLoad( "data/entities/buildings/teleport_ending_victory.xml", x_portal, y_portal )

			-- kill
			comp = EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" )
			if( comp ~= nil ) then
				ComponentSetValue( comp, "kill_now", "1" )
			end

			-- this is wrapped in is_dead, because otherwise the player gets 2 kills from killing the boss, since this function is called twice?
			if( is_dead == false ) then
				StatsLogPlayerKill()	-- this is needed because otherwise the boss kill doesn't get registered as a kill for the player
			end
			
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
	--ComponentSetValue( sprite, "rect_animation",      current_name )
	--ComponentSetValue( sprite, "next_rect_animation", next_name )
end

function get_idle_animation_name()
	return "stand"
end

function set_main_animation( current_name, next_name )
	local sprite = EntityGetFirstComponent( GetUpdatedEntityID(), "SpriteComponent" )
	if ( sprite ~= nil ) then
		animate_sprite( sprite, current_name, next_name )
	end
end

-- run phase state machine -----------------

phase = phase_circleshot
async_loop(function()

	-- alive
	if is_dead then
		wait(60 * 10)
	else
		phase()
	end

end)