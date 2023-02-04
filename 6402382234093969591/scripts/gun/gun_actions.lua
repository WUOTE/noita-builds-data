actions =
{
	-- modifiers
	{
		id          = "BURST_2",
		name 		= "$action_burst_2",
		description = "$actiondesc_burst_2",
		sprite 		= "data/ui_gfx/gun_actions/burst_2.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/burst_2_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			draw_actions( 2, true )
		end,
	},
	{
		id          = "BURST_3",
		name 		= "$action_burst_3",
		description = "$actiondesc_burst_3",
		sprite 		= "data/ui_gfx/gun_actions/burst_3.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/burst_3_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "1,2,3,4,5,6", -- BURST_3
		spawn_probability                 = "1,1,1,1,1,1", -- BURST_3
		price = 160,
		mana = 2,
		--max_uses = 100,
		action 		= function()
			draw_actions( 3, true )
		end,
	},
	{
		id          = "BURST_4",
		name 		= "$action_burst_4",
		description = "$actiondesc_burst_4",
		sprite 		= "data/ui_gfx/gun_actions/burst_4.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/burst_4_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "2,3,4,5,6", -- BURST_4
		spawn_probability                 = "1,1,1,1,1", -- BURST_4
		price = 180,
		mana = 5,
		--max_uses = 100,
		action 		= function()
			draw_actions( 4, true )
		end,
	},
	{

		id          = "SCATTER_2",
		name 		= "$action_scatter_2",
		description = "$actiondesc_scatter_2",
		sprite 		= "data/ui_gfx/gun_actions/scatter_2.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/scatter_2_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "0,1,2", -- SCATTER_2
		spawn_probability                 = "1,1,1", -- SCATTER_2
		price = 100,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			draw_actions( 2, true )
			c.spread_degrees = c.spread_degrees + 5.0
		end,
	},
	{
		id          = "SCATTER_3",
		name 		= "$action_scatter_3",
		description = "$actiondesc_scatter_3",
		sprite 		= "data/ui_gfx/gun_actions/scatter_3.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/scatter_3_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                      = "0,1,2,3", -- SCATTER_3
		spawn_probability                = "1,1,1,1", -- SCATTER_3
		price = 120,
		mana = 1,
		--max_uses = 100,
		action 		= function()
			draw_actions( 3, true )
			c.spread_degrees = c.spread_degrees + 10.0
		end,
	},
	{
		id          = "SCATTER_4",
		name 		= "$action_scatter_4",
		description = "$actiondesc_scatter_4",
		sprite 		= "data/ui_gfx/gun_actions/scatter_4.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/scatter_4_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "1,2,3,4,5,6", -- SCATTER_4
		spawn_probability                 = "1,1,1,1,1,1", -- SCATTER_4
		price = 140,
		mana = 2,
		--max_uses = 100,
		action 		= function()
			draw_actions( 4, true )
			c.spread_degrees = c.spread_degrees + 20.0
		end,
	},
	{
		id          = "I_SHAPE",
		name 		= "$action_i_shape",
		description = "$actiondesc_i_shape",
		sprite 		= "data/ui_gfx/gun_actions/i_shape.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/i_shape_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "1,2,3,4", -- I_SHAPE
		spawn_probability                 = "1,1,1,1", -- I_SHAPE
		price = 80,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			draw_actions(2, true)
			c.pattern_degrees = 180
		end,
	},
	{
		id          = "Y_SHAPE",
		name 		= "$action_y_shape",
		description = "$actiondesc_y_shape",
		sprite 		= "data/ui_gfx/gun_actions/y_shape.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/y_shape_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "0,1,2,3,4", -- Y_SHAPE
		spawn_probability                 = "1,1,1,1,1", -- Y_SHAPE
		price = 100,
		mana = 2,
		--max_uses = 100,
		action 		= function()
			draw_actions(2, true)
			c.pattern_degrees = 45
		end,
	},
	{
		id          = "T_SHAPE",
		name 		= "$action_t_shape",
		description = "$actiondesc_t_shape",
		sprite 		= "data/ui_gfx/gun_actions/t_shape.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/t_shape_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "1,2,3,4,5", -- T_SHAPE
		spawn_probability                 = "1,1,1,1,1", -- T_SHAPE
		price = 120,
		mana = 3,
		--max_uses = 100,
		action 		= function()
			draw_actions(3, true)
			c.pattern_degrees = 90
		end,
	},
	{
		id          = "W_SHAPE",
		name 		= "$action_w_shape",
		description = "$actiondesc_w_shape",
		sprite 		= "data/ui_gfx/gun_actions/w_shape.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/w_shape_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "2,3,4,5,6", -- W_SHAPE
		spawn_probability                 = "1,1,1,1,1", -- W_SHAPE
		price = 160,
		mana = 3,
		--max_uses = 100,
		action 		= function()
			draw_actions(3, true)
			c.pattern_degrees = 20
		end,
	},
	{
		id          = "CIRCLE_SHAPE",
		name 		= "$action_circle_shape",
		description = "$actiondesc_circle_shape",
		sprite 		= "data/ui_gfx/gun_actions/circle_shape.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/circle_shape_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "1,2,3,4,5,6", -- CIRCLE_SHAPE
		spawn_probability                 = "1,1,1,1,1,1", -- CIRCLE_SHAPE
		price = 150,
		mana = 4,
		--max_uses = 100,
		action 		= function()
			draw_actions(6, true)
			c.pattern_degrees = 180
		end,
	},
	{
		id          = "PENTAGRAM_SHAPE",
		name 		= "$action_pentagram_shape",
		description = "$actiondesc_pentagram_shape",
		sprite 		= "data/ui_gfx/gun_actions/pentagram_shape.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/pentagram_shape_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "1,2,3,4,5", -- PENTAGRAM_SHAPE
		spawn_probability                 = "1,1,1,1,1", -- PENTAGRAM_SHAPE
		price = 150,
		mana = 6,
		--max_uses = 100,
		action 		= function()
			draw_actions(5, true)
			c.pattern_degrees = 180
			--c.rad_pattern_degrees_offset = 150 // TODO: implement this
			--c.pattern_pos_offset = 30
		end,
	},
	{
		id          = "SPREAD_REDUCE",
		name 		= "$action_spread_reduce",
		description = "$actiondesc_spread_reduce",
		sprite 		= "data/ui_gfx/gun_actions/spread_reduce.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5,6", -- SPREAD_REDUCE
		spawn_probability                 = "1,1,1,1,1,1", -- SPREAD_REDUCE
		price = 100,
		mana = 1,
		--max_uses = 150,
		action 		= function()
			c.spread_degrees = c.spread_degrees - 30.0
			draw_actions( 1, true )
		end,
	},
	{
		id          = "RECHARGE",
		name 		= "$action_recharge",
		description = "$actiondesc_recharge",
		sprite 		= "data/ui_gfx/gun_actions/recharge.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5,6", -- SPREAD_REDUCE
		spawn_probability                 = "1,1,1,1,1,1", -- SPREAD_REDUCE
		price = 200,
		mana = 15,
		--max_uses = 150,
		action 		= function()
			c.fire_rate_wait    = math.max(0, c.fire_rate_wait - 10)
			current_reload_time = math.max(0, current_reload_time - 20)
			draw_actions( 1, true )
		end,
	},
	{
		id          = "GRAVITY",
		name 		= "$action_gravity",
		description = "$actiondesc_gravity",
		sprite 		= "data/ui_gfx/gun_actions/gravity.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/w_shape_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4,5,6", -- W_SHAPE
		spawn_probability                 = "1,1,1,1,1", -- W_SHAPE
		price = 50,
		mana = 1,
		--max_uses = 100,
		action 		= function()
			c.gravity = c.gravity + 600.0
			draw_actions( 1, true )
		end,
	},
	{
		id          = "GRAVITY_ANTI",
		name 		= "$action_gravity_anti",
		description = "$actiondesc_gravity_anti",
		sprite 		= "data/ui_gfx/gun_actions/gravity_anti.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/w_shape_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4,5,6", -- W_SHAPE
		spawn_probability                 = "1,1,1,1,1", -- W_SHAPE
		price = 50,
		mana = 1,
		--max_uses = 100,
		action 		= function()
			c.gravity = c.gravity - 600.0
			draw_actions( 1, true )
		end,
	},
	--[[
	{
		id          = "PENETRATE_WALLS",
		name 		= "$action_penetrate_walls",
		description = "$actiondesc_penetrate_walls",
		sprite 		= "data/ui_gfx/gun_actions/penetrate_walls.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- PENETRATE_WALLS
		spawn_probability                        = "", -- PENETRATE_WALLS
		price = 100,
		action 		= function()
			penetration_power = penetration_power + 1
		end,
	},]]--
	{
		id          = "SINEWAVE",
		name 		= "$action_sinewave",
		description = "$actiondesc_sinewave",
		sprite 		= "data/ui_gfx/gun_actions/sinewave.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4", -- SINEWAVE
		spawn_probability                 = "1,1,1,1", -- SINEWAVE
		price = 50,
		mana = 0,
		--max_uses = 150,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/sinewave.xml,"
			c.speed_multiplier = c.speed_multiplier * 2
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BOUNCE",
		name 		= "$action_bounce",
		description = "$actiondesc_bounce",
		sprite 		= "data/ui_gfx/gun_actions/bounce.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bounce_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- BOUNCE
		spawn_probability                 = "1,1,1", -- BOUNCE
		price = 50,
		mana = 0,
		--max_uses = 150,
		action 		= function()
			c.bounces = c.bounces + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "HOMING",
		name 		= "$action_homing",
		description = "$actiondesc_homing",
		sprite 		= "data/ui_gfx/gun_actions/homing.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4,5,6", -- HOMING
		spawn_probability                 = "1,1,1,1,1", -- HOMING
		price = 220,
		mana = 50,
		--max_uses = 100,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/homing.xml,data/entities/particles/tinyspark_white.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "HOMING_SHOOTER",
		name 		= "$action_homing_shooter",
		description = "$actiondesc_homing_shooter",
		sprite 		= "data/ui_gfx/gun_actions/homing_shooter.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4,5,6", -- HOMING_SHOOTER
		spawn_probability                 = "1,1,1,1,1", -- HOMING_SHOOTER
		price = 140,
		mana = 10,
		--max_uses = 100,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/homing_shooter.xml,data/entities/particles/tinyspark_white.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "DAMAGE",
		name 		= "$action_damage",
		description = "$actiondesc_damage",
		sprite 		= "data/ui_gfx/gun_actions/damage.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/damage_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5", -- DAMAGE
		spawn_probability                 = "1,1,1,1,1", -- DAMAGE
		price = 140,
		mana = 5,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/damage.xml",
		action 		= function()
			c.damage_projectile_add = c.damage_projectile_add + 0.4
			c.gore_particles    = c.gore_particles + 5
			c.fire_rate_wait    = c.fire_rate_wait + 5
			c.extra_entities    = c.extra_entities .. "data/entities/particles/tinyspark_yellow.xml,"
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 10.0
			draw_actions( 1, true )
		end,
	},
	{
		id          = "CRITICAL_HIT",
		name 		= "$action_critical_hit",
		description = "$actiondesc_critical_hit",
		sprite 		= "data/ui_gfx/gun_actions/critical_hit.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/damage_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5", -- DAMAGE
		spawn_probability                 = "1,1,1,1,1", -- DAMAGE
		price = 140,
		mana = 5,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/critical_hit.xml",
		action 		= function()
			c.damage_critical_chance = c.damage_critical_chance + 15
			draw_actions( 1, true )
		end,
	},
	--[[
	{
		-- NOTE( Petri ): Why doesn't this work?
		id          = "DAMAGE_FRIENDLY",
		name 		= "$action_damage_friendly",
		description = "$actiondesc_damage_friendly",
		sprite 		= "data/ui_gfx/gun_actions/damage_friendly.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/damage_friendly_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,4", -- DAMAGE_FRIENDLY
		spawn_probability                 = "1,1", -- DAMAGE_FRIENDLY
		price = 140,
		mana = 5,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/damage_friendly.xml",
		action 		= function()
			c.damage_projectile = c.damage_projectile + 0.8
			c.friendly_fire		= true
			c.gore_particles    = c.gore_particles + 5
			c.fire_rate_wait    = c.fire_rate_wait + 5
			c.extra_entities    = c.extra_entities .. "data/entities/particles/tinyspark_yellow.xml,"
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 10.0
		end,
	},
	{
		-- NOTE( Petri ): This doesn't work now!
		id          = "DAMAGE_X2",
		name 		= "$action_damage_x2",
		description = "$actiondesc_damage_x2",
		sprite 		= "data/ui_gfx/gun_actions/damage_x2.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/damage_x2_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "3,4,5,6", -- DAMAGE_X2
		spawn_probability                 = "1,1,1,1", -- DAMAGE_X2
		price = 200,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/damage_x2.xml",
		action 		= function()
			c.damage_projectile_add = c.damage_projectile_add + 2
			c.fire_rate_wait    = c.fire_rate_wait + 5
			c.gore_particles    = c.gore_particles + 10
			c.extra_entities    = c.extra_entities .. "data/entities/particles/tinyspark_red.xml,"
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 30.0
			draw_actions( 1, true )
		end,
	},
	{
		-- NOTE( Petri ): This doesn't work now!
		id          = "DAMAGE_X5",
		name 		= "$action_damage_x5",
		description = "$actiondesc_damage_x5",
		sprite 		= "data/ui_gfx/gun_actions/damage_x5.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/damage_x2_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "3,4,5,6", -- DAMAGE_X2
		spawn_probability                 = "1,1,1,1", -- DAMAGE_X2
		price = 220,
		mana = 50,
		max_uses = 5,
		custom_xml_file = "data/entities/misc/custom_cards/damage_x2.xml",
		action 		= function()
			c.damage_projectile_add = c.damage_projectile_add + 5
			c.fire_rate_wait    = c.fire_rate_wait + 10
			c.gore_particles    = c.gore_particles + 30
			c.extra_entities    = c.extra_entities .. "data/entities/particles/tinyspark_red.xml,"
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 60.0
			draw_actions( 1, true )
		end,
	},
	]]--
	{
		id          = "HEAVY_SHOT",
		name 		= "$action_heavy_shot",
		description = "$actiondesc_heavy_shot",
		sprite 		= "data/ui_gfx/gun_actions/heavy_shot.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/heavy_shot_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- HEAVY_SHOT
		spawn_probability                 = "1,1,1", -- HEAVY_SHOT
		price = 150,
		mana = 7,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/heavy_shot.xml",
		action 		= function()
			c.damage_projectile_add = c.damage_projectile_add + 1.75
			c.fire_rate_wait    = c.fire_rate_wait + 10
			c.gore_particles    = c.gore_particles + 10
			c.speed_multiplier = c.speed_multiplier * 0.3
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 50.0
			c.extra_entities = c.extra_entities .. "data/entities/particles/heavy_shot.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "KNOCKBACK",
		name 		= "$action_knockback",
		description = "$actiondesc_knockback",
		sprite 		= "data/ui_gfx/gun_actions/knockback.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/knockback_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "3,5", -- KNOCKBACK
		spawn_probability                 = "1,1", -- KNOCKBACK
		price = 100,
		mana = 5,
		--max_uses = 150,
		action 		= function()
			c.knockback_force = c.knockback_force + 5
			draw_actions( 1, true )
		end,
	},
	{
		id          = "RECOIL",
		name 		= "$action_recoil",
		description = "$actiondesc_recoil",
		sprite 		= "data/ui_gfx/gun_actions/recoil.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/recoil_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,4", -- RECOIL
		spawn_probability                 = "1,1", -- RECOIL
		price = 100,
		mana = 5,
		--max_uses = 150,
		action 		= function()
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 200.0
			draw_actions( 1, true )
		end,
	},
	{
		id          = "RECOIL_DAMPER",
		name 		= "$action_recoil_damper",
		description = "$actiondesc_recoil_damper",
		sprite 		= "data/ui_gfx/gun_actions/recoil_damper.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/recoil_damper_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "3,6", -- RECOIL_DAMPER
		spawn_probability                 = "1,1", -- RECOIL_DAMPER
		price = 100,
		mana = 5,
		--max_uses = 150,
		action 		= function()
			shot_effects.recoil_knockback = shot_effects.recoil_knockback - 200
			draw_actions( 1, true )
		end,
	},
	{
		id          = "SPEED",
		name 		= "$action_speed",
		description = "$actiondesc_speed",
		sprite 		= "data/ui_gfx/gun_actions/speed.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/speed_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3", -- SPEED
		spawn_probability                 = "1,1,1", -- SPEED
		price = 100,
		mana = 5,
		--max_uses = 100,
		custom_xml_file = "data/entities/misc/custom_cards/speed.xml",
		action 		= function()
			c.speed_multiplier = c.speed_multiplier * 2.5
			draw_actions( 1, true )
		end,
	},
	--[[
	{
		id          = "GORE",
		name 		= "$action_gore",
		description = "$actiondesc_gore",
		sprite 		= "data/ui_gfx/gun_actions/gore.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- GORE
		spawn_probability                        = "", -- GORE
		price = 100,
		mana = 0,
		action 		= function()
			c.ragdoll_fx = 3
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 90.0
		end,
	},
	]]--
	{
		id          = "EXPLOSIVE_PROJECTILE",
		name 		= "$action_explosive_projectile",
		description = "$actiondesc_explosive_projectile",
		sprite 		= "data/ui_gfx/gun_actions/explosive_projectile.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/explosive_projectile_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- EXPLOSIVE_PROJECTILE
		spawn_probability                 = "1,1,1", -- EXPLOSIVE_PROJECTILE
		price = 120,
		mana = 30,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/explosive_projectile.xml",
		action 		= function()
			c.explosion_radius = c.explosion_radius + 15.0
			c.damage_explosion_add = c.damage_explosion_add + 0.2
			c.fire_rate_wait   = c.fire_rate_wait + 40
			c.speed_multiplier = c.speed_multiplier * 0.75
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 30.0
			draw_actions( 1, true )
		end,
	},
	{
		id          = "WATER_TO_POISON",
		name 		= "$action_water_to_poison",
		description = "$actiondesc_water_to_poison",
		sprite 		= "data/ui_gfx/gun_actions/water_to_poison.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/explosive_projectile_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- EXPLOSIVE_PROJECTILE
		spawn_probability                 = "1,1,1", -- EXPLOSIVE_PROJECTILE
		price = 80,
		mana = 30,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/water_to_poison.xml,data/entities/particles/tinyspark_purple.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BLOOD_TO_ACID",
		name 		= "$action_blood_to_acid",
		description = "$actiondesc_blood_to_acid",
		sprite 		= "data/ui_gfx/gun_actions/blood_to_acid.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/explosive_projectile_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- EXPLOSIVE_PROJECTILE
		spawn_probability                 = "1,1,1", -- EXPLOSIVE_PROJECTILE
		price = 80,
		mana = 30,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/blood_to_acid.xml,data/entities/particles/tinyspark_red.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "LAVA_TO_BLOOD",
		name 		= "$action_lava_to_blood",
		description = "$actiondesc_lava_to_blood",
		sprite 		= "data/ui_gfx/gun_actions/lava_to_blood.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/explosive_projectile_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- EXPLOSIVE_PROJECTILE
		spawn_probability                 = "1,1,1", -- EXPLOSIVE_PROJECTILE
		price = 80,
		mana = 30,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/lava_to_blood.xml,data/entities/particles/tinyspark_orange.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "NECROMANCY",
		name 		= "$action_necromancy",
		description = "$actiondesc_necromancy",
		spawn_requires_flag = "card_unlocked_necromancy",
		sprite 		= "data/ui_gfx/gun_actions/necromancy.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/explosive_projectile_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- EXPLOSIVE_PROJECTILE
		spawn_probability                 = "1,1,1", -- EXPLOSIVE_PROJECTILE
		price = 80,
		mana = 40,
		--max_uses = 50,
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_necromancy.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "EXPLOSION",
		name 		= "$action_explosion",
		description = "$actiondesc_explosion",
		sprite 		= "data/ui_gfx/gun_actions/explosion.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/explosion_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,2,4,5", -- EXPLOSION
		spawn_probability                 = "1,1,1,1", -- EXPLOSION
		price = 160,
		mana = 80,
		--max_uses = 30,
		custom_xml_file = "data/entities/misc/custom_cards/explosion.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/explosion.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 2.5
		end,
	},
	{
		id          = "FIRE_BLAST",
		name 		= "$action_fire_blast",
		description = "$actiondesc_fire_blast",
		sprite 		= "data/ui_gfx/gun_actions/fire_blast.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/fire_blast_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,3,5", -- FIRE_BLAST
		spawn_probability                 = "1,1,1,1", -- FIRE_BLAST
		price = 120,
		mana = 10,
		--max_uses = 30,
		custom_xml_file = "data/entities/misc/custom_cards/fire_blast.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/fireblast.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
		end,
	},
	{
		id          = "POISON_BLAST",
		name 		= "$action_poison_blast",
		description = "$actiondesc_poison_blast",
		sprite 		= "data/ui_gfx/gun_actions/poison_blast.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/poison_blast_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,2,4,6", -- POISON_BLAST
		spawn_probability                 = "1,1,1,1", -- POISON_BLAST
		price = 140,
		mana = 30,
		--max_uses = 30,
		custom_xml_file = "data/entities/misc/custom_cards/poison_blast.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/poison_blast.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
		end,
	},
	{
		id          = "ALCOHOL_BLAST",
		name 		= "$action_alcohol_blast",
		description = "$actiondesc_alcohol_blast",
		sprite 		= "data/ui_gfx/gun_actions/alcohol_blast.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/poison_blast_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,2,4,6", -- POISON_BLAST
		spawn_probability                 = "1,1,1,1", -- POISON_BLAST
		price = 140,
		mana = 30,
		--max_uses = 30,
		custom_xml_file = "data/entities/misc/custom_cards/alcohol_blast.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/alcohol_blast.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
		end,
	},
	{
		id          = "THUNDER_BLAST",
		name 		= "$action_thunder_blast",
		description = "$actiondesc_thunder_blast",
		sprite 		= "data/ui_gfx/gun_actions/thunder_blast.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/thunder_blast_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,3,5,6", -- THUNDER_BLAST
		spawn_probability                 = "1,1,1,1", -- THUNDER_BLAST
		price = 180,
		mana = 110,
		--max_uses = 30,
		custom_xml_file = "data/entities/misc/custom_cards/thunder_blast.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/thunder_blast.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 3.0
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 30.0
		end,
	},
	--[[
	{
		id          = "CHARM_FIELD",
		name 		= "$action_charm_field",
		description = "$actiondesc_charm_field",
		sprite 		= "data/ui_gfx/gun_actions/charm_field.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- CHARM_FIELD
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- CHARM_FIELD
		price = 100,
		mana = 30,
		max_uses = 15,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/charm_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	]]--
	{
		id          = "BERSERK_FIELD",
		name 		= "$action_berserk_field",
		description = "$actiondesc_berserk_field",
		sprite 		= "data/ui_gfx/gun_actions/berserk_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/berserk_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1", -- BERSERK_FIELD
		price = 200,
		mana = 30,
		max_uses = 15,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/berserk_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "POLYMORPH_FIELD",
		name 		= "$action_polymorph_field",
		description = "$actiondesc_polymorph_field",
		sprite 		= "data/ui_gfx/gun_actions/polymorph_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/polymorph_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6", -- POLYMORPH_FIELD
		spawn_probability                 = "1,1,1,1,1,1,1", -- POLYMORPH_FIELD
		price = 200,
		mana = 50,
		max_uses = 5,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/polymorph_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "CHAOS_POLYMORPH_FIELD",
		name 		= "$action_chaos_polymorph_field",
		description = "$actiondesc_chaos_polymorph_field",
		sprite 		= "data/ui_gfx/gun_actions/chaos_polymorph_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/chaos_polymorph_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,2,3,4,5,6", -- CHAOS_POLYMORPH_FIELD
		spawn_probability                 = "1,1,1,1,1,1", -- CHAOS_POLYMORPH_FIELD
		price = 200,
		mana = 20,
		max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/chaos_polymorph_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "ELECTROCUTION_FIELD",
		name 		= "$action_electrocution_field",
		description = "$actiondesc_electrocution_field",
		sprite 		= "data/ui_gfx/gun_actions/electrocution_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/electrocution_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,3,5,6", -- ELECTROCUTION_FIELD
		spawn_probability                 = "1,1,1,1", -- ELECTROCUTION_FIELD
		price = 200,
		mana = 60,
		max_uses = 15,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/electrocution_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "FREEZE_FIELD",
		name 		= "$action_freeze_field",
		description = "$actiondesc_freeze_field",
		sprite 		= "data/ui_gfx/gun_actions/freeze_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,2,4,5", -- FREEZE_FIELD
		spawn_probability                 = "1,1,1,1", -- FREEZE_FIELD
		price = 200,
		mana = 50,
		max_uses = 15,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/freeze_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "REGENERATION_FIELD",
		name 		= "$action_regeneration_field",
		description = "$actiondesc_regeneration_field",
		sprite 		= "data/ui_gfx/gun_actions/regeneration_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/regeneration_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,2,3,4", -- REGENERATION_FIELD
		spawn_probability                 = "1,1,1,1", -- REGENERATION_FIELD
		price = 250,
		mana = 80,
		max_uses = 2,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/regeneration_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "TELEPORTATION_FIELD",
		name 		= "$action_teleportation_field",
		description = "$actiondesc_teleportation_field",
		sprite 		= "data/ui_gfx/gun_actions/teleportation_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/teleportation_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5", -- TELEPORTATION_FIELD
		spawn_probability                 = "1,1,1,1,1,1", -- TELEPORTATION_FIELD
		price = 150,
		mana = 30,
		max_uses = 15,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/teleportation_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "LEVITATION_FIELD",
		name 		= "$action_levitation_field",
		description = "$actiondesc_levitation_field",
		sprite 		= "data/ui_gfx/gun_actions/levitation_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/levitation_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "3,4", -- LEVITATION_FIELD
		spawn_probability                 = "1,1", -- LEVITATION_FIELD
		price = 120,
		mana = 10,
		max_uses = 15,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/levitation_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	--[[{
		id          = "TELEPATHY_FIELD",
		name 		= "$action_telepathy_field",
		description = "$actiondesc_telepathy_field",
		sprite 		= "data/ui_gfx/gun_actions/telepathy_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/telepathy_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,3", -- TELEPATHY_FIELD
		spawn_probability                 = "1,1", -- TELEPATHY_FIELD
		price = 150,
		mana = 60,
		max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/telepathy_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},]]--
	{
		id          = "SHIELD_FIELD",
		name 		= "$action_shield_field",
		description = "$actiondesc_shield_field",
		sprite 		= "data/ui_gfx/gun_actions/shield_field.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/shield_field_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- SHIELD_FIELD
		spawn_probability                 = "1,1,1,1,1", -- SHIELD_FIELD
		price = 160,
		mana = 20,
		max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/shield_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "SEA_LAVA",
		name 		= "$action_sea_lava",
		description = "$actiondesc_sea_lava",
		spawn_requires_flag = "card_unlocked_sea_lava",
		sprite 		= "data/ui_gfx/gun_actions/sea_lava.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/sea_lava_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
		price = 350,
		mana = 140,
		max_uses = 3,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/sea_lava.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "SEA_ALCOHOL",
		name 		= "$action_sea_alcohol",
		description = "$actiondesc_sea_alcohol",
		sprite 		= "data/ui_gfx/gun_actions/sea_alcohol.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/sea_lava_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
		price = 350,
		mana = 140,
		max_uses = 3,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/sea_alcohol.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "SEA_OIL",
		name 		= "$action_sea_oil",
		description = "$actiondesc_sea_oil",
		sprite 		= "data/ui_gfx/gun_actions/sea_oil.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/sea_oil_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
		price = 350,
		mana = 140,
		max_uses = 3,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/sea_oil.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "SEA_WATER",
		name 		= "$action_sea_water",
		description = "$actiondesc_sea_water",
		sprite 		= "data/ui_gfx/gun_actions/sea_water.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/sea_water_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
		price = 350,
		mana = 140,
		max_uses = 3,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/sea_water.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "SEA_ACID",
		name 		= "$action_sea_acid",
		description = "$actiondesc_sea_acid",
		sprite 		= "data/ui_gfx/gun_actions/sea_acid.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/sea_acid_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
		price = 350,
		mana = 140,
		max_uses = 3,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/sea_acid.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "SEA_ACID_GAS",
		name 		= "$action_sea_acid_gas",
		description = "$actiondesc_sea_acid_gas",
		sprite 		= "data/ui_gfx/gun_actions/sea_acid_gas.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/sea_acid_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "0,4,5,6", -- SEA_ACID_GAS
		spawn_probability                 = "1,1,1,1", -- SEA_ACID_GAS
		price = 200,
		mana = 140,
		max_uses = 3,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/sea_acid_gas.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "CLOUD_WATER",
		name 		= "$action_cloud_water",
		description = "$actiondesc_cloud_water",
		sprite 		= "data/ui_gfx/gun_actions/cloud_water.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/cloud_water_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1,1,1", -- BERSERK_FIELD
		price = 140,
		mana = 30,
		max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/cloud_water.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "CLOUD_BLOOD",
		name 		= "$action_cloud_blood",
		description = "$actiondesc_cloud_blood",
		sprite 		= "data/ui_gfx/gun_actions/cloud_blood.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/cloud_water_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1,1,1", -- BERSERK_FIELD
		price = 200,
		mana = 60,
		max_uses = 3,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/cloud_blood.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
		end,
	},
	{
		id          = "CLOUD_ACID",
		name 		= "$action_cloud_acid",
		description = "$actiondesc_cloud_acid",
		sprite 		= "data/ui_gfx/gun_actions/cloud_acid.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/cloud_water_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1,1,1", -- BERSERK_FIELD
		price = 200,
		mana = 120,
		max_uses = 4,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/cloud_acid.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "CLOUD_THUNDER",
		name 		= "$action_cloud_thunder",
		description = "$actiondesc_cloud_thunder",
		sprite 		= "data/ui_gfx/gun_actions/cloud_thunder.png",
		spawn_requires_flag = "card_unlocked_cloud_thunder",
		sprite_unidentified = "data/ui_gfx/gun_actions/cloud_water_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5", -- BERSERK_FIELD
		spawn_probability                 = "1,1,1,1,1,1", -- BERSERK_FIELD
		price = 190,
		mana = 90,
		max_uses = 5,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/cloud_thunder.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
		end,
	},
	{
		id          = "ELECTRIC_CHARGE",
		name 		= "$action_electric_charge",
		description = "$actiondesc_electric_charge",
		sprite 		= "data/ui_gfx/gun_actions/electric_charge.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,4,5", -- ELECTRIC_CHARGE
		spawn_probability                 = "1,1,1,1", -- ELECTRIC_CHARGE
		price = 150,
		mana = 8,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/electric_charge.xml",
		action 		= function()
			c.lightning_count = c.lightning_count + 1
			c.damage_electricity_add = c.damage_electricity_add + 0.1
			c.extra_entities = c.extra_entities .. "data/entities/particles/electricity.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "MATTER_EATER",
		name 		= "$action_matter_eater",
		description = "$actiondesc_matter_eater",
		sprite 		= "data/ui_gfx/gun_actions/matter_eater.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,4,5", -- ELECTRIC_CHARGE
		spawn_probability                 = "0.1,1,0.1,0.1", -- ELECTRIC_CHARGE
		price = 280,
		mana = 120,
		max_uses = 10,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/matter_eater.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "FREEZE",
		name 		= "$action_freeze",
		description = "$actiondesc_freeze",
		sprite 		= "data/ui_gfx/gun_actions/freeze.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- FREEZE
		spawn_probability                 = "1,1,1,1", -- FREEZE
		price = 140,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/freeze.xml",
		action 		= function()
			c.damage_projectile_add = c.damage_projectile_add + 0.2
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_frozen.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/particles/freeze_charge.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "HITFX_BURNING_CRITICAL_HIT",
		name 		= "$action_hitfx_burning_critical_hit",
		description = "$actiondesc_hitfx_burning_critical_hit",
		sprite 		= "data/ui_gfx/gun_actions/burning_critical.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- HITFX_BURNING_CRITICAL_HIT
		spawn_probability                 = "1,1,1,1", -- HITFX_BURNING_CRITICAL_HIT
		price = 70,
		mana = 10,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/hitfx_burning_critical_hit.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "HITFX_CRITICAL_WATER",
		name 		= "$action_hitfx_critical_water",
		description = "$actiondesc_hitfx_critical_water",
		sprite 		= "data/ui_gfx/gun_actions/critical_water.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- HITFX_BURNING_CRITICAL_HIT
		spawn_probability                 = "1,1,1,1", -- HITFX_BURNING_CRITICAL_HIT
		price = 70,
		mana = 10,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/hitfx_critical_water.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "HITFX_CRITICAL_OIL",
		name 		= "$action_hitfx_critical_oil",
		description = "$actiondesc_hitfx_critical_oil",
		sprite 		= "data/ui_gfx/gun_actions/critical_oil.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- HITFX_BURNING_CRITICAL_HIT
		spawn_probability                 = "1,1,1,1", -- HITFX_BURNING_CRITICAL_HIT
		price = 70,
		mana = 10,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/hitfx_critical_oil.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "HITFX_CRITICAL_BLOOD",
		name 		= "$action_hitfx_critical_blood",
		description = "$actiondesc_hitfx_critical_blood",
		sprite 		= "data/ui_gfx/gun_actions/critical_blood.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- HITFX_BURNING_CRITICAL_HIT
		spawn_probability                 = "1,1,1,1", -- HITFX_BURNING_CRITICAL_HIT
		price = 70,
		mana = 10,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/hitfx_critical_blood.xml,"
			draw_actions( 1, true )
		end,
	},
	--[[ { WIP
		id          = "HITFX_POLTERGEIST",
		name 		= "$action_hitfx_poltergeist",
		description = "$actiondesc_hitfx_poltergeist",
		sprite 		= "data/ui_gfx/gun_actions/critical_blood.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/critical_blood.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- HITFX_BURNING_CRITICAL_HIT
		spawn_probability                 = "1,1,1,1", -- HITFX_BURNING_CRITICAL_HIT
		price = 70,
		mana = 10,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/hitfx_poltergeist.xml,"
			draw_actions( 1, true )
		end,
	},]]--
	{
		id          = "FIREBALL_RAY",
		name 		= "$action_fireball_ray",
		description = "$actiondesc_fireball_ray",
		sprite 		= "data/ui_gfx/gun_actions/fireball_ray.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,4,5", -- ELECTRIC_CHARGE
		spawn_probability                 = "1,1,1,1", -- ELECTRIC_CHARGE
		price = 250,
		mana = 100,
		max_uses = 10,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/fireball_ray.xml,"
			draw_actions( 1, true )
		end,
	},
	--[[
	{
		id          = "HITFX_OILED_FREEZE",
		name 		= "$action_hitfx_oiled_freeze",
		description = "$actiondesc_hitfx_oiled_freeze",
		sprite 		= "data/ui_gfx/gun_actions/oiled_freeze.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- HITFX_BURNING_CRITICAL_HIT
		spawn_probability                 = "1,1,1,1", -- HITFX_BURNING_CRITICAL_HIT
		price = 70,
		mana = 10,
		--max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/hitfx_oiled_freeze.xml,"
			draw_actions( 1, true )
		end,
	},
	]]--
	--[[
	{
		id          = "ALCOHOL_SHOT",
		name 		= "$action_alcohol_shot",
		description = "$actiondesc_alcohol_shot",
		sprite 		= "data/ui_gfx/gun_actions/inebriation.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- HITFX_BURNING_CRITICAL_HIT
		spawn_probability                 = "1,1,1,1", -- HITFX_BURNING_CRITICAL_HIT
		price = 70,
		mana = 10,
		--max_uses = 50,
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_drunk.xml,"
			draw_actions( 1, true )
		end,
	},
	]]--
	--[[
	{
		id          = "FREEZE_IF_WET_SHOOTER",
		name 		= "$action_freeze_if_wet_shooter",
		description = "$actiondesc_freeze_if_wet_shooter",
		sprite 		= "data/ui_gfx/gun_actions/freeze.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/freeze_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,3,4,5", -- FREEZE
		spawn_probability                 = "1,1,1,1", -- FREEZE
		price = 140,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/freeze_if_wet_shooter.xml", -- shoteffectcomponent in this effect applies the effect
		action 		= function()
			draw_actions( 1, true )
		end,
	},
	--]]
	--[[
	{
		id          = "BLINDNESS",
		name 		= "$action_blindness",
		description = "$actiondesc_blindness",
		sprite 		= "data/ui_gfx/gun_actions/blindness.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- BLINDNESS
		spawn_probability                        = "", -- BLINDNESS
		price = 100,
		mana = 10,
		max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/blindness.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_blindness.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/particles/blindness.xml,"
		end,
	},
	{
		id          = "TELEPORTATION",
		name 		= "$action_teleportation",
		description = "$actiondesc_teleportation",
		sprite 		= "data/ui_gfx/gun_actions/teleportation.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- TELEPORTATION
		spawn_probability                        = "", -- TELEPORTATION
		price = 100,
		mana = 10,
		max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/teleportation.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_teleportation.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/particles/teleportation.xml,"
		end,
	},
	{
		id          = "TELEPATHY",
		name 		= "$action_telepathy",
		description = "$actiondesc_telepathy",
		sprite 		= "data/ui_gfx/gun_actions/telepathy.png",
		type 		= ACTION_TYPE_OTHER,
		spawn_level                       = "", -- TELEPATHY
		spawn_probability                        = "", -- TELEPATHY
		price = 100,
		mana = 10,
		max_uses = 50,
		--custom_xml_file = "data/entities/misc/custom_cards/freeze.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_telepathy.xml,"
		end,
	},
	]]--
	{
		id          = "ARC_ELECTRIC",
		name 		= "$action_arc_electric",
		description = "$actiondesc_arc_electric",
		sprite 		= "data/ui_gfx/gun_actions/arc_electric.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/arc_electric_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4,5,6", -- ARC_ELECTRIC
		spawn_probability                 = "1,1,1,1,1", -- ARC_ELECTRIC
		price = 170,
		--max_uses 	= 15,
		mana = 15,
		custom_xml_file = "data/entities/misc/custom_cards/arc_electric.xml",
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/arc_electric.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ARC_FIRE",
		name 		= "$action_arc_fire",
		description = "$actiondesc_arc_fire",
		sprite 		= "data/ui_gfx/gun_actions/arc_fire.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/arc_fire_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5", -- ARC_FIRE
		spawn_probability                 = "1,1,1,1,1", -- ARC_FIRE
		price = 160,
		--max_uses 	= 15,
		mana = 15,
		custom_xml_file = "data/entities/misc/custom_cards/arc_fire.xml",
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/arc_fire.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ARC_GUNPOWDER",
		name 		= "$action_arc_gunpowder",
		description = "$actiondesc_arc_gunpowder",
		sprite 		= "data/ui_gfx/gun_actions/arc_gunpowder.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/arc_fire_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5", -- ARC_FIRE
		spawn_probability                 = "1,1,1,1,1", -- ARC_FIRE
		price = 160,
		--max_uses 	= 15,
		mana = 15,
		-- custom_xml_file = "data/entities/misc/custom_cards/arc_gunpowder.xml",
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/arc_gunpowder.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ARC_POISON",
		name 		= "$action_arc_poison",
		description = "$actiondesc_arc_poison",
		sprite 		= "data/ui_gfx/gun_actions/arc_poison.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/arc_fire_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5", -- ARC_FIRE
		spawn_probability                 = "1,1,1,1,1", -- ARC_FIRE
		price = 160,
		--max_uses 	= 15,
		mana = 15,
		-- custom_xml_file = "data/entities/misc/custom_cards/arc_poison.xml",
		action 		= function()
			c.extra_entities = c.extra_entities .. "data/entities/misc/arc_poison.xml,"
			draw_actions( 1, true )
		end,
	},
	--[[
	{
		id          = "POLYMORPH",
		name 		= "$action_polymorph",
		description = "$actiondesc_polymorph",
		sprite 		= "data/ui_gfx/gun_actions/polymorph.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- POLYMORPH
		spawn_probability                        = "", -- POLYMORPH
		price = 100,
		max_uses 	= 7,
		mana = 10,
		custom_xml_file = "data/entities/misc/custom_cards/polymorph.xml",
		action 		= function()
			c.damage_projectile = c.damage_projectile - 0.003
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_polymorph.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/particles/polymorph.xml,"
			-- c.extra_entities = c.extra_entities .. "data/entities/particles/freeze_charge.xml,"
		end,
	},
	{
		id          = "BERSERK",
		name 		= "$action_berserk",
		description = "$actiondesc_berserk",
		sprite 		= "data/ui_gfx/gun_actions/berserk.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- BERSERK
		spawn_probability                        = "", -- BERSERK
		price = 100,
		max_uses    = 12,
		mana = 10,
		custom_xml_file = "data/entities/misc/custom_cards/berserk.xml",
		action 		= function()
			c.damage_projectile = c.damage_projectile + 0.2
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_berserk.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/particles/berserk.xml,"
		end,
	},
	{
		id          = "CHARM",
		name 		= "$action_charm",
		description = "$actiondesc_charm",
		sprite 		= "data/ui_gfx/gun_actions/charm.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level       = "", -- CHARM
		spawn_probability = "", -- CHARM
		price = 100,
		max_uses    = 12,
		mana = 10,
		custom_xml_file = "data/entities/misc/custom_cards/charm.xml",
		action 		= function()
			c.damage_projectile = c.damage_projectile + 0.2
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_charm.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/particles/charm.xml,"
		end,
	},
	]]--
	{
		id          = "X_RAY",
		name 		= "$action_x_ray",
		description = "$actiondesc_x_ray",
		sprite 		= "data/ui_gfx/gun_actions/x_ray.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/x_ray_unidentified.png",
		type 		= ACTION_TYPE_UTILITY,
		spawn_level       = "0,1,2,3,4,5,6", -- X_RAY
		spawn_probability = "1,1,1,1,1,1,1", -- X_RAY
		price = 230,
		max_uses    = 10,
		mana = 100,
		custom_xml_file = "data/entities/misc/custom_cards/xray.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/xray.xml")
		end,
	},
	--[[
	{
		id          = "X_RAY_MODIFIER",
		name 		= "$action_x_ray_modifier",
		description = "$actiondesc_x_ray_modifier",
		sprite 		= "data/ui_gfx/gun_actions/x_ray.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/x_ray_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,4,5", -- ELECTRIC_CHARGE
		spawn_probability                 = "1,1,1,1", -- x_ray
		price = 150,
		mana = 8,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/fogofwar_radius.xml",
		action 		= function()
			c.lightning_count = c.lightning_count + 1
			c.damage_electricity_add = c.damage_electricity_add + 0.1
			c.extra_entities = c.extra_entities .. "data/entities/particles/electricity.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ACID",
		name 		= "$action_acid",
		description = "$actiondesc_acid",
		sprite 		= "data/ui_gfx/gun_actions/acid.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- ACID
		spawn_probability                        = "", -- ACID
		price = 100,
		action 		= function()
			material = "acid"
			material_amount = material_amount + 20
		end,
	},]]--
	{
		id          = "UNSTABLE_GUNPOWDER",
		name 		= "$action_unstable_gunpowder",
		description = "$actiondesc_unstable_gunpowder",
		sprite 		= "data/ui_gfx/gun_actions/unstable_gunpowder.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/unstable_gunpowder_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                      = "2,3,4", -- UNSTABLE_GUNPOWDER
		spawn_probability                = "1,1,1", -- UNSTABLE_GUNPOWDER
		price = 140,
		mana = 15,
		--max_uses    = 20, 
		custom_xml_file = "data/entities/misc/custom_cards/unstable_gunpowder.xml",
		action 		= function()
			c.material = "gunpowder_unstable"
			c.material_amount = c.material_amount + 10
			--shot_effects.recoil_knockback = shot_effects.recoil_knockback + 30.0
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ACID_TRAIL",
		name 		= "$action_acid_trail",
		description = "$actiondesc_acid_trail",
		sprite 		= "data/ui_gfx/gun_actions/acid_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/acid_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3", -- ACID_TRAIL
		spawn_probability                 = "1,1,1", -- ACID_TRAIL
		price = 160,
		mana = 15,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/acid_trail.xml",
		action 		= function()
			c.trail_material = c.trail_material .. "acid,"
			c.trail_material_amount = c.trail_material_amount + 5
			draw_actions( 1, true )
		end,
	},
	{
		id          = "POISON_TRAIL",
		name 		= "$action_poison_trail",
		description = "$actiondesc_poison_trail",
		sprite 		= "data/ui_gfx/gun_actions/poison_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/poison_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- POISON_TRAIL
		spawn_probability                 = "1,1,1", -- POISON_TRAIL
		price = 160,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/poison_trail.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_poison.xml,"
			c.trail_material = c.trail_material .. "poison,"
			c.trail_material_amount = c.trail_material_amount + 9
			draw_actions( 1, true )
		end,
	},
	{
		id          = "OIL_TRAIL",
		name 		= "$action_oil_trail",
		description = "$actiondesc_oil_trail",
		sprite 		= "data/ui_gfx/gun_actions/oil_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/oil_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- oil_TRAIL
		spawn_probability                 = "1,1,1", -- oil_TRAIL
		price = 160,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/oil_trail.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_oiled.xml,"
			c.trail_material = c.trail_material .. "oil,"
			c.trail_material_amount = c.trail_material_amount + 20
			draw_actions( 1, true )
		end,
	},
	{
		id          = "WATER_TRAIL",
		name 		= "$action_water_trail",
		description = "$actiondesc_water_trail",
		sprite 		= "data/ui_gfx/gun_actions/water_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/oil_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- oil_TRAIL
		spawn_probability                 = "1,1,1", -- oil_TRAIL
		price = 160,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/water_trail.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_wet.xml,"
			c.trail_material = c.trail_material .. "water,"
			c.trail_material_amount = c.trail_material_amount + 20
			draw_actions( 1, true )
		end,
	},
	-- trail ideas for fun:
	-- * alcohol
	-- * soil
	-- * cement
	-- * grass 
	--[[
	{
		id          = "BLOOD_TRAIL",
		name 		= "$action_blood_trail",
		description = "$actiondesc_blood_trail",
		sprite 		= "data/ui_gfx/gun_actions/blood_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/oil_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- oil_TRAIL
		spawn_probability                 = "1,1,1", -- oil_TRAIL
		price = 160,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/blood_trail.xml",
		action 		= function()
			c.trail_material = c.trail_material .. "blood,"
			c.trail_material_amount = c.trail_material_amount + 20
			draw_actions( 1, true )
		end,
	},]]--
	{
		id          = "GUNPOWDER_TRAIL",
		name 		= "$action_gunpowder_trail",
		description = "$actiondesc_gunpowder_trail",
		sprite 		= "data/ui_gfx/gun_actions/gunpowder_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/oil_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- oil_TRAIL
		spawn_probability                 = "1,1,1", -- oil_TRAIL
		price = 160,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/gunpowder_trail.xml",
		action 		= function()
			c.trail_material = c.trail_material .. "gunpowder,"
			c.trail_material_amount = c.trail_material_amount + 20
			draw_actions( 1, true )
		end,
	},
	{
		id          = "FIRE_TRAIL",
		name 		= "$action_fire_trail",
		description = "$actiondesc_fire_trail",
		sprite 		= "data/ui_gfx/gun_actions/fire_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/fire_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4", -- FIRE_TRAIL
		spawn_probability                 = "1,1,1,1,1", -- FIRE_TRAIL
		price = 130,
		mana = 10,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/fire_trail.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_on_fire.xml,"
			c.trail_material = c.trail_material .. "fire,"
			c.trail_material_amount = c.trail_material_amount + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BURN_TRAIL",
		name 		= "$action_burn_trail",
		description = "$actiondesc_burn_trail",
		sprite 		= "data/ui_gfx/gun_actions/burn_trail.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/burn_trail_unidentified.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2", -- BURN
		spawn_probability                 = "1,1,1", -- BURN
		price = 100,
		mana = 5,
		--max_uses = 120,
		custom_xml_file = "data/entities/misc/custom_cards/burn_trail.xml",
		action 		= function()
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_on_fire.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/misc/burn.xml,"
			draw_actions( 1, true )
		end,
	},
	{
		id          = "TORCH",
		name 		= "$action_torch",
		description = "$actiondesc_torch",
		sprite 		= "data/ui_gfx/gun_actions/torch.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
		type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "0,1,2", -- TORCH
		spawn_probability                 = "1,1,1", -- TORCH
		price = 100,
		mana = 0,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/torch.xml",
		action 		= function()
			draw_actions( 1, true )
		end,
	},
	{
		id          = "TORCH_ELECTRIC",
		name 		= "$action_torch_electric",
		description = "$actiondesc_torch_electric",
		sprite 		= "data/ui_gfx/gun_actions/torch_electric.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
		type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "0,1,2", -- TORCH
		spawn_probability                 = "1,1,1", -- TORCH
		price = 150,
		mana = 0,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/torch_electric.xml",
		action 		= function()
			draw_actions( 1, true )
		end,
	},
	--[[
	{
		id          = "LIGHT",
		name 		= "$action_light",
		description = "$actiondesc_light",
		sprite 		= "data/ui_gfx/gun_actions/light.png",
		type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "", -- LIGHT
		spawn_probability                        = "", -- LIGHT
		price = 100,
		mana = 0,
		custom_xml_file = "data/entities/misc/custom_cards/action_light.xml",
		action 		= function()
			c.light = c.light + 70.0
		end,
	},
	]]--
	{
		id          = "ENERGY_SHIELD",
		name 		= "$action_energy_shield",
		description = "$actiondesc_energy_shield",
		sprite 		= "data/ui_gfx/gun_actions/energy_shield.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/energy_shield_unidentified.png",
		type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "2,3,4,5,6", -- ENERGY_SHIELD
		spawn_probability                 = "1,1,1,1,1", -- ENERGY_SHIELD
		price = 220,
		custom_xml_file = "data/entities/misc/custom_cards/energy_shield.xml",
		action 		= function()
			-- does nothing to the projectiles
		end,
	},
	{
		id          = "ENERGY_SHIELD_SECTOR",
		name 		= "$action_energy_shield_sector",
		description = "$actiondesc_energy_shield_sector",
		sprite 		= "data/ui_gfx/gun_actions/energy_shield_sector.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/energy_shield_sector_unidentified.png",
		type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "1,2,3,4,5", -- ENERGY_SHIELD_SECTOR
		spawn_probability                 = "1,1,1,1,1", -- ENERGY_SHIELD_SECTOR
		price = 160,
		custom_xml_file = "data/entities/misc/custom_cards/energy_shield_sector.xml",
		action 		= function()
			-- does nothing to the projectiles
		end,
	},
	--[[
	{
		id          = "DUPLICATE_ON_DEATH",
		name 		= "$action_duplicate_on_death",
		description = "$actiondesc_duplicate_on_death",
		sprite 		= "data/ui_gfx/gun_actions/duplicate_on_death.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- DUPLICATE_ON_DEATH
		spawn_probability                        = "", -- DUPLICATE_ON_DEATH
		price = 100,
		action 		= function()
			duplicates = duplicates + 1
		end,
	},
	]]--
	--[[
	{
		id          = "BEE",
		name 		= "$action_bee",
		description = "$actiondesc_bee",
		sprite 		= "data/ui_gfx/gun_actions/bee.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- BEE
		spawn_probability                        = "", -- BEE
		price = 100,
		action 		= function()
			sprite = "data/enemies_gfx/fly_all.xml"
		end,
	},
	{
		id          = "DUCK",
		name 		= "$action_duck",
		description = "$actiondesc_duck",
		sprite 		= "data/ui_gfx/gun_actions/duck.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- DUCK
		spawn_probability                        = "", -- DUCK
		price = 100,
		action 		= function()
			sprite = "data/enemies_gfx/duck_all.xml"
		end,
	},
	{
		id          = "SHEEP",
		name 		= "$action_sheep",
		description = "$actiondesc_sheep",
		sprite 		= "data/ui_gfx/gun_actions/sheep.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- SHEEP
		spawn_probability                        = "", -- SHEEP
		price = 100,
		action 		= function()
			sprite = "data/enemies_gfx/sheep_all.xml"
		end,
	},
	]]--
	-- other --
	--[[
	{
		id          = "MISFIRE",
		name 		= "$action_misfire",
		description = "$actiondesc_misfire",
		sprite 		= "data/ui_gfx/gun_actions/misfire.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- MISFIRE
		spawn_probability                        = "", -- MISFIRE
		price = 100,
		action 		= function()
			discard_random_action()
		end,
	},
	{
		id          = "MISFIRE_CRITICAL",
		name 		= "$action_misfire_critical",
		description = "$actiondesc_misfire_critical",
		sprite 		= "data/ui_gfx/gun_actions/misfire_critical.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- MISFIRE_CRITICAL
		spawn_probability                        = "", -- MISFIRE_CRITICAL
		price = 100,
		action 		= function()
			destroy_random_action()
		end,
	},
	{
		id          = "GENERATE_RANDOM_DECK_5",
		name 		= "$action_generate_random_deck_5",
		description = "$actiondesc_generate_random_deck_5",
		sprite 		= "data/ui_gfx/gun_actions/generate_random_deck_5.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- GENERATE_RANDOM_DECK_5
		spawn_probability                        = "", -- GENERATE_RANDOM_DECK_5
		price = 100,
		action 		= function()
			generate_random_deck(5)
		end,
	},
	
	-- projectiles --
	{
		id          = "TESTBULLET", -- REMOVE THIS ONCE PHYSICS_EXPLOSION_POWER IS ADJUSTED, JUST FOR TESTING
		name 		= "$action_testbullet",
		description = "$actiondesc_testbullet",
		sprite 		= "data/debug/icon_testbullet.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0", -- LIGHT_BULLET
		spawn_probability                        = "0", -- LIGHT_BULLET
		price = 100,
		mana = 0,
		max_uses = 999,
		action 		= function()
			add_projectile("data/entities/animals/boss_centipede/firepillar.xml")
			c.fire_rate_wait = 0
			current_reload_time = current_reload_time * 0.01
		end,
	},]]--
	{
		id          = "LIGHT_BULLET",
		name 		= "$action_light_bullet",
		description = "$actiondesc_light_bullet",
		sprite 		= "data/ui_gfx/gun_actions/light_bullet.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/light_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2", -- LIGHT_BULLET
		spawn_probability                 = "1,1,1", -- LIGHT_BULLET
		price = 100,
		mana = 5,
		--max_uses = -1,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/light_bullet.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
			c.spread_degrees = c.spread_degrees - 1.0
			c.damage_critical_chance = c.damage_critical_chance + 5
		end,
	},
	{
		id          = "AIR_BULLET",
		name 		= "$action_air_bullet",
		description = "$actiondesc_air_bullet",
		sprite 		= "data/ui_gfx/gun_actions/air_bullet.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/air_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2", -- AIR_BULLET
		spawn_probability                 = "1,1", -- AIR_BULLET
		price = 80,
		mana = 5,
		--max_uses = 120,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/light_bullet_air.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			--c.screenshake = c.screenshake + 0.1
			c.spread_degrees = c.spread_degrees - 1.0
			--c.knockback_force = c.knockback_force + 2
		end,
	},
	{
		id          = "LIGHT_BULLET_TRIGGER",
		name 		= "$action_light_bullet_trigger",
		description = "$actiondesc_light_bullet_trigger",
		sprite 		= "data/ui_gfx/gun_actions/light_bullet_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/light_bullet_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "0,1,2,3,4", -- LIGHT_BULLET_TRIGGER
		spawn_probability                   = "1,1,1,1,1", -- LIGHT_BULLET_TRIGGER
		price = 140,
		mana = 10,
		--max_uses = 100,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
			c.damage_critical_chance = c.damage_critical_chance + 5
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/light_bullet.xml", 1)
		end,
	},
	{
		id          = "LIGHT_BULLET_TRIGGER_2",
		name 		= "$action_light_bullet_trigger_2",
		description = "$actiondesc_light_bullet_trigger_2",
		sprite 		= "data/ui_gfx/gun_actions/light_bullet_trigger_2.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "2,3,5,6", -- LIGHT_BULLET_TRIGGER_2
		spawn_probability                   = "1,1,1,1", -- LIGHT_BULLET_TRIGGER_2
		price = 250,
		mana = 15,
		--max_uses = 100,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 4
			c.screenshake = c.screenshake + 1
			c.damage_critical_chance = c.damage_critical_chance + 5
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/light_bullet_blue.xml", 2)
		end,
	},
	{
		id          = "LIGHT_BULLET_TIMER",
		name 		= "$action_light_bullet_timer",
		description = "$actiondesc_light_bullet_timer",
		sprite 		= "data/ui_gfx/gun_actions/light_bullet_timer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/light_bullet_timer_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "1,2,3,4", -- LIGHT_BULLET_TIMER
		spawn_probability                   = "1,1,1,1", -- LIGHT_BULLET_TIMER
		price = 140,
		mana = 10,
		--max_uses = 100,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
			c.damage_critical_chance = c.damage_critical_chance + 5
			add_projectile_trigger_timer("data/entities/projectiles/deck/light_bullet.xml", 10, 1)
		end,
	},
	{
		id          = "BULLET",
		name 		= "$action_bullet",
		description = "$actiondesc_bullet",
		sprite 		= "data/ui_gfx/gun_actions/bullet.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5", -- BULLET
		spawn_probability                 = "1,1,1,1,1", -- BULLET
		price = 150,
		mana = 20,
		--max_uses = -1,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/bullet.xml")
			c.fire_rate_wait = c.fire_rate_wait + 4
			c.screenshake = c.screenshake + 2
			c.spread_degrees = c.spread_degrees + 1.0
			c.damage_critical_chance = c.damage_critical_chance + 5
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 23.0
		end,
	},
	{
		id          = "BULLET_TRIGGER",
		name 		= "$action_bullet_trigger",
		description = "$actiondesc_bullet_trigger",
		sprite 		= "data/ui_gfx/gun_actions/bullet_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bullet_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "1,2,3,4,5", -- BULLET_TRIGGER
		spawn_probability                   = "1,1,1,1,1", -- BULLET_TRIGGER
		price = 190,
		mana = 35,
		--max_uses = 80,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 4
			c.screenshake = c.screenshake + 2
			c.spread_degrees = c.spread_degrees + 1.0
			c.damage_critical_chance = c.damage_critical_chance + 5
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/bullet.xml", 1)
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 23.0
		end,
	},
	{
		id          = "BULLET_TIMER",
		name 		= "$action_bullet_timer",
		description = "$actiondesc_bullet_timer",
		sprite 		= "data/ui_gfx/gun_actions/bullet_timer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bullet_timer_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "2,3,4,5,6", -- BULLET_TIMER
		spawn_probability                   = "1,1,1,1,1", -- BULLET_TIMER
		price = 190,
		mana = 35,
		--max_uses = 80,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 4
			c.screenshake = c.screenshake + 2
			c.spread_degrees = c.spread_degrees + 1.0
			c.damage_critical_chance = c.damage_critical_chance + 5
			add_projectile_trigger_timer("data/entities/projectiles/deck/bullet.xml", 10, 1)
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 23.0
		end,
	},
	{
		id          = "HEAVY_BULLET",
		name 		= "$action_heavy_bullet",
		description = "$actiondesc_heavy_bullet",
		sprite 		= "data/ui_gfx/gun_actions/heavy_bullet.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/heavy_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5,6", -- HEAVY_BULLET
		spawn_probability                 = "1,1,1,1,1,1", -- HEAVY_BULLET
		price = 200,
		mana = 30,
		--max_uses = 50,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/bullet_heavy.xml")
			c.fire_rate_wait = c.fire_rate_wait + 7
			c.screenshake = c.screenshake + 2.5
			c.spread_degrees = c.spread_degrees + 2.5
			c.damage_critical_chance = c.damage_critical_chance + 5
			-- c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_disintegrated.xml,"
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 50.0
		end,
	},
	{
		id          = "HEAVY_BULLET_TRIGGER",
		name 		= "$action_heavy_bullet_trigger",
		description = "$actiondesc_heavy_bullet_trigger",
		sprite 		= "data/ui_gfx/gun_actions/heavy_bullet_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/heavy_bullet_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "2,3,4,5,6", -- HEAVY_BULLET_TRIGGER
		spawn_probability                   = "1,1,1,1,1", -- HEAVY_BULLET_TRIGGER
		price = 240,
		mana = 40,
		--max_uses = 50,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 7
			c.screenshake = c.screenshake + 2.5
			c.spread_degrees = c.spread_degrees + 2.5
			c.damage_critical_chance = c.damage_critical_chance + 5
			-- c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_disintegrated.xml,"
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/bullet_heavy.xml", 1)
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 50.0
		end,
	},
	{
		id          = "HEAVY_BULLET_TIMER",
		name 		= "$action_heavy_bullet_timer",
		description = "$actiondesc_heavy_bullet_timer",
		sprite 		= "data/ui_gfx/gun_actions/heavy_bullet_timer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/heavy_bullet_timer_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "2,3,4,5,6", -- HEAVY_BULLET_TIMER
		spawn_probability                   = "1,1,1,1,1", -- HEAVY_BULLET_TIMER
		price = 240,
		mana = 40,
		--max_uses = 50,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 7
			c.screenshake = c.screenshake + 2.5
			c.spread_degrees = c.spread_degrees + 2.5
			c.damage_critical_chance = c.damage_critical_chance + 5
			-- c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_disintegrated.xml,"
			add_projectile_trigger_timer("data/entities/projectiles/deck/bullet_heavy.xml", 10, 1)
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 50.0
		end,
	},
	{
		id          = "SLOW_BULLET",
		name 		= "$action_slow_bullet",
		description = "$actiondesc_slow_bullet",
		sprite 		= "data/ui_gfx/gun_actions/slow_bullet.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slow_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4", -- SLOW_BULLET
		spawn_probability                 = "1,1,1,1", -- SLOW_BULLET
		price = 160,
		mana = 30,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/bullet_slow.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/bullet_slow.xml")
			c.fire_rate_wait = c.fire_rate_wait + 6
			c.screenshake = c.screenshake + 2
			c.spread_degrees = c.spread_degrees + 1.8
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20.0
		end,
	},
	{
		id          = "SLOW_BULLET_TRIGGER",
		name 		= "$action_slow_bullet_trigger",
		description = "$actiondesc_slow_bullet_trigger",
		sprite 		= "data/ui_gfx/gun_actions/slow_bullet_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slow_bullet_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5", -- SLOW_BULLET_TRIGGER
		spawn_probability                 = "1,1,1,1,1", -- SLOW_BULLET_TRIGGER
		price = 200,
		mana = 50,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/bullet_slow.xml",
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 25
			c.screenshake = c.screenshake + 2
			c.spread_degrees = c.spread_degrees + 5
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/bullet_slow.xml", 1)
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20.0
		end,
	},
	{
		id          = "SLOW_BULLET_TIMER",
		name 		= "$action_slow_bullet_timer",
		description = "$actiondesc_slow_bullet_timer",
		sprite 		= "data/ui_gfx/gun_actions/slow_bullet_timer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slow_bullet_timer_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5,6", -- SLOW_BULLET_TIMER
		spawn_probability                 = "1,1,1,1,1,1", -- SLOW_BULLET_TIMER
		price = 200,
		mana = 50,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/bullet_slow.xml",
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 6
			c.screenshake = c.screenshake + 2
			c.spread_degrees = c.spread_degrees + 1.8
			add_projectile_trigger_timer("data/entities/projectiles/deck/bullet_slow.xml", 100, 1)
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20.0
		end,
	},
	{
		id          = "BLACK_HOLE",
		name 		= "$action_black_hole",
		description = "$actiondesc_black_hole",
		sprite 		= "data/ui_gfx/gun_actions/black_hole.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/black_hole_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,2,4,5", -- BLACK_HOLE
		spawn_probability                 = "1,1,1,1", -- BLACK_HOLE
		price = 200,
		mana = 180,
		max_uses    = 3, 
		custom_xml_file = "data/entities/misc/custom_cards/black_hole.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/black_hole.xml")
			c.fire_rate_wait = c.fire_rate_wait + 80
			c.screenshake = c.screenshake + 20
		end,
	},
	{
		id          = "BLACK_HOLE_BIG",
		name 		= "$action_black_hole_big",
		description = "$actiondesc_black_hole_big",
		sprite 		= "data/ui_gfx/gun_actions/black_hole_big.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/black_hole_big_unidentified.png",
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "1,3,5,6", -- BLACK_HOLE_BIG
		spawn_probability                 = "1,1,1,1", -- BLACK_HOLE_BIG
		price = 320,
		mana = 240,
		max_uses    = 6, 
		custom_xml_file = "data/entities/misc/custom_cards/black_hole_big.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/black_hole_big.xml")
			c.fire_rate_wait = c.fire_rate_wait + 80
			c.screenshake = c.screenshake + 10
		end,
	},
	--[[{
		id          = "DECOY",
		name 		= "$action_decoy",
		description = "$actiondesc_decoy",
		sprite 		= "data/ui_gfx/gun_actions/decoy.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/decoy_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5", -- DECOY
		spawn_probability                 = "1,1,1,1,1", -- DECOY
		price = 130,
		mana = 60,
		max_uses    = 10, 
		custom_xml_file = "data/entities/misc/custom_cards/decoy.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/decoy.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	{
		id          = "DECOY_TRIGGER",
		name 		= "$action_decoy_trigger",
		description = "$actiondesc_decoy_trigger",
		sprite 		= "data/ui_gfx/gun_actions/decoy_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/decoy_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,3,4,5,6", -- DECOY_TRIGGER
		spawn_probability                 = "1,1,1,1,1", -- DECOY_TRIGGER
		price = 150,
		mana = 80,
		max_uses    = 10, 
		custom_xml_file = "data/entities/misc/custom_cards/decoy_trigger.xml",
		action 		= function()
			add_projectile_trigger_death("data/entities/projectiles/deck/decoy_trigger.xml", 1)
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},]]--
	{
		id          = "SPITTER",
		name 		= "$action_spitter",
		description = "$actiondesc_spitter",
		sprite 		= "data/ui_gfx/gun_actions/spitter.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/spitter_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2", -- SPITTER
		spawn_probability                 = "1,1,1", -- SPITTER
		price = 110,
		mana = 5,
		--max_uses = 120,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/spitter.xml")
			-- damage = 0.1
			c.fire_rate_wait = math.max(c.fire_rate_wait - 1, 0)
			c.screenshake = c.screenshake + 0.1
			c.dampening = 0.1
			c.spread_degrees = c.spread_degrees + 4.0
		end,
	},
	{
		id          = "SPITTER_TIMER",
		name 		= "$action_spitter_timer",
		description = "$actiondesc_spitter_timer",
		sprite 		= "data/ui_gfx/gun_actions/spitter_timer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/spitter_timer_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3", -- SPITTER_TIMER
		spawn_probability                 = "1,1,1,1", -- SPITTER_TIMER
		price = 140,
		mana = 10,
		--max_uses = 120,
		action 		= function()
			-- damage = 0.1
			c.fire_rate_wait = math.max(c.fire_rate_wait - 1, 0)
			c.screenshake = c.screenshake + 0.1
			c.dampening = 0.1
			c.spread_degrees = c.spread_degrees + 4.0
			add_projectile_trigger_timer("data/entities/projectiles/deck/spitter.xml", 40, 1)
		end,
	},
	{
		id          = "BUBBLESHOT",
		name 		= "$action_bubbleshot",
		description = "$actiondesc_bubbleshot",
		sprite 		= "data/ui_gfx/gun_actions/bubbleshot.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bubbleshot_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2", -- BUBBLESHOT
		spawn_probability                 = "1,1,1", -- BUBBLESHOT
		price = 100,
		mana = 5,
		--max_uses = 120,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/bubbleshot.xml")
			-- damage = 0.1
			c.fire_rate_wait = math.max(c.fire_rate_wait - 5, 0)
			c.dampening = 0.1
		end,
	},
	{
		id          = "BUBBLESHOT_TRIGGER",
		name 		= "$action_bubbleshot_trigger",
		description = "$actiondesc_bubbleshot_trigger",
		sprite 		= "data/ui_gfx/gun_actions/bubbleshot_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bubbleshot_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3", -- BUBBLESHOT_TRIGGER
		spawn_probability                 = "1,1,1", -- BUBBLESHOT_TRIGGER
		price = 120,
		mana = 16,
		--max_uses = 120,
		action 		= function()
			-- damage = 0.1
			c.fire_rate_wait = math.max(c.fire_rate_wait - 5, 0)
			c.dampening = 0.1
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/bubbleshot.xml", 1)
		end,
	},
	{
		id          = "DISC_BULLET",
		name 		= "$action_disc_bullet",
		description = "$actiondesc_disc_bullet",
		sprite 		= "data/ui_gfx/gun_actions/disc_bullet.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/disc_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,2,4", -- DISC_BULLET
		spawn_probability                 = "1,1,1", -- DISC_BULLET
		price = 120,
		mana = 20,
		--max_uses = 40,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/disc_bullet.xml")
			-- damage = 0.3
			c.fire_rate_wait = c.fire_rate_wait + 10
			c.spread_degrees = c.spread_degrees + 1.0
			shot_effects.recoil_knockback = 20.0
		end,
	},
	{
		id          = "BOUNCY_ORB",
		name 		= "$action_bouncy_orb",
		description = "$actiondesc_bouncy_orb",
		sprite 		= "data/ui_gfx/gun_actions/bouncy_orb.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/disc_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,2,4", -- DISC_BULLET
		spawn_probability                 = "1,1,1", -- DISC_BULLET
		price = 120,
		mana = 20,
		--max_uses = 40,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/bouncy_orb.xml")
			-- damage = 0.3
			c.fire_rate_wait = c.fire_rate_wait + 10
			shot_effects.recoil_knockback = 20.0
		end,
	},
	{
		id          = "BOUNCY_ORB_TIMER",
		name 		= "$action_bouncy_orb_timer",
		description = "$actiondesc_bouncy_orb_timer",
		sprite 		= "data/ui_gfx/gun_actions/bouncy_orb_timer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/disc_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,2,4", -- DISC_BULLET
		spawn_probability                 = "1,1,1", -- DISC_BULLET
		price = 150,
		mana = 50,
		--max_uses = 40,
		action 		= function()
			add_projectile_trigger_timer("data/entities/projectiles/deck/bouncy_orb.xml",200,1)
			-- damage = 0.3
			c.fire_rate_wait = c.fire_rate_wait + 10
			shot_effects.recoil_knockback = 20.0
		end,
	},
	{
		id          = "RUBBER_BALL",
		name 		= "$action_rubber_ball",
		description = "$actiondesc_rubber_ball",
		sprite 		= "data/ui_gfx/gun_actions/rubber_ball.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/rubber_ball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,6", -- RUBBER_BALL
		spawn_probability                 = "1,1,1", -- RUBBER_BALL
		price = 60,
		mana = 5,
		--max_uses = 150,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/rubber_ball.xml")
			-- damage = 0.3
			c.fire_rate_wait = c.fire_rate_wait - 2
			c.spread_degrees = c.spread_degrees - 0.5
		end,
	},
	{
		id          = "ARROW",
		name 		= "$action_arrow",
		description = "$actiondesc_arrow",
		sprite 		= "data/ui_gfx/gun_actions/arrow.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/arrow_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,4,5", -- ARROW
		spawn_probability                 = "1,1,1,1", -- ARROW
		price = 140,
		mana = 15,
		--max_uses = 40,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/arrow.xml")
			-- damage = 0.3
			c.fire_rate_wait = c.fire_rate_wait + 10
			c.spread_degrees = c.spread_degrees - 10
			shot_effects.recoil_knockback = 30.0
		end,
	},
	{
		id          = "LANCE",
		name 		= "$action_lance",
		description = "$actiondesc_lance",
		sprite 		= "data/ui_gfx/gun_actions/lance.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/lance_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,5,6", -- LANCE
		spawn_probability                 = "1,1,1,1", -- LANCE
		price = 180,
		mana = 30,
		--max_uses = 30,
		custom_xml_file = "data/entities/misc/custom_cards/lance.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/lance.xml")
			-- damage = 0.3
			c.fire_rate_wait = c.fire_rate_wait + 20
			c.spread_degrees = c.spread_degrees - 10
			shot_effects.recoil_knockback = 60.0
		end,
	},
	{
		id          = "ROCKET",
		name 		= "$action_rocket",
		description = "$actiondesc_rocket",
		sprite 		= "data/ui_gfx/gun_actions/rocket.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/rocket_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5", -- ROCKET
		spawn_probability                 = "1,1,1,1,1", -- ROCKET
		price = 220,
		mana = 70,
		max_uses    = 10, 
		custom_xml_file = "data/entities/misc/custom_cards/rocket.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/rocket.xml")
			c.fire_rate_wait = c.fire_rate_wait + 60
			--current_reload_time = current_reload_time + 40
			c.ragdoll_fx = 2
			shot_effects.recoil_knockback = 120.0
		end,
	},
	{
		id          = "ROCKET_TIER_2",
		name 		= "$action_rocket_tier_2",
		description = "$actiondesc_rocket_tier_2",
		sprite 		= "data/ui_gfx/gun_actions/rocket_tier_2.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/rocket_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- ROCKET
		spawn_probability                 = "1,1,1,1,1", -- ROCKET
		price = 240,
		mana = 90,
		max_uses    = 8, 
		custom_xml_file = "data/entities/misc/custom_cards/rocket_tier_2.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/rocket_tier_2.xml")
			c.fire_rate_wait = c.fire_rate_wait + 90
			--current_reload_time = current_reload_time + 40
			c.ragdoll_fx = 2
			shot_effects.recoil_knockback = 160.0
		end,
	},
	{
		id          = "ROCKET_TIER_3",
		name 		= "$action_rocket_tier_3",
		description = "$actiondesc_rocket_tier_3",
		sprite 		= "data/ui_gfx/gun_actions/rocket_tier_3.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/rocket_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- ROCKET
		spawn_probability                 = "1,1,1,1,1", -- ROCKET
		price = 250,
		mana = 120,
		max_uses    = 6, 
		custom_xml_file = "data/entities/misc/custom_cards/rocket_tier_3.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/rocket_tier_3.xml")
			c.fire_rate_wait = c.fire_rate_wait + 120
			--current_reload_time = current_reload_time + 40
			c.ragdoll_fx = 2
			shot_effects.recoil_knockback = 180.0
		end,
	},
	{
		id          = "GRENADE",
		name 		= "$action_grenade",
		description = "$actiondesc_grenade",
		sprite 		= "data/ui_gfx/gun_actions/grenade.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/grenade_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4", -- GRENADE
		spawn_probability                 = "1,1,1,1,1", -- GRENADE
		price = 170,
		mana = 50,
		max_uses    = 25, 
		custom_xml_file = "data/entities/misc/custom_cards/grenade.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/grenade.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.screenshake = c.screenshake + 4.0
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			--current_reload_time = current_reload_time + 40
			shot_effects.recoil_knockback = 80.0
		end,
	},
	{
		id          = "GRENADE_TRIGGER",
		name 		= "$action_grenade_trigger",
		description = "$actiondesc_grenade_trigger",
		sprite 		= "data/ui_gfx/gun_actions/grenade_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/grenade_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                         = "0,1,2,3,4,5", -- GRENADE_TRIGGER
		spawn_probability                   = "1,1,1,1,1,1", -- GRENADE_TRIGGER
		price = 210,
		max_uses    = 25, 
		custom_xml_file = "data/entities/misc/custom_cards/grenade_trigger.xml",
		mana = 50,
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.screenshake = c.screenshake + 4.0
			--current_reload_time = current_reload_time + 60
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/grenade.xml", 1)
			shot_effects.recoil_knockback = 80.0
		end,
	},
	{
		id          = "GRENADE_TIER_2",
		name 		= "$action_grenade_tier_2",
		description = "$actiondesc_grenade_tier_2",
		sprite 		= "data/ui_gfx/gun_actions/grenade_tier_2.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/grenade_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5", -- GRENADE
		spawn_probability                 = "1,1,1,1,1", -- GRENADE
		price = 220,
		mana = 90,
		max_uses    = 20, 
		custom_xml_file = "data/entities/misc/custom_cards/grenade_tier_2.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/grenade_tier_2.xml")
			c.fire_rate_wait = c.fire_rate_wait + 50
			c.screenshake = c.screenshake + 8.0
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			--current_reload_time = current_reload_time + 40
			shot_effects.recoil_knockback = 120.0
		end,
	},
	{
		id          = "GRENADE_TIER_3",
		name 		= "$action_grenade_tier_3",
		description = "$actiondesc_grenade_tier_3",
		sprite 		= "data/ui_gfx/gun_actions/grenade_tier_3.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/grenade_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5", -- GRENADE
		spawn_probability                 = "1,1,1,1,1", -- GRENADE
		price = 220,
		mana = 90,
		max_uses    = 20, 
		custom_xml_file = "data/entities/misc/custom_cards/grenade_tier_3.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/grenade_tier_3.xml")
			c.fire_rate_wait = c.fire_rate_wait + 80
			c.screenshake = c.screenshake + 15.0
			c.child_speed_multiplier = c.child_speed_multiplier * 0.9
			--current_reload_time = current_reload_time + 40
			shot_effects.recoil_knockback = 140.0
		end,
	},
	{
		id          = "GRENADE_ANTI",
		name 		= "$action_grenade_anti",
		description = "$actiondesc_grenade_anti",
		sprite 		= "data/ui_gfx/gun_actions/grenade_anti.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/grenade_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5", -- GRENADE
		spawn_probability                 = "1,1,1,1,1,1", -- GRENADE
		price = 170,
		mana = 50,
		max_uses    = 25, 
		custom_xml_file = "data/entities/misc/custom_cards/grenade.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/grenade_anti.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.screenshake = c.screenshake + 4.0
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			--current_reload_time = current_reload_time + 40
			shot_effects.recoil_knockback = 80.0
		end,
	},
	{
		id          = "GRENADE_LARGE",
		name 		= "$action_grenade_large",
		description = "$actiondesc_grenade_large",
		sprite 		= "data/ui_gfx/gun_actions/grenade_large.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/grenade_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5", -- GRENADE
		spawn_probability                 = "1,1,1,1,1,1", -- GRENADE
		price = 150,
		mana = 80,
		max_uses    = 35, 
		custom_xml_file = "data/entities/misc/custom_cards/grenade.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/grenade_large.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
			c.screenshake = c.screenshake + 5.0
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			--current_reload_time = current_reload_time + 40
			shot_effects.recoil_knockback = 80.0
		end,
	},
	{
		id 			= "MINE",
		name 		= "$action_mine",
		description = "$actiondesc_mine",
		sprite 		= "data/ui_gfx/gun_actions/mine.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/mine_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level	           = "1,3,4,6", -- MINE
		spawn_probability	   = "1,1,1,1", -- MINE
		price = 200,
		mana = 20,
		max_uses	= 10, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/mine.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			c.speed_multiplier = c.speed_multiplier * 0.75
			shot_effects.recoil_knockback = 60.0
		end,
	},
	{
		id 			= "MINE_DEATH_TRIGGER",
		name 		= "$action_mine_death_trigger",
		description = "$actiondesc_mine_death_trigger",
		sprite 		= "data/ui_gfx/gun_actions/mine_death_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/mine_death_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level	           = "2,6", -- MINE_DEATH_TRIGGER
		spawn_probability	   = "1,1", -- MINE_DEATH_TRIGGER
		price = 240,
		mana = 20,
		max_uses	= 10, 
		action 		= function()
			add_projectile_trigger_death("data/entities/projectiles/deck/mine.xml", 1)
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			c.speed_multiplier = c.speed_multiplier * 0.75
			shot_effects.recoil_knockback = 60.0
		end,
	},
	{
		id 			= "PIPE_BOMB",
		name 		= "$action_pipe_bomb",
		description = "$actiondesc_pipe_bomb",
		sprite 		= "data/ui_gfx/gun_actions/pipe_bomb.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/pipe_bomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level	           = "2,3,4", -- PIPE_BOMB
		spawn_probability	   = "1,1,1", -- PIPE_BOMB
		price = 200,
		mana = 20,
		max_uses	= 20, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/pipe_bomb.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			c.speed_multiplier = c.speed_multiplier * 0.75
		end,
	},
	{
		id          = "PIPE_BOMB_DEATH_TRIGGER",
		name 		= "$action_pipe_bomb_death_trigger",
		description = "$actiondesc_pipe_bomb_death_trigger",
		sprite 		= "data/ui_gfx/gun_actions/pipe_bomb_death_trigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/pipe_bomb_death_trigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5", -- PIPE_BOMB_DEATH_TRIGGER
		spawn_probability                 = "1,1,1,1", -- PIPE_BOMB_DEATH_TRIGGER
		price = 230,
		mana = 20,
		max_uses    = 20, 
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.child_speed_multiplier = c.child_speed_multiplier * 0.75
			c.speed_multiplier = c.speed_multiplier * 0.75
			add_projectile_trigger_death("data/entities/projectiles/deck/pipe_bomb.xml", 1)
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 60.0
		end,
	},
	{
		id          = "EXPLODING_DEER",
		name 		= "$action_exploding_deer",
		description = "$actiondesc_exploding_deer",
		spawn_requires_flag = "card_unlocked_exploding_deer",
		sprite 		= "data/ui_gfx/gun_actions/exploding_deer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/exploding_deer_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "3,4,5", -- EXPLODING_DEER
		spawn_probability                 = "1,1,1", -- EXPLODING_DEER
		price = 170,
		mana = 120,
		max_uses    = 10, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/exploding_deer.xml")
			c.fire_rate_wait = c.fire_rate_wait + 80
		end,
	},
	{
		id          = "PIPE_BOMB_DETONATOR",
		name 		= "$action_pipe_bomb_detonator",
		description = "$actiondesc_pipe_bomb_detonator",
		sprite 		= "data/ui_gfx/gun_actions/pipe_bomb_detonator.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/pipe_bomb_detonator_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- PIPE_BOMB_DETONATOR
		spawn_probability                 = "1,1,1,1,1", -- PIPE_BOMB_DETONATOR
		price = 50,
		mana = 50,
		max_uses = 50,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/pipe_bomb_detonator.xml")
			c.fire_rate_wait = c.fire_rate_wait + 5
			--current_reload_time = current_reload_time + 5
		end,
	},
	{
		id          = "LASER",
		name 		= "$action_laser",
		description = "$actiondesc_laser",
		sprite 		= "data/ui_gfx/gun_actions/laser.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/laser_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,4", -- LASER
		spawn_probability                 = "1,1,1", -- LASER
		price = 180,
		mana = 30,
		--max_uses = 80,
		custom_xml_file = "data/entities/misc/custom_cards/laser.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/laser.xml")
			c.fire_rate_wait = c.fire_rate_wait - 22
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_disintegrated.xml,"
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20.0
		end,
	},
	{
		id          = "LIGHTNING",
		name 		= "$action_lightning",
		description = "$actiondesc_lightning",
		sprite 		= "data/ui_gfx/gun_actions/lightning.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/lightning_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,5,6", -- LIGHTNING
		spawn_probability                 = "1,1,1,1", -- LIGHTNING
		price = 250,
		mana = 70,
		--max_uses = 30,
		custom_xml_file = "data/entities/misc/custom_cards/electric_charge.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/lightning.xml")
			c.fire_rate_wait = c.fire_rate_wait + 50
			shot_effects.recoil_knockback = 180.0
		end,
	},
	{
		id          = "DIGGER",
		name 		= "$action_digger",
		description = "$actiondesc_digger",
		sprite 		= "data/ui_gfx/gun_actions/digger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/digger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2", -- DIGGER
		spawn_probability                 = "1,1", -- DIGGER
		price = 70,
		mana = 0,
		sound_loop_tag = "sound_digger",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/digger.xml")
			c.fire_rate_wait = c.fire_rate_wait + 1
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the digger reload time back to 0
		end,
	},
	{
		id          = "POWERDIGGER",
		name 		= "$action_powerdigger",
		description = "$actiondesc_powerdigger",
		sprite 		= "data/ui_gfx/gun_actions/powerdigger.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/powerdigger_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4", -- POWERDIGGER
		spawn_probability                 = "1,1,1", -- POWERDIGGER
		price = 110,
		mana = 0,
		sound_loop_tag = "sound_digger",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/powerdigger.xml")
			c.fire_rate_wait = c.fire_rate_wait + 1
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the digger reload time back to 0
		end,
	},
	{
		id          = "CHAINSAW",
		name 		= "$action_chainsaw",
		description = "$actiondesc_chainsaw",
		sprite 		= "data/ui_gfx/gun_actions/chainsaw.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/chainsaw_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,2", -- CHAINSAW
		spawn_probability                 = "1,1", -- CHAINSAW
		price = 80,
		mana = 0,
		--max_uses = 1000,
		sound_loop_tag = "sound_digger",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/chainsaw.xml")
			c.fire_rate_wait = 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the digger reload time back to 0
		end,
	},
	{
		id          = "TENTACLE",
		name 		= "$action_tentacle",
		description = "$actiondesc_tentacle",
		spawn_requires_flag = "card_unlocked_tentacle",
		sprite 		= "data/ui_gfx/gun_actions/tentacle.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/tentacle_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "3,4,5,6", -- TENTACLE
		spawn_probability                 = "1,1,1,1", -- TENTACLE
		price = 200,
		mana = 20,
		--max_uses = 40,
		custom_xml_file = "data/entities/misc/custom_cards/tentacle.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/tentacle.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	{
		id          = "TENTACLE_TIMER",
		name 		= "$action_tentacle_timer",
		description = "$actiondesc_tentacle_timer",
		spawn_requires_flag = "card_unlocked_tentacle",
		sprite 		= "data/ui_gfx/gun_actions/tentacle_timer.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/tentacle_timer_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "3,4,5,6", -- TENTACLE_TIMER
		spawn_probability                 = "1,1,1,1", -- TENTACLE_TIMER
		price = 250,
		mana = 20,
		--max_uses = 40,
		custom_xml_file = "data/entities/misc/custom_cards/tentacle_timer.xml",
		action 		= function()
			add_projectile_trigger_timer("data/entities/projectiles/deck/tentacle.xml",20,1)
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	{
		id          = "HEAL_BULLET",
		name 		= "$action_heal_bullet",
		description = "$actiondesc_heal_bullet",
		sprite 		= "data/ui_gfx/gun_actions/heal_bullet.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/heal_bullet_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4", -- HEAL_BULLET
		spawn_probability                 = "1,1,1", -- HEAL_BULLET
		price = 60,
		mana = 15,
		max_uses = 20,
		custom_xml_file = "data/entities/misc/custom_cards/heal_bullet.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/heal_bullet.xml")
			c.fire_rate_wait = c.fire_rate_wait + 4
			c.spread_degrees = c.spread_degrees + 1.0
		end,
	},
	{
		id          = "SPIRAL_SHOT",
		name 		= "$action_spiral_shot",
		description = "$actiondesc_spiral_shot",
		spawn_requires_flag = "card_unlocked_spiral_shot",
		sprite 		= "data/ui_gfx/gun_actions/spiral_shot.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/spiral_shot_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "4,5,6", -- SPIRAL_SHOT
		spawn_probability                 = "1,1,1", -- SPIRAL_SHOT
		price = 190,
		mana = 50,
		max_uses    = 15, 
		custom_xml_file = "data/entities/misc/custom_cards/spiral_shot.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/spiral_shot.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "FIREBALL",
		name 		= "$action_fireball",
		description = "$actiondesc_fireball",
		sprite 		= "data/ui_gfx/gun_actions/fireball.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/fireball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,3,4,6", -- FIREBALL
		spawn_probability                 = "1,1,1,1", -- FIREBALL
		price = 220,
		mana = 70,
		max_uses = 15,
		custom_xml_file = "data/entities/misc/custom_cards/fireball.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/fireball.xml")
			c.spread_degrees = c.spread_degrees + 2.0
			c.fire_rate_wait = c.fire_rate_wait + 50
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20.0
		end,
	},
	{
		id          = "METEOR",
		name 		= "$action_meteor",
		description = "$actiondesc_meteor",
		sprite 		= "data/ui_gfx/gun_actions/meteor.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/meteor_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "4,5,6", -- METEOR
		spawn_probability                 = "1,1,1", -- METEOR
		price = 280,
		mana = 150,
		max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/meteor.xml")
		end,
	},
	{
		id          = "FLAMETHROWER",
		name 		= "$action_flamethrower",
		description = "$actiondesc_flamethrower",
		sprite 		= "data/ui_gfx/gun_actions/flamethrower.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/flamethrower_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,6", -- FLAMETHROWER
		spawn_probability                 = "1,1,1", -- FLAMETHROWER
		price = 220,
		mana = 20,
		max_uses = 60,
		custom_xml_file = "data/entities/misc/custom_cards/flamethrower.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/flamethrower.xml")
			c.spread_degrees = c.spread_degrees + 2.0
		end,
	},
	--[[
	{
		id          = "ICETHROWER",
		name 		= "$action_icethrower",
		description = "$actiondesc_icethrower",
		sprite 		= "data/ui_gfx/gun_actions/icethrower.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- ICETHROWER
		spawn_probability                        = "1,1,20,1,1,1,1,1,1,1,1,1", -- ICETHROWER
		price = 260,
		mana = 20,
		max_uses = 60,
		custom_xml_file = "data/entities/misc/custom_cards/icethrower.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/icethrower.xml")
			c.spread_degrees = c.spread_degrees + 2.0
		end,
	},
	]]--
	{
		id          = "SLIMEBALL",
		name 		= "$action_slimeball",
		description = "$actiondesc_slimeball",
		sprite 		= "data/ui_gfx/gun_actions/slimeball.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1", -- SLIMEBALL
		price = 130,
		mana = 20,
		--max_uses = 50,
		custom_xml_file = "data/entities/misc/custom_cards/slimeball.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/slime.xml")
			c.spread_degrees = c.spread_degrees + 2.0
			c.fire_rate_wait = c.fire_rate_wait + 10
			c.speed_multiplier = c.speed_multiplier * 1.1
		end,
	},
	{
		id          = "DARKFLAME",
		name 		= "$action_darkflame",
		description = "$actiondesc_darkflame",
		sprite 		= "data/ui_gfx/gun_actions/darkflame.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/darkflame_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "3,5,6", -- DARKFLAME
		spawn_probability                 = "1,1,1", -- DARKFLAME
		price = 180,
		mana = 90,
		custom_xml_file = "data/entities/misc/custom_cards/darkflame.xml",
		max_uses    = 60, 
		action 		= function()
			add_projectile("data/entities/projectiles/darkflame.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	--[[
	{
		id          = "MISSILE",
		name 		= "$action_missile",
		description = "$actiondesc_missile",
		sprite 		= "data/ui_gfx/gun_actions/missile.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- MISSILE
		spawn_probability                        = "1,1,20,1,1,1,1,1,1,1,1,1", -- MISSILE
		price = 200,
		mana = 60,
		max_uses    = 15, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/rocket_player.xml")
			current_reload_time = current_reload_time + 60
			c.spread_degrees = c.spread_degrees + 2.0
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 60.0
		end,
	},
	]]--
	{
		id          = "PEBBLE",
		name 		= "$action_pebble",
		description = "$actiondesc_pebble",
		sprite 		= "data/ui_gfx/gun_actions/pebble.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/pebble_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,4,6", -- PEBBLE
		spawn_probability                 = "1,1,1,1", -- PEBBLE
		price = 200,
		mana = 120,
		max_uses    = 10, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/pebble_player.xml")
			c.fire_rate_wait = c.fire_rate_wait + 80
		end,
	},
	{
		id          = "DYNAMITE",
		name 		= "$action_dynamite",
		description = "$actiondesc_dynamite",
		sprite 		= "data/ui_gfx/gun_actions/dynamite.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/dynamite_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4", -- DYNAMITE
		spawn_probability                 = "1,1,1,1,1", -- DYNAMITE
		price = 160,
		mana = 50,
		max_uses    = 16,
		custom_xml_file = "data/entities/misc/custom_cards/tnt.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/tnt.xml")
			c.fire_rate_wait = c.fire_rate_wait + 50
			c.spread_degrees = c.spread_degrees + 6.0
		end,
	},
	--[[
	{
		id          = "BOMB_LEGACY",
		name 		= "$action_bomb_legacy",
		description = "$actiondesc_bomb_legacy",
		sprite 		= "data/ui_gfx/gun_actions/bomb.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6", -- BOMB
		spawn_probability                 = "1,1,1,1,1,1,1", -- BOMB
		price = 200,
		mana = 50, 
		max_uses    = 3, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/bomb.xml")
			current_reload_time = current_reload_time + 80
		end,
	},
	]]--
	{
		id          = "BOMB",
		name 		= "$action_bomb",
		description = "$actiondesc_bomb",
		sprite 		= "data/ui_gfx/gun_actions/bomb.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6", -- BOMB
		spawn_probability                 = "1,1,1,1,1,1,1", -- BOMB
		price = 200,
		mana = 25, 
		max_uses    = 3, 
		custom_xml_file = "data/entities/misc/custom_cards/bomb.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/bomb.xml")
			c.fire_rate_wait = c.fire_rate_wait + 100
		end,
	},
	{
		id          = "BOMB_HOLY",
		name 		= "$action_bomb_holy",
		description = "$actiondesc_bomb_holy",
		spawn_requires_flag = "card_unlocked_bomb_holy",
		sprite 		= "data/ui_gfx/gun_actions/bomb_holy.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- BOMB_HOLY
		spawn_probability                 = "1,1,1,1,1", -- BOMB_HOLY
		price = 400,
		mana = 300, 
		max_uses    = 2, 
		custom_xml_file = "data/entities/misc/custom_cards/bomb_holy.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/bomb_holy.xml")
			current_reload_time = current_reload_time + 80
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 100.0
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	{
		id          = "CRUMBLING_EARTH",
		name 		= "$action_crumbling_earth",
		description = "$actiondesc_crumbling_earth",
		spawn_requires_flag = "card_unlocked_crumbling_earth",
		sprite 		= "data/ui_gfx/gun_actions/crumbling_earth.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6", -- BOMB_HOLY
		spawn_probability                 = "1,1,1,1,1", -- BOMB_HOLY
		price = 300,
		mana = 240, 
		max_uses    = 3, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/crumbling_earth.xml")
		end,
	},
	--[[
	{
		id          = "KNIFE",
		name 		= "$action_knife",
		description = "$actiondesc_knife",
		sprite 		= "data/ui_gfx/gun_actions/knife.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/bomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6", -- BOMB
		spawn_probability                 = "1,1,1,1,1,1,1", -- BOMB
		price = 200,
		mana = 50, 
		max_uses    = 5, 
		custom_xml_file = "data/entities/misc/custom_cards/knife.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/knife.xml")
		end,
	},
	{
		id          = "CIRCLESHOT_A",
		name 		= "$action_circleshot_a",
		description = "$actiondesc_circleshot_a",
		sprite 		= "data/ui_gfx/gun_actions/phantomshot_a.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- CIRCLESHOT_A
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- CIRCLESHOT_A
		price = 100,
		mana = 80,
		custom_xml_file = "data/entities/misc/custom_cards/circleshot_a.xml",
		max_uses    = 40, 
		action 		= function()
			add_projectile("data/entities/projectiles/orbspawner_green.xml")
			current_reload_time = current_reload_time + 80
		end,
	},
	{
		id          = "CIRCLESHOT_B",
		name 		= "$action_circleshot_b",
		description = "$actiondesc_circleshot_b",
		sprite 		= "data/ui_gfx/gun_actions/phantomshot_b.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- CIRCLESHOT_B
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- CIRCLESHOT_B
		price = 100,
		mana = 80,
		max_uses    = 40, 
		custom_xml_file = "data/entities/misc/custom_cards/circleshot_b.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/orbspawner.xml")
			current_reload_time = current_reload_time + 80
		end,
	},
	]]--
	{
		id          = "ACIDSHOT",
		name 		= "$action_acidshot",
		description = "$actiondesc_acidshot",
		sprite 		= "data/ui_gfx/gun_actions/acidshot.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/acidshot_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4", -- ACIDSHOT
		spawn_probability                 = "1,1,1,1", -- ACIDSHOT
		price = 180,
		mana = 20,
		max_uses = 20,
		custom_xml_file = "data/entities/misc/custom_cards/acidshot.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/acidshot.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
		end,
	},
	{
		id          = "THUNDERBALL",
		name 		= "$action_thunderball",
		description = "$actiondesc_thunderball",
		sprite 		= "data/ui_gfx/gun_actions/thunderball.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/thunderball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,4,6", -- THUNDERBALL
		spawn_probability                 = "1,1,1", -- THUNDERBALL
		price = 300,
		mana = 120,
		max_uses    = 3, 
		custom_xml_file = "data/entities/misc/custom_cards/thunderball.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/thunderball.xml")
			c.fire_rate_wait = c.fire_rate_wait + 120
		end,
	},
	--[[
	{
		id          = "BLOOMSHOT",
		name 		= "$action_bloomshot",
		description = "$actiondesc_bloomshot",
		sprite 		= "data/ui_gfx/gun_actions/bloomshot.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- BLOOMSHOT
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- BLOOMSHOT
		price = 150,
		mana = 80,
		max_uses    = 30, 
		custom_xml_file = "data/entities/misc/custom_cards/bloomshot.xml",
		-- max_uses    = 10, 
		action 		= function()
			add_projectile("data/entities/projectiles/bloomshot.xml")
			current_reload_time = current_reload_time + 40
		end,
	},
	{
		id          = "ICECIRCLE",
		name 		= "$action_icecircle",
		description = "$actiondesc_icecircle",
		sprite 		= "data/ui_gfx/gun_actions/icecircle.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- ICECIRCLE
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- ICECIRCLE
		price = 130,
		mana = 100,
		max_uses    = 30, 
		custom_xml_file = "data/entities/misc/custom_cards/icecircle.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/iceskull_explosion.xml")
			current_reload_time = current_reload_time + 60
		end,
	},
	]]--
	{
		id          = "FIREBOMB",
		name 		= "$action_firebomb",
		description = "$actiondesc_firebomb",
		sprite 		= "data/ui_gfx/gun_actions/firebomb.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/firebomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,5", -- FIREBOMB
		spawn_probability                 = "1,1,1,1", -- FIREBOMB
		price = 90,
		mana = 10,
		--max_uses    = 70, 
		custom_xml_file = "data/entities/misc/custom_cards/firebomb.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/firebomb.xml")
		end,
	},
	{
		id          = "SOILBALL",
		name 		= "$action_soilball",
		description = "$actiondesc_soilball",
		sprite 		= "data/ui_gfx/gun_actions/soil.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/firebomb_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,5", -- FIREBOMB
		spawn_probability                 = "1,1,1,1", -- FIREBOMB
		price = 10,
		mana = 5,
		action 		= function()
			add_projectile("data/entities/projectiles/chunk_of_soil.xml")
		end,
	},
	--[[
	{
		id          = "SOILBALL",
		name 		= "$action_soilball",
		description = "$actiondesc_soilball",
		sprite 		= "data/ui_gfx/gun_actions/soil.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/firebomb_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,5", -- FIREBOMB
		spawn_probability                 = "1,1,1,1", -- FIREBOMB
		price = 10,
		mana = 5,
		action 		= function()
			add_projectile("data/entities/projectiles/chunk_of_soil.xml")
		end,
	},]]--
	--[[
	{
		id          = "PINK_ORB",
		name 		= "$action_pink_orb",
		description = "$actiondesc_pink_orb",
		sprite 		= "data/ui_gfx/gun_actions/pink_orb.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- PINK_ORB
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- PINK_ORB
		price = 160,
		mana = 60,
		max_uses    = 25, 
		custom_xml_file = "data/entities/misc/custom_cards/pink_orb.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/pink_orb.xml")
			current_reload_time = current_reload_time + 40
		end,
	},
	]]--
	{
		id          = "DEATH_CROSS",
		name 		= "$action_death_cross",
		description = "$actiondesc_death_cross",
		sprite 		= "data/ui_gfx/gun_actions/death_cross.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/death_cross_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5,6", -- DEATH_CROSS
		spawn_probability                        = "1,1,1,1,1,1", -- DEATH_CROSS
		price = 210,
		mana = 80,
		custom_xml_file = "data/entities/misc/custom_cards/death_cross.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/death_cross.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	--[[
	{
		id          = "PLASMA_FLARE",
		name 		= "$action_plasma_flare",
		description = "$actiondesc_plasma_flare",
		sprite 		= "data/ui_gfx/gun_actions/plasma_flare.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- PINK_ORB
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- PINK_ORB
		price = 230,
		mana = 40,
		max_uses    = 30, 
		custom_xml_file = "data/entities/misc/custom_cards/plasma_flare.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/orb_pink_fast.xml")
		end,
	},
	{
		id          = "KEYSHOT",
		name 		= "$action_keyshot",
		description = "$actiondesc_keyshot",
		sprite 		= "data/ui_gfx/gun_actions/keyshot.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0", -- KEYSHOT
		spawn_probability                        = "0", -- KEYSHOT
		price = 999,
		mana = 300,
		max_uses    = 3, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/keyshot.xml")
			current_reload_time = current_reload_time + 100
		end,
	},
	{
		id          = "MANA",
		name 		= "$action_mana",
		description = "$actiondesc_mana",
		sprite 		= "data/ui_gfx/gun_actions/mana.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- MANA
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- MANA
		price = 100,
		mana = -200,
		max_uses    = 5, 
		custom_xml_file = "data/entities/misc/custom_cards/mana.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/mana.xml")
		end,
	},
	{
		id          = "SKULL",
		name 		= "$action_skull",
		description = "$actiondesc_skull",
		sprite 		= "data/ui_gfx/gun_actions/skull.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- SKULL
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- SKULL
		price = 150,
		mana = 60,
		max_uses    = 20, 
		action 		= function()
			add_projectile("data/entities/projectiles/deck/skull.xml")
		end,
	},
	-- DEBUG REMOVE ME --
	{
		id          = "MATERIAL_DEBUG",
		name 		= "$action_material_debug",
		description = "$actiondesc_material_debug",
		sprite 		= "data/ui_gfx/gun_actions/material_debug.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- MATERIAL_DEBUG
		spawn_probability                 = "", -- MATERIAL_DEBUG
		price = 100,
		mana = 0,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_debug.xml")
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_LIQUID",
		name 		= "$action_material_liquid",
		description = "$actiondesc_material_liquid",
		sprite 		= "data/ui_gfx/gun_actions/material_liquid.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- MATERIAL_LIQUID
		spawn_probability                 = "", -- MATERIAL_LIQUID
		price = 100,
		mana = 0,
		custom_xml_file = "data/entities/misc/custom_cards/material_liquid.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_liquid.xml")
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	]]--
	{
		id          = "MIST_RADIOACTIVE",
		name 		= "$action_mist_radioactive",
		description = "$actiondesc_mist_radioactive",
		sprite 		= "data/ui_gfx/gun_actions/mist_radioactive.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 80,
		mana = 40,
		--max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/mist_radioactive.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
		end,
	},
	{
		id          = "MIST_ALCOHOL",
		name 		= "$action_mist_alcohol",
		description = "$actiondesc_mist_alcohol",
		sprite 		= "data/ui_gfx/gun_actions/mist_alcohol.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 80,
		mana = 40,
		--max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/mist_alcohol.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
		end,
	},
	{
		id          = "MIST_SLIME",
		name 		= "$action_mist_slime",
		description = "$actiondesc_mist_slime",
		sprite 		= "data/ui_gfx/gun_actions/mist_slime.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 80,
		mana = 40,
		--max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/mist_slime.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
		end,
	},
	{
		id          = "MIST_BLOOD",
		name 		= "$action_mist_blood",
		description = "$actiondesc_mist_blood",
		sprite 		= "data/ui_gfx/gun_actions/mist_blood.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 120,
		mana = 40,
		max_uses = 10,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/mist_blood.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
		end,
	},
	{
		id          = "CIRCLE_FIRE",
		name 		= "$action_circle_fire",
		description = "$actiondesc_circle_fire",
		sprite 		= "data/ui_gfx/gun_actions/circle_fire.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 170,
		mana = 20,
		max_uses = 8,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/circle_fire.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "CIRCLE_ACID",
		name 		= "$action_circle_acid",
		description = "$actiondesc_circle_acid",
		sprite 		= "data/ui_gfx/gun_actions/circle_acid.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 180,
		mana = 40,
		max_uses = 4,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/circle_acid.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "CIRCLE_OIL",
		name 		= "$action_circle_oil",
		description = "$actiondesc_circle_oil",
		sprite 		= "data/ui_gfx/gun_actions/circle_oil.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 160,
		mana = 20,
		max_uses = 8,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/circle_oil.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "CIRCLE_WATER",
		name 		= "$action_circle_water",
		description = "$actiondesc_circle_water",
		sprite 		= "data/ui_gfx/gun_actions/circle_water.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/slimeball_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4", -- SLIMEBALL
		spawn_probability                 = "1,1,1,1", -- SLIMEBALL
		price = 160,
		mana = 20,
		max_uses = 8,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/circle_water.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "MATERIAL_WATER",
		name 		= "$action_material_water",
		description = "$actiondesc_material_water",
		sprite 		= "data/ui_gfx/gun_actions/material_water.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/material_water_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4,5", -- MATERIAL_WATER
		spawn_probability                 = "1,1,1,1,1", -- MATERIAL_WATER
		price = 110,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_water.xml")
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_wet.xml,"
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_OIL",
		name 		= "$action_material_oil",
		description = "$actiondesc_material_oil",
		sprite 		= "data/ui_gfx/gun_actions/material_oil.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/material_oil_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4,5", -- MATERIAL_OIL
		spawn_probability                 = "1,1,1,1,1", -- MATERIAL_OIL
		price = 140,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_oil.xml")
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_oiled.xml,"
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	-- Note( Petri ): 10.7.2019 - this could be just removed (vampirism, the limited uses in these is extremely silly)
	{
		id          = "MATERIAL_BLOOD",
		name 		= "$action_material_blood",
		description = "$actiondesc_material_blood",
		sprite 		= "data/ui_gfx/gun_actions/material_blood.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/material_blood_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4,5", -- MATERIAL_BLOOD
		spawn_probability                 = "1,1,1,1,1", -- MATERIAL_BLOOD
		price = 130,
		max_uses = 250,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_blood.xml")
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_apply_bloody.xml,"
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_ACID",
		name 		= "$action_material_acid",
		description = "$actiondesc_material_acid",
		sprite 		= "data/ui_gfx/gun_actions/material_acid.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/material_acid_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "2,3,4,5,6", -- MATERIAL_BLOOD
		spawn_probability                 = "1,1,1,1,1", -- MATERIAL_BLOOD
		price = 150,
		-- Note( Petri ): 10.7.2019 - removed uses. We have acid trail already
		-- max_uses = 250,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_acid.xml")
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_CEMENT",
		name 		= "$action_material_cement",
		description = "$actiondesc_material_cement",
		spawn_requires_flag = "card_unlocked_material_cement",
		sprite 		= "data/ui_gfx/gun_actions/material_cement.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/material_cement_unidentified.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "2,3,4,5,6", -- MATERIAL_BLOOD
		spawn_probability                 = "1,1,1,1,1", -- MATERIAL_BLOOD
		price = 150,
		-- Note( Petri ): 10.7.2019 - removed uses. We have acid trail already
		-- max_uses = 250,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_cement.xml")
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	-- Materials --
	{
		id          = "MATERIAL_CEMENT",
		name 		= "$action_material_cement",
		description = "$actiondesc_material_cement",
		sprite 		= "data/ui_gfx/gun_actions/material_cement.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- MATERIAL_CEMENT
		spawn_probability                 = "", -- MATERIAL_CEMENT
		price = 100,
		mana = 1,
		mana        = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_cement.xml")
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	--[[
	{
		id          = "MATERIAL_LAVA",
		name 		= "$action_material_lava",
		description = "$actiondesc_material_lava",
		sprite 		= "data/ui_gfx/gun_actions/material_lava.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- MATERIAL_LAVA
		spawn_probability                 = "", -- MATERIAL_LAVA
		price = 100,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_lava.xml")
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_GUNPOWDER_EXPLOSIVE",
		name 		= "$action_material_gunpowder_explosive",
		description = "$actiondesc_material_gunpowder_explosive",
		sprite 		= "data/ui_gfx/gun_actions/material_gunpowder_explosive.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- MATERIAL_GUNPOWDER_EXPLOSIVE
		spawn_probability                 = "", -- MATERIAL_GUNPOWDER_EXPLOSIVE
		price = 100,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_gunpowder_explosive.xml")
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_DIRT",
		name 		= "$action_material_dirt",
		description = "$actiondesc_material_dirt",
		sprite 		= "data/ui_gfx/gun_actions/material_dirt.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- MATERIAL_DIRT
		spawn_probability                 = "", -- MATERIAL_DIRT
		price = 100,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/material_dirt.xml")
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "BUILDING_BOARD_WOOD",
		name 		= "$action_building_board_wood",
		description = "$actiondesc_building_board_wood",
		sprite 		= "data/ui_gfx/gun_actions/building_board_wood.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- BUILDING_BOARD_WOOD
		spawn_probability                 = "", -- BUILDING_BOARD_WOOD
		price = 100,
		mana = 1,
		max_uses    = 3,
		custom_uses_logic = true,
		custom_xml_file = "data/entities/misc/custom_cards/action_building_board_wood.xml",
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
		end,
	},
	{
		id          = "BUILDING_BACK_WALL_ROCK",
		name 		= "$action_building_back_wall_rock",
		description = "$actiondesc_building_back_wall_rock",
		sprite 		= "data/ui_gfx/gun_actions/building_back_wall_rock.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- BUILDING_BACK_WALL_ROCK
		spawn_probability                 = "", -- BUILDING_BACK_WALL_ROCK
		price = 100,
		mana = 1,
		max_uses    = 3,
		custom_uses_logic = true,
		custom_xml_file = "data/entities/misc/custom_cards/action_building_back_wall.xml",
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 
		end,
	},
	{
		id          = "BUILDING_PRESSURE_PLATE",
		name 		= "$action_building_pressure_plate",
		description = "$actiondesc_building_pressure_plate",
		sprite 		= "data/ui_gfx/gun_actions/building_pressure_plate.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- BUILDING_PRESSURE_PLATE
		spawn_probability                 = "", -- BUILDING_PRESSURE_PLATE
		price = 100,
		mana = 1,
		max_uses    = 3,
		custom_uses_logic = true,
		custom_xml_file = "data/entities/misc/custom_cards/action_building_pressure_plate.xml",
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
		end,
	},
	{
		id          = "BUILDING_PHYSICS_TEMPLEDOOR",
		name 		= "$action_building_physics_templedoor",
		description = "$actiondesc_building_physics_templedoor",
		sprite 		= "data/ui_gfx/gun_actions/building_physics_templedoor.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "", -- BUILDING_PHYSICS_TEMPLEDOOR
		spawn_probability                 = "", -- BUILDING_PHYSICS_TEMPLEDOOR
		price = 100,
		mana = 1,
		max_uses    = 3,
		custom_uses_logic = true,
		custom_xml_file = "data/entities/misc/custom_cards/action_building_physics_templedoor.xml",
		action 		= function()
			c.fire_rate_wait = c.fire_rate_wait + 0
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
		end,
	},
	]]--
	-- SPELL STUFF
	{
		id          = "TELEPORT_PROJECTILE",
		name 		= "$action_teleport_projectile",
		description = "$actiondesc_teleport_projectile",
		sprite 		= "data/ui_gfx/gun_actions/teleport_projectile.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/teleport_projectile_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,4,5,6", -- TELEPORT_PROJECTILE
		spawn_probability                 = "1,1,1,1,1,1", -- TELEPORT_PROJECTILE
		price = 130,
		mana = 40,
		--max_uses = 80,
		custom_xml_file = "data/entities/misc/custom_cards/teleport_projectile.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/teleport_projectile.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
			c.spread_degrees = c.spread_degrees - 1.0
		end,
	},
	--[[
	{
		id          = "TELEPORT_HOME",
		name 		= "$action_teleport_home",
		description = "$actiondesc_teleport_home",
		sprite 		= "data/ui_gfx/gun_actions/teleport_home.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "", -- TELEPORT_HOME
		spawn_probability                 = "", -- TELEPORT_HOME
		price = 100,
		mana = 70,
		max_uses    = 5,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/teleport_home.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.screenshake = c.screenshake + 5.0
		end,
	},
	{
		id          = "LEVITATION_PROJECTILE",
		name 		= "$action_levitation_projectile",
		description = "$actiondesc_levitation_projectile",
		sprite 		= "data/ui_gfx/gun_actions/levitation_projectile.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "", -- LEVITATION_PROJECTILE
		spawn_probability                        = "", -- LEVITATION_PROJECTILE
		price = 100,
		mana = 80,
		custom_xml_file = "data/entities/misc/custom_cards/levitation_projectile.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/levitation_projectile.xml")
			c.fire_rate_wait = c.fire_rate_wait + 3
			c.screenshake = c.screenshake + 0.5
			c.spread_degrees = c.spread_degrees - 1.0
		end,
	},
	]]--
	-- one shot actions -------------------------
	{
		id          = "NUKE",
		name 		= "$action_nuke",
		description = "$actiondesc_nuke",
		spawn_requires_flag = "card_unlocked_nuke",
		sprite 		= "data/ui_gfx/gun_actions/nuke.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/nuke_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,5,6", -- NUKE
		spawn_probability                 = "1,1,1", -- NUKE
		price = 400,
		mana = 200,
		max_uses    = 1,
		custom_xml_file = "data/entities/misc/custom_cards/nuke.xml",
		action 		= function()
			add_projectile("data/entities/projectiles/deck/nuke.xml")
			c.fire_rate_wait = 20
			c.speed_multiplier = c.speed_multiplier * 0.75
			c.material = "fire"
			c.material_amount = c.material_amount + 60
			c.ragdoll_fx = 2
			c.gore_particles = c.gore_particles + 10
			c.screenshake = c.screenshake + 10.5
			current_reload_time = current_reload_time + 600
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 300.0
		end,
	},
	--[[
	{
		id          = "HIGH_EXPLOSIVE",
		name 		= "$action_high_explosive",
		description = "$actiondesc_high_explosive",
		sprite 		= "data/ui_gfx/gun_actions/high_explosive.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "", -- HIGH_EXPLOSIVE
		spawn_probability                        = "", -- HIGH_EXPLOSIVE
		price = 100,
		max_uses    = 5,
		custom_xml_file = "data/entities/misc/custom_cards/high_explosive.xml",
		action 		= function()
			c.explosion_radius = c.explosion_radius + 64.0
			c.damage_explosion = c.damage_explosion + 3.2
			c.fire_rate_wait   = c.fire_rate_wait + 10
			c.speed_multiplier = c.speed_multiplier * 0.75
			c.ragdoll_fx = 2
			c.explosion_damage_to_materials = c.explosion_damage_to_materials + 300000
		end,
	},
	{
		id          = "DRONE",
		name 		= "$action_drone",
		description = "$actiondesc_drone",
		sprite 		= "data/ui_gfx/gun_actions/drone.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "", -- DRONE
		spawn_probability                        = "", -- DRONE
		price = 100,
		mana = 60,
		max_uses    = 5,
		custom_xml_file = "data/entities/misc/custom_cards/action_drone.xml",
		action 		= function()
			add_projectile("data/entities/misc/player_drone.xml")
			c.fire_rate_wait = c.fire_rate_wait + 60
		end,
	},
	]]--
	-- all is code --------------------------------------
	--[[{
		id          = "BAAB_IS",
		name 		= "$action_baab_is",
		description = "$actiondesc_baab_is",
		sprite 		= "data/ui_gfx/gun_actions/baab_is.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/baab_is.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			baab_instruction( "is" )
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BAAB_ALL",
		name 		= "$action_baab_all",
		description = "$actiondesc_baab_all",
		sprite 		= "data/ui_gfx/gun_actions/baab_all.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/baab_all.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			baab_instruction( "all" )
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BAAB_EMPTY",
		name 		= "$action_baab_empty",
		description = "$actiondesc_baab_empty",
		sprite 		= "data/ui_gfx/gun_actions/baab_empty.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/baab_empty.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			baab_instruction( "empty" )
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BAAB_LAVA",
		name 		= "$action_baab_lava",
		description = "$actiondesc_baab_lava",
		sprite 		= "data/ui_gfx/gun_actions/baab_lava.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/baab_lava.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			baab_instruction( "lava" )
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BAAB_WATER",
		name 		= "$action_baab_water",
		description = "$actiondesc_baab_water",
		sprite 		= "data/ui_gfx/gun_actions/baab_water.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/baab_water.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			baab_instruction( "water" )
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BAAB_POOP",
		name 		= "$action_baab_poop",
		description = "$actiondesc_baab_poop",
		sprite 		= "data/ui_gfx/gun_actions/baab_poop.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/baab_poop.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			baab_instruction( "poo" )
			draw_actions( 1, true )
		end,
	},
	{
		id          = "BAAB_LOVE",
		name 		= "$action_baab_love",
		description = "$actiondesc_baab_love",
		sprite 		= "data/ui_gfx/gun_actions/baab_love.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/baab_love.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6", -- BURST_2
		spawn_probability                 = "1,1,1,1,1,1,1", -- BURST_2
		price = 140,
		mana = 0,
		--max_uses = 100,
		action 		= function()
			baab_instruction( "magic_liquid_charm" )
			draw_actions( 1, true )
		end,
	},]]--
	{
		id          = "FIREWORK",
		name 		= "$action_firework",
		description = "$actiondesc_firework",
		spawn_requires_flag = "card_unlocked_firework",
		sprite 		= "data/ui_gfx/gun_actions/fireworks.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/rocket_unidentified.png",
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,2,3,4,5,6", -- ROCKET
		spawn_probability                 = "1,1,1,1,1,1", -- ROCKET
		price = 220,
		mana = 70,
		max_uses    = 20, 
		action 		= function()
			local types = {"pink","green","blue","orange"}
			local rnd = math.random(1, #types)
			local firework_name = "firework_" .. tostring(types[rnd]) .. ".xml"
			add_projectile("data/entities/projectiles/deck/fireworks/" .. firework_name)
			c.fire_rate_wait = c.fire_rate_wait + 60
			--current_reload_time = current_reload_time + 40
			c.ragdoll_fx = 2
			shot_effects.recoil_knockback = 120.0
		end,
	},
}
