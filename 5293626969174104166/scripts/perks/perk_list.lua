STACKABLE_MAX_AMOUNT = 999

perk_list =
{
	-- TODO: stackable perks (separate stackable perks)
	-- TODO: stackable perks (separate stackable perks)
	-- VARIOUS
	{
		id = "CRITICAL_HIT",
		ui_name = "$perk_critical_hit",
		ui_description = "$perkdesc_critical_hit",
		ui_icon = "data/ui_gfx/perk_icons/critical_hit.png",
		perk_icon = "data/items_gfx/perks/critical_hit.png",
		game_effect = "CRITICAL_HIT_BOOST",
		stackable = STACKABLE_MAX_AMOUNT,
	},
	{
		id = "BREATH_UNDERWATER",
		ui_name = "$perk_breath_underwater",
		ui_description = "$perkdesc_breath_underwater",
		ui_icon = "data/ui_gfx/perk_icons/breath_underwater.png",
		perk_icon = "data/items_gfx/perks/breath_underwater.png",
		game_effect = "BREATH_UNDERWATER",
	},
	{
		id = "EXTRA_MONEY",
		ui_name = "$perk_extra_money",
		ui_description = "$perkdesc_extra_money",
		ui_icon = "data/ui_gfx/perk_icons/extra_money.png",
		perk_icon = "data/items_gfx/perks/extra_money.png",
		game_effect = "EXTRA_MONEY",
		stackable = STACKABLE_MAX_AMOUNT,
	},
	{
		id = "EXTRA_MONEY_TRICK_KILL",
		ui_name = "$perk_extra_money_trick_kill",
		ui_description = "$perkdesc_extra_money_trick_kill",
		ui_icon = "data/ui_gfx/perk_icons/extra_money_trick_kill.png",
		perk_icon = "data/items_gfx/perks/extra_money_trick_kill.png",
		game_effect = "EXTRA_MONEY_TRICK_KILL",
		stackable = STACKABLE_MAX_AMOUNT,
	},
	{
		id = "HOVER_BOOST",
		ui_name = "$perk_hover_boost",
		ui_description = "$perkdesc_hover_boost",
		ui_icon = "data/ui_gfx/perk_icons/hover_boost.png",
		perk_icon = "data/items_gfx/perks/hover_boost.png",
		game_effect = "HOVER_BOOST",
		stackable = STACKABLE_MAX_AMOUNT,
	},
	{
		id = "MOVEMENT_FASTER",
		ui_name = "$perk_movement_faster",
		ui_description = "$perkdesc_movement_faster",
		ui_icon = "data/ui_gfx/perk_icons/movement_faster.png",
		perk_icon = "data/items_gfx/perks/movement_faster.png",
		game_effect = "MOVEMENT_FASTER",
		stackable = STACKABLE_MAX_AMOUNT,
	},
	{
		id = "LOW_GRAVITY",
		ui_name = "$perk_low_gravity",
		ui_description = "$perkdesc_low_gravity",
		ui_icon = "data/ui_gfx/perk_icons/low_gravity.png",
		perk_icon = "data/items_gfx/perks/low_gravity.png",
		stackable = STACKABLE_MAX_AMOUNT,
		func = function( entity_perk_item, entity_who_picked, item_name )

			local models = EntityGetComponent( entity_who_picked, "CharacterPlatformingComponent" )
			if( models ~= nil ) then
				for i,model in ipairs(models) do
					local gravity = tonumber( ComponentGetValue( model, "pixel_gravity" ) ) * 0.4
					ComponentSetValue( model, "pixel_gravity", gravity )
				end
			end

		end,
	},
	{
		id = "REPELLING_CAPE",
		ui_name = "$perk_repelling_cape",
		ui_description = "$perkdesc_repelling_cape",
		ui_icon = "data/ui_gfx/perk_icons/repelling_cape.png",
		perk_icon = "data/items_gfx/perks/repelling_cape.png",
		game_effect = "STAINS_DROP_FASTER",
	},
	{
		id = "EXPLODING_CORPSES",
		ui_name = "$perk_exploding_corpses",
		ui_description = "$perkdesc_exploding_corpses",
		ui_icon = "data/ui_gfx/perk_icons/exploding_corpses.png",
		perk_icon = "data/items_gfx/perks/exploding_corpses.png",
		game_effect = "EXPLODING_CORPSE_SHOTS",
	},
	{
		id = "SAVING_GRACE",
		ui_name = "$perk_saving_grace",
		ui_description = "$perkdesc_saving_grace",
		ui_icon = "data/ui_gfx/perk_icons/saving_grace.png",
		perk_icon = "data/items_gfx/perks/saving_grace.png",
		game_effect = "SAVING_GRACE",
	},
	{
		id = "INVISIBILITY",
		ui_name = "$perk_invisibility",
		ui_description = "$perkdesc_invisibility",
		ui_icon = "data/ui_gfx/perk_icons/invisibility.png",
		perk_icon = "data/items_gfx/perks/invisibility.png",
		game_effect = "INVISIBILITY",
	},
	{
		id = "GLOBAL_GORE",
		ui_name = "$perk_global_gore",
		ui_description = "$perkdesc_global_gore",
		ui_icon = "data/ui_gfx/perk_icons/global_gore.png",
		perk_icon = "data/items_gfx/perks/global_gore.png",
		game_effect = "GLOBAL_GORE",
		stackable = STACKABLE_MAX_AMOUNT,
	},
	--[[
	-- NOTE( Petri ): Removed NO_DAMAGE_FLASH, because its not really a useful perk
	{
		id = "NO_DAMAGE_FLASH",
		ui_name = "$perk_no_damage_flash",
		ui_description = "$perkdesc_no_damage_flash",
		ui_icon = "data/ui_gfx/perk_icons/no_damage_flash.png",
		perk_icon = "data/items_gfx/perks/no_damage_flash.png",
		game_effect = "NO_DAMAGE_FLASH",
	},
	]]--
	--[[{
		id = "REVERSE_SLOWDOWN",
		ui_name = "$perk_reverse_slowdown",
		ui_description = "$perkdesc_reverse_slowdown",
		ui_icon = "data/ui_gfx/material_indicators/hp_regeneration.png",
		game_effect = "MOVEMENT_REVERSE_SLOWDOWN",
	},]]--

	
	-- HP AFFECTORS
	{
		id = "VAMPIRISM",
		ui_name = "$perk_vampirism",
		ui_description = "$perkdesc_vampirism",
		ui_icon = "data/ui_gfx/perk_icons/vampirism.png",
		perk_icon = "data/items_gfx/perks/vampirism.png",
		game_effect = "HEALING_BLOOD",
		func = function( entity_perk_item, entity_who_picked, item_name )

			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local hp = tonumber( ComponentGetValue( damagemodel, "hp" ) )
					local max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) ) / 3 * 2

					max_hp = math.ceil( max_hp * 25 ) / 25
					
					ComponentSetValue( damagemodel, "hp", math.min( hp, max_hp ) )
					ComponentSetValue( damagemodel, "max_hp", max_hp )
				end
			end

		end,
	},
	{
		id = "EXTRA_HP",
		ui_name = "$perk_extra_hp",
		ui_description = "$perkdesc_extra_hp",
		ui_icon = "data/ui_gfx/perk_icons/extra_hp.png",
		perk_icon = "data/items_gfx/perks/extra_hp.png",
		stackable = STACKABLE_MAX_AMOUNT,
		func = function( entity_perk_item, entity_who_picked, item_name )

			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) ) * 1.5
					local max_hp_cap = tonumber( ComponentGetValue( damagemodel, "max_hp_cap" ) )
					if max_hp_cap > 0 then
						max_hp = math.min( max_hp, max_hp_cap )
					end
					
					ComponentSetValue( damagemodel, "max_hp", max_hp )
					ComponentSetValue( damagemodel, "hp", max_hp )
				end
			end

		end,
	},
	--[[
	{
		id = "DOUBLE_HP",
		ui_name = "$perk_double_hp",
		ui_description = "$perkdesc_double_hp",
		ui_icon = "data/ui_gfx/perk_icons/double_hp.png",
		perk_icon = "data/items_gfx/perks/double_hp.png",
		--game_effect = "CANNOT_HEAL",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO increase player damage taken (or implement CANNOT_HEAL)
			
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) ) * 2
					local max_hp_cap = tonumber( ComponentGetValue( damagemodel, "max_hp_cap" ) )
					if max_hp_cap > 0 then
						max_hp = math.min( max_hp, max_hp_cap )
					end
					
					ComponentSetValue( damagemodel, "max_hp", max_hp )
					ComponentSetValue( damagemodel, "hp", max_hp )
				end
			end
			
		end,
	},
	]]--
	{
		id = "HEARTS_MORE_EXTRA_HP",
		ui_name = "$perk_hearts_more_extra_hp",
		ui_description = "$perkdesc_hearts_more_extra_hp",
		ui_icon = "data/ui_gfx/perk_icons/hearts_more_extra_hp.png",
		perk_icon = "data/items_gfx/perks/hearts_more_extra_hp.png",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO heart containers give 2x more health
			EntityAddComponent( entity_who_picked, "VariableStorageComponent", 
			{ 
				name = "hearts_more_extra_hp",
				value_int = 2,
			} )
		end,
	},
	{
		id = "GLASS_CANNON",
		ui_name = "$perk_glass_cannon",
		ui_description = "$perkdesc_glass_cannon",
		ui_icon = "data/ui_gfx/perk_icons/glass_cannon.png",
		perk_icon = "data/items_gfx/perks/glass_cannon.png",
		game_effect = "DAMAGE_MULTIPLIER",
		func = function( entity_perk_item, entity_who_picked, item_name )

			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local hp = tonumber( ComponentGetValue( damagemodel, "hp" ) )
					local max_hp = 50 / 25
					
					--ComponentSetValue( damagemodel, "hp", math.min( hp, max_hp ) )
					ComponentSetValue( damagemodel, "max_hp", max_hp )
					ComponentSetValue( damagemodel, "max_hp_cap", max_hp )
					ComponentSetValue( damagemodel, "hp", max_hp )
				end
			end

		end,
	},
	{
		id = "RESPAWN",
		ui_name = "$perk_respawn",
		ui_description = "$perkdesc_respawn",
		ui_icon = "data/ui_gfx/perk_icons/respawn.png",
		perk_icon = "data/items_gfx/perks/respawn.png",
		game_effect = "RESPAWN",
	},

	-- RESISTANCE AFFECTORS
	{
		id = "PROTECTION_FIRE",
		ui_name = "$perk_protection_fire",
		ui_description = "$perkdesc_protection_fire",
		ui_icon = "data/ui_gfx/perk_icons/protection_fire.png",
		perk_icon = "data/items_gfx/perks/protection_fire.png",
		game_effect = "PROTECTION_FIRE",
	},
	{
		id = "PROTECTION_RADIOACTIVITY",
		ui_name = "$perk_protection_radioactivity",
		ui_description = "$perkdesc_protection_radioactivity",
		ui_icon = "data/ui_gfx/perk_icons/protection_radioactivity.png",
		perk_icon = "data/items_gfx/perks/protection_radioactivity.png",
		game_effect = "PROTECTION_RADIOACTIVITY",
	},
	{
		id = "PROTECTION_EXPLOSION",
		ui_name = "$perk_protection_explosion",
		ui_description = "$perkdesc_protection_explosion",
		ui_icon = "data/ui_gfx/perk_icons/protection_explosion.png",
		perk_icon = "data/items_gfx/perks/protection_explosion.png",
		game_effect = "PROTECTION_EXPLOSION",
	},
	{
		id = "PROTECTION_MELEE",
		ui_name = "$perk_protection_melee",
		ui_description = "$perkdesc_protection_melee",
		ui_icon = "data/ui_gfx/perk_icons/protection_melee.png",
		perk_icon = "data/items_gfx/perks/protection_melee.png",
		game_effect = "PROTECTION_MELEE",
	},
	{
		id = "PROTECTION_ELECTRICITY",
		ui_name = "$perk_protection_electricity",
		ui_description = "$perkdesc_protection_electricity",
		ui_icon = "data/ui_gfx/perk_icons/protection_electricity.png",
		perk_icon = "data/items_gfx/perks/protection_electricity.png",
		game_effect = "PROTECTION_ELECTRICITY",
	},
	-- PROTECTION ACID
	-- PROTECTION FREEZE
	{
		id = "TELEPORTITIS",
		ui_name = "$perk_teleportitis",
		ui_description = "$perkdesc_teleportitis", -- TODO "and gain a shield for a short duration."
		ui_icon = "data/ui_gfx/perk_icons/teleportitis.png",
		perk_icon = "data/items_gfx/perks/teleportitis.png",
		game_effect = "TELEPORTITIS",
	},
	{
		id = "STAINLESS_ARMOUR",
		ui_name = "$perk_stainless_armour",
		ui_description = "$perkdesc_stainless_armour",
		ui_icon = "data/ui_gfx/perk_icons/stainless_armour.png",
		perk_icon = "data/items_gfx/perks/stainless_armour.png",
		game_effect = "STAINLESS_ARMOUR",
	},

	-- WAND & ACTION AFFECTORS
	{
		id = "EDIT_WANDS_EVERYWHERE",
		ui_name = "$perk_edit_wands_everywhere",
		ui_description = "$perkdesc_edit_wands_everywhere",
		ui_icon = "data/ui_gfx/perk_icons/edit_wands_everywhere.png",
		perk_icon = "data/items_gfx/perks/edit_wands_everywhere.png",
		game_effect = "EDIT_WANDS_EVERYWHERE",
	},
	{
		id = "ABILITY_ACTIONS_MATERIALIZED",
		ui_name = "$perk_ability_actions_materialized",
		ui_description = "$perkdesc_ability_actions_materialized",
		ui_icon = "data/ui_gfx/perk_icons/ability_actions_materialized.png",
		perk_icon = "data/items_gfx/perks/ability_actions_materialized.png",
		game_effect = "ABILITY_ACTIONS_MATERIALIZED",
	},
	{
		id = "PROJECTILE_HOMING",
		ui_name = "$perk_projectile_homing",
		ui_description = "$perkdesc_projectile_homing",
		ui_icon = "data/ui_gfx/perk_icons/projectile_homing.png",
		perk_icon = "data/items_gfx/perks/projectile_homing.png",
		game_effect = "PROJECTILE_HOMING",
	},
	
	-- PLAYER EFFECTS
	
	{
		id = "FREEZE_FIELD",
		ui_name = "$perk_freeze_field",
		ui_description = "$perkdesc_freeze_field",
		ui_icon = "data/ui_gfx/perk_icons/freeze_field.png",
		perk_icon = "data/items_gfx/perks/freeze_field.png",
		game_effect = "PROTECTION_FIRE",
		func = function( entity_perk_item, entity_who_picked, item_name )
		
			local x,y = EntityGetTransform( entity_who_picked )
			local child_id = EntityLoad( "data/entities/misc/perks/freeze_field.xml", x, y )
			EntityAddChild( entity_who_picked, child_id )
				
		end,
	},
	{
		id = "DISSOLVE_POWDERS",
		ui_name = "$perk_dissolve_powders",
		ui_description = "$perkdesc_dissolve_powders",
		ui_icon = "data/ui_gfx/perk_icons/dissolve_powders.png",
		perk_icon = "data/items_gfx/perks/dissolve_powders.png",
		func = function( entity_perk_item, entity_who_picked, item_name )
		
			local x,y = EntityGetTransform( entity_who_picked )
			local child_id = EntityLoad( "data/entities/misc/perks/dissolve_powders.xml", x, y )
			EntityAddChild( entity_who_picked, child_id )
				
		end,
	},
	{
		id = "BLEED_SLIME",
		ui_name = "$perk_bleed_slime",
		ui_description = "$perkdesc_bleed_slime",
		ui_icon = "data/ui_gfx/perk_icons/slime_blood.png",
		perk_icon = "data/items_gfx/perks/slime_blood.png",
		func = function( entity_perk_item, entity_who_picked, item_name )
		
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					ComponentSetValue( damagemodel, "blood_material", "slime" )
					ComponentSetValue( damagemodel, "blood_spray_material", "slime" )
					ComponentSetValue( damagemodel, "blood_multiplier", "3.0" )
					ComponentSetValue( damagemodel, "blood_sprite_directional", "data/particles/bloodsplatters/bloodsplatter_directional_purple_$[1-3].xml" )
					ComponentSetValue( damagemodel, "blood_sprite_large", "data/particles/bloodsplatters/bloodsplatter_purple_$[1-3].xml" )
					
					local projectile_resistance = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "projectile" ))
					projectile_resistance = projectile_resistance * 0.6
					ComponentObjectSetValue( damagemodel, "damage_multipliers", "projectile", tostring(projectile_resistance) )
				end
			end
			
		end,
	},
	{
		id = "SHIELD",
		ui_name = "$perk_shield",
		ui_description = "$perkdesc_shield",
		ui_icon = "data/ui_gfx/perk_icons/shield.png",
		perk_icon = "data/items_gfx/perks/shield.png",
		func = function( entity_perk_item, entity_who_picked, item_name )
		
			local x,y = EntityGetTransform( entity_who_picked )
			local child_id = EntityLoad( "data/entities/misc/perks/shield.xml", x, y )
			EntityAddChild( entity_who_picked, child_id )
				
		end,
	},
	{
		id = "REVENGE_EXPLOSION",
		ui_name = "$perk_revenge_explosion",
		ui_description = "$perkdesc_revenge_explosion",
		ui_icon = "data/ui_gfx/perk_icons/revenge_explosion.png",
		perk_icon = "data/items_gfx/perks/revenge_explosion.png",
		func = function( entity_perk_item, entity_who_picked, item_name )
		
			EntityAddComponent( entity_who_picked, "LuaComponent", 
			{ 
				script_damage_received = "data/scripts/perks/revenge_explosion.lua",
				execute_every_n_frame = "-1",
			} )
							
		end,
	},
	{
		id = "ELECTRICITY",
		ui_name = "$perk_electricity",
		ui_description = "$perkdesc_electricity",
		ui_icon = "data/ui_gfx/perk_icons/electricity.png",
		perk_icon = "data/items_gfx/perks/electricity.png",
		game_effect = "PROTECTION_ELECTRICITY",
		func = function( entity_perk_item, entity_who_picked, item_name )
		
			local x,y = EntityGetTransform( entity_who_picked )
			local child_id = EntityLoad( "data/entities/misc/perks/electricity.xml", x, y )
			EntityAddChild( entity_who_picked, child_id )
				
		end,
	},

	-- SECRET
	{
		id = "MYSTERY_EGGPLANT",
		ui_name = "$perk_mystery_eggplant",
		ui_description = "$perkdesc_mystery_eggplant", -- does nothing
		ui_icon = "data/ui_gfx/material_indicators/hp_regeneration.png",
		perk_icon = "data/items_gfx/perks/mystery_eggplant.png",
		not_in_default_perk_pool = true, -- if set, this perk only materializes when manually spawned, e.g. when calling spawn_perk("MYSTERY_EGGPLANT") somewhere
	},

	-- GOLD + HP
	--[[
	{
		id = "BLOOD_MONEY",
		ui_name = "$perk_blood_money",
		ui_description = "$perkdesc_blood_money",
		ui_icon = "data/ui_gfx/perk_icons/blood_money.png",
		perk_icon = "data/items_gfx/perks/blood_money.png",
		game_effect = "BLOOD_MONEY",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO gold value / 2 , but gain little hp +2 from picking up gold
		end,
	},

	{
		id = "TRICK_BLOOD_MONEY",
		ui_name = "$perk_trick_blood_money",
		ui_description = "$perkdesc_trick_blood_money",
		ui_icon = "data/ui_gfx/perk_icons/trick_blood_money.png",
		perk_icon = "data/items_gfx/perks/trick_blood_money.png",
		game_effect = "TRICK_BLOOD_MONEY",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO trick gold, drops blood gold which gives back hp+3
		end,
	},

	-- CRITICALS
	{
		id = "CRITS_2X_DAMAGE",
		ui_name = "$perk_crits_2x_damage",
		ui_description = "$perkdesc_crits_2x_damage",
		ui_icon = "data/ui_gfx/perk_icons/crits_2x_damage.png",
		perk_icon = "data/items_gfx/perks/crits_2x_damage.png",
		game_effect = "CRITS_2X_DAMAGE",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO crits do 2x more damage, so normally its now 5x and then it would be 10x. Probably should tweak to 4x and 8x
		end,
	},

	-- HP AFFECTORS

	-- RESISTANCE AFFECTORS
	{
		id = "GAS_FIRE",
		ui_name = "$perk_gas_fire",
		ui_description = "$perkdesc_gas_fire",
	},

	-- WAND & ACTION AFFECTORS
	{
		id = "SPELL_DUPLICATION",
		ui_name = "$perk_spell_duplication",
		ui_description = "$perkdesc_spell_duplication",
	},
	{
		id = "FASTER_WANDS",
		ui_name = "$perk_faster_wands",
		ui_description = "$perkdesc_faster_wands",
	},
	{
		id = "BOUNCE",
		ui_name = "$perk_bounce",
		ui_description = "$perkdesc_bounce",
	},
	{
		id = "BERSERK",
		ui_name = "$perk_berserk",
		ui_description = "$perkdesc_berserk",
	},

	-- WAND & ACTION SHUFFLERS and SPAWNERS
	{
		id = "SHUFFLE_WANDS",
		ui_name = "$perk_shuffle_wands",
		ui_description = "$perkdesc_shuffle_wands",
	},
	{
		id = "ALWAYS_CAST",
		ui_name = "$perk_always_cast",
		ui_description = "$perkdesc_always_cast",
	},
	{
		id = "HEAVY_AMMO",
		ui_name = "$perk_heavy_ammo",
		ui_description = "$perkdesc_heavy_ammo", -- Nuke, Holy_grenade
	},
	-- PERKS
	{
		id = "ROLL_AGAIN",
		ui_name = "$perk_roll_again",
		ui_description = "$perkdesc_roll_again",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO: code that replaces the perks with a new set 
		end,
	},
	--]]
	{
		id = "EXTRA_PERK",
		ui_name = "$perk_extra_perk",
		ui_description = "$perkdesc_extra_perk",
		ui_icon = "data/ui_gfx/perk_icons/extra_perk.png",
		perk_icon = "data/items_gfx/perks/extra_perk.png",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO - this should work - seems to work
			local perk_count = tonumber( GlobalsGetValue( "TEMPLE_PERK_COUNT", "3" ) )
			perk_count = perk_count + 1
			GlobalsSetValue( "TEMPLE_PERK_COUNT", to_string(perk_count) )
		end,
	},
	{
		id = "PERKS_LOTTERY",
		ui_name = "$perk_perks_lottery",
		ui_description = "$perkdesc_perks_lottery",
		ui_icon = "data/ui_gfx/perk_icons/perks_lottery.png",
		perk_icon = "data/items_gfx/perks/perks_lottery.png",
		-- when picking up a perk, there's 50% chance less (instead of 100%) of other perks disappearing
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO - this should work - seems to work
			local perk_destroy_chance = tonumber( GlobalsGetValue( "TEMPLE_PERK_DESTROY_CHANCE", "100" ) )
			perk_destroy_chance = perk_destroy_chance / 2
			GlobalsSetValue( "TEMPLE_PERK_DESTROY_CHANCE", to_string(perk_destroy_chance) )
		end,
	},
	-- GENOME RELATIONS
	{
		id = "GENOME_MORE_HATRED",
		ui_name = "$perk_genome_more_hatred",
		ui_description = "$perkdesc_genome_more_hatred",
		ui_icon = "data/ui_gfx/perk_icons/genome_more_hatred.png",
		perk_icon = "data/items_gfx/perks/genome_more_hatred.png",
		-- enemies hate each other more by 25%
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO - impl
			local world_entity_id = GameGetWorldStateEntity()
			if( world_entity_id ~= nil ) then
				local comp_worldstate = EntityGetFirstComponent( world_entity_id, "WorldStateComponent" )
				if( comp_worldstate ~= nil ) then
					local global_genome_relations_modifier = tonumber( ComponentGetValue( comp_worldstate, "global_genome_relations_modifier" ) )
					global_genome_relations_modifier = global_genome_relations_modifier - 25
					ComponentSetValue( comp_worldstate, "global_genome_relations_modifier", tostring( global_genome_relations_modifier ) )
				end
			end

		end,
	},
	{
		id = "GENOME_MORE_LOVE",
		ui_name = "$perk_genome_more_love",
		ui_description = "$perkdesc_genome_more_love",
		ui_icon = "data/ui_gfx/perk_icons/genome_more_love.png",
		perk_icon = "data/items_gfx/perks/genome_more_love.png",
		-- enemies love each other more by 25%
		func = function( entity_perk_item, entity_who_picked, item_name )
			local world_entity_id = GameGetWorldStateEntity()
			if( world_entity_id ~= nil ) then
				local comp_worldstate = EntityGetFirstComponent( world_entity_id, "WorldStateComponent" )
				if( comp_worldstate ~= nil ) then
					local global_genome_relations_modifier = tonumber( ComponentGetValue( comp_worldstate, "global_genome_relations_modifier" ) )
					global_genome_relations_modifier = global_genome_relations_modifier + 25
					ComponentSetValue( comp_worldstate, "global_genome_relations_modifier", tostring( global_genome_relations_modifier ) )
				end
			end
		end,
	},
	--[[
	{
		id = "GENOME_RANDOM_ALLIES",
		ui_name = "$perk_random_allies",
		ui_description = "$perkdesc_random_allies",
		ui_icon = "data/ui_gfx/perk_icons/random_allies.png",
		perk_icon = "data/items_gfx/perks/random_allies.png",
		-- player changed herd_id to a random herd_id
		func = function( entity_perk_item, entity_who_picked, item_name )
			if( entity_who_picked ~= nil and entity_perk_item ~= nil ) then
				local pos_x, pos_y = EntityGetTransform( entity_item )
				local random_herds = { "slimes", "robot", "fire", "orcs", "rat", "electricity", "worm,", "zombie", "mage" }

				SetRandomSeed( pos_x, pos_y )
				local new_herd = random_herds[ Random( #random_herds ) ]

				GenomeSetHerdId( entity_who_picked, new_herd )
			end
		end,
	}
	]]--
	-- HEALTHIUM POTION
	-- KNOCKBACK

	--
	--[[

	------------------
	{
		id = "LIQUID_MOVEMENT",
		ui_name = "$perk_liquid_movement",
		ui_description = "$perkdesc_liquid_movement",
	},
	{
		id = "FASTER_SWIMMING",
		ui_name = "$perk_faster_swimming",
		ui_description = "$perkdesc_faster_swimming",
	},
	{
		id = "EXTRA_SHOP_ITEM",
		ui_name = "$perk_extra_shop_item",
		ui_description = "$perkdesc_extra_shop_item",
		func = function( entity_perk_item, entity_who_picked, item_name )
			-- TODO: this should work
			local shop_item_count = tonumber( GlobalsGetValue( "TEMPLE_SHOP_ITEM_COUNT", "5" ) )
			shop_item_count = shop_item_count + 1
			GlobalsSetValue( "TEMPLE_SHOP_ITEM_COUNT", to_string(shop_item_count) )
		end,

		
	},
	{
		id = "SHOP_IS_FREE",
		ui_name = "$perk_shop_is_free",
		ui_description = "$perkdesc_shop_is_free",
	},
	{
		id = "POISON_BURN",
		ui_name = "$perk_poison_burn",
		ui_description = "$perkdesc_poison_burn",
	},
	{
		-- durability is less by 1
		id = "DESTRUCTION_ENHANCEMENT",
		ui_name = "$perk_destruction_enhancement",
		ui_description = "$perkdesc_destruction_enhancement",
	},
	{
		id = "DAMAGING_AURA",
		ui_name = "$perk_damaging_aura",
		ui_description = "$perkdesc_damaging_aura",
	},
	{
		id = "THUNDER_KICK",
		ui_name = "$perk_thunder_kick",
		ui_description = "$perkdesc_thunder_kick",
	},
	{
		-- more kick damage
	},
	{
		id = "VISION",
		ui_name = "$perk_vision",
		ui_description = "$perkdesc_vision",
	},
	{
		id = "TELEPATHIC_VISION",
		ui_name = "$perk_telepathic_vision",
		ui_description = "$perkdesc_telepathic_vision",
	},
	{
		id = "NO_MORE_KNOCKBACK",
		ui_name = "$perk_no_more_knockback",
		ui_description = "$perkdesc_no_more_knockback",
	},
	{
		id = "KNOCKBACK_CONTROL",
		ui_name = "$perk_knockback_control",
		ui_description = "$perkdesc_knockback_control",
	},
	{
		id = "REVEAL_SECRETS",
		ui_name = "$perk_reveal_secrets",
		ui_description = "$perkdesc_reveal_secrets",
	},
	{
		id = "POTION_DROP",
		ui_name = "$perk_potion_drop",
		ui_description = "$perkdesc_potion_drop",
	},
	{
		id = "MYSTERY_EGG",
		ui_name = "$perk_mystery_egg",
		ui_description = "$perkdesc_mystery_egg", -- spawnaa ison madon
	},
	{
		id = "GOLD_NO_DISAPPEAR_WHILE_SEEN",
		ui_name = "$perk_gold_no_disappear_while_seen",
		ui_description = "$perkdesc_gold_no_disappear_while_seen"
		ui_icon = "data/ui_gfx/material_indicators/hp_regeneration.png",
		game_effect = "GOLD_NO_DISAPPEAR_WHILE_SEEN",
	},
	{
		id = "GOLD_STAY_FOREVER",
		ui_name = "$perk_gold_stay_forever",
		ui_description = "$perkdesc_gold_stay_forever"
		-- Gold nuggets never go away
	},
	{
		id = "MANA_DISCOUNT",
		ui_name = "$perk_mana_discount",
		ui_description = "$perkdesc_mana_discount"
	},
	{
		id = "JUGGERNAUT",
		ui_name = "$perk_juggernaut",
		ui_description = "$perkdesc_juggernaut"
	},
	{
		id = "BIG_POTIONS",
		ui_name = "$perk_big_potions",
		ui_description = "$perkdesc_big_potions"
	},
	{
		id = "EXTRA_CHARGES",
		ui_name = "$perk_extra_charges",
		ui_description = "$perkdesc_extra_charges"
	},
	{
		id = "FAST_PROJECTILES",
		ui_name = "$perk_fast_projectiles",
		ui_description = "$perkdesc_fast_projectiles"
	},
	{
		id = "DEADLY_ENVIRONMENT",
		ui_name = "$perk_deadly_environment",
		ui_description = "$perkdesc_deadly_environment"
	},
	{
		id = "CURSED_POWER",
		ui_name = "$perk_cursed_power",
		ui_description = "$perkdesc_cursed_power"
	},
	{
		id = "GOLD_ATTRACTION",
		ui_name = "$perk_gold_attraction",
		ui_description = "$perkdesc_gold_attraction"
		-- Gold nuggets float towards player when nearby
	},
	]]--
	--[[
	FEATURE CREEP
	{
		id = "RANDOMIZE_SPELLS",
		ui_name = "$perk_randomize_spells",
		ui_description = "$perkdesc_randomize_spells"
	},
	{
		id = "PERSONAL_RAINCLOUD",
		ui_name = "$perk_personal_raincloud",
		ui_description = "$perkdesc_personal_raincloud"
	},
	{
		id = "HELPER_ORB",
		ui_name = "$perk_helper_orb",
		ui_description = "$perkdesc_helper_orb",
	},
	{
		id = "EXTRA_WAND_SLOT",
		ui_name = "$perk_extra_wand_slot",
		ui_description = "$perkdesc_extra_wand_slot",
	},
	{
		id = "EXTRA_POTION_SLOT",
		ui_name = "$perk_extra_potion_slot",
		ui_description = "$perkdesc_extra_potion_slot",
	},
	{
		id = "EXTRA_ACTION_STORAGE",
		ui_name = "$perk_extra_action_storage",
		ui_description = "$perkdesc_extra_action_storage",
	},
	{
		id = "PERSUASION",
		ui_name = "$perk_persuasion",
		ui_description = "$perkdesc_persuasion",
	},
	{
		id = "PERMANENT_FLYING",
		ui_name = "$perk_permanent_flying",
		ui_description = "$perkdesc_permanent_flying",
	},
	{
		id = "MELT",
		ui_name = "$perk_melt",
		ui_description = "$perkdesc_melt",
	},
	{
		id = "DOUBLE_CAST",
		ui_name = "$perk_double_cast",
		ui_description = "$perkdesc_double_cast",
	},
	]]--
}


function get_perk_with_id( perk_list, perk_id )
	local perk_data = nil
	for i,perk in ipairs(perk_list) do
		if perk.id == perk_id then
			perk_data = perk
			break
		end
	end

	return perk_data
end

function get_perk_picked_flag_name( perk_id )
	return "PERK_PICKED_" .. perk_id
end
