extra_modifiers = 
{
	critical_hit_boost = function()
		c.damage_critical_chance = c.damage_critical_chance + 5
	end,

	damage_projectile_boost = function()
		c.damage_projectile_mul = c.damage_projectile_mul + 0.5
	end,

	game_effect_freeze = function()
		c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_frozen.xml,"
	end,
	
	extra_knockback = function()
		c.knockback_force = c.knockback_force + 6
	end,
	
	lower_spread = function()
		c.spread_degrees = c.spread_degrees - 15
		c.speed_multiplier = c.speed_multiplier * 1.2
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 50.0
	end,
	
	bounce = function()
		c.bounces = c.bounces + 3
	end,
	
	projectile_homing_shooter = function()
		c.extra_entities = c.extra_entities .. "data/entities/misc/perks/projectile_homing_shooter.xml"
	end,
}
