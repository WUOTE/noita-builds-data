-- Hello world --

id = LUI_LoadSprite( "data/ui_gfx/inventory_box.xml" )

LUI_SpriteMoveTo( id, 200, 100 )
LUI_SpriteSetScale( id, 1.0, 1.0 )
LUI_SpriteSetRotation( id, 0.9 )
LUI_SpriteSetAlpha( id, 1.0 )
-- LUI_SpriteSetColor( id, 1.0, 0.2, 0.75 )
LUI_SpritePlayRectAnimation( id, "mouse_out" )

entities = EntityGetWithTag( "all_spells" );
components = EntityGetComponent( entities[1], "GodSpellMetadataComponent" )

spell_ui_entities = EntityGetWithTag( "spell_ui" );
components_spell_selector = EntityGetComponent( spell_ui_entities[1], "GodSpellSelectorComponent" )

print( "Spell_ui_entities: " .. components_spell_selector[1] )

new_spell = ComponentGetValue( components_spell_selector[1], "new_spell" )
print( "new_spell: " .. new_spell )

-- components = EntityGetAllComponents( entities[1] );
for key,value in pairs(components) do 
	spell_name = ComponentGetValue( value, "name")
	ComponentSetValue( components_spell_selector[1], "new_spell", spell_name )
	print( spell_name ) 
	-- members = ComponentGetMembers( value )
	-- for key,value in pairs(members) do 
	--	print( key, value )
	-- end
end

new_spell = ComponentGetValue( components_spell_selector[1], "new_spell" )
print( "new_spell: " .. new_spell )

-- LUI_TweenSpriteTo( id, 500, 500, 7.0, 	"Back::easeInOut" )
-- LUI_TweenSpriteRotationTo( id, 15, 5.0, "PetriHacks::sinGoTo2AndBack" )
-- LUI_TweenSpriteScaleTo( id, 30, 30, 4.0, 	"PetriHacks::dimishingShake" )
-- LUI_TweenSpriteAlphaTo( id, 0.0, 10.0, 	"PetriHacks::randomf" )

for i=1,10 do
	tid = LUI_LoadSprite( "data/ui_gfx/inventory_box.xml" )
	LUI_SpriteMoveTo( tid, 512 - ((10 * 24) * 0.5) + i * 24, 100 )
	-- LUI_TweenSpriteTo( tid, math.random(10, 960), math.random(10, 666), math.random(3,13), 	"Back::easeInOut" )
	LUI_SpritePlayRectAnimation( tid, "mouse_out" )
end

-- no need for mouse_x or mouse_y, since we can get it by calling another function
-- in the cases we really need it. Most of the time we don't even need it
function OnMouseOver( button_id )
	-- print( "OnMouseOver" )
	if button_id > 0 then
		LUI_SpritePlayRectAnimation( button_id, "mouse_over")
		LUI_SpriteSetScale( button_id, 1.1, 1.1 )
	end
end

function OnMouseOut( button_id )
	if button_id > 0 then
		LUI_SpritePlayRectAnimation( button_id, "mouse_out")
		LUI_SpriteSetScale( button_id, 1.0, 1.0 )
	end
end

function OnMouseDown( button_id )
	LUI_TweenSpriteRotationTo( button_id, 15, 2.0, "PetriHacks::sinGoTo2AndBack" )
end

function OnMouseUp( button_id )
	-- body
	print( "OnMouseUp" )
end


