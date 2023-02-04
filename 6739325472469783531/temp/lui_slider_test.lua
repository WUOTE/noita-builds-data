-- Hello world --

id = LUI_LoadSprite( "data/ui_gfx/inventory_box.xml" )

LUI_SpriteMoveTo( id, 200, 100 )
LUI_SpriteSetScale( id, 1.0, 1.0 )
LUI_SpriteSetRotation( id, 0.9 )
LUI_SpriteSetAlpha( id, 1.0 )
-- LUI_SpriteSetColor( id, 1.0, 0.2, 0.75 )
LUI_SpritePlayRectAnimation( id, "mouse_out" )

LUI_LoadSlider( "data/temp/berry_bush.png", 10, 95, 100, 95 )

LUI_SetCallbacks( "OnMouseOver", "OnMouseOver" )
LUI_SetCallbacks( "OnSliderTo", "OnSliderTo" )
LUI_SetCallbacks( "OnSliderEnd", "OnSliderEnd" )

function OnSliderTo( id, value )
	-- print( id, value )
end

function OnSliderEnd( id, value )
	-- print( "End", id, value )
end

function OnMouseOver( id )
	-- print( "MouseOver", id )
end