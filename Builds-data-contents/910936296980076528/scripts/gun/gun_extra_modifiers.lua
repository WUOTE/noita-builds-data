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
}
