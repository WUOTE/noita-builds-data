dofile( "data/scripts/lib/coroutines.lua" )
dofile( "data/scripts/lib/utilities.lua" )
dofile( "data/scripts/perks/perk.lua")
dofile( "data/scripts/streaming_integration/event_list.lua")
dofile( "data/scripts/biome_modifiers.lua")
dofile_once("data/scripts/streaming_integration/event_utilities.lua")

local gui_frame_fn = nil
local gui = GuiCreate()
local main_menu_items = {}
local destroy = false
local menu_pos_x = 2
local menu_pos_y = 13


function reload_dofile( filename )
	__loaded[filename] = nil -- invalidate cache entry
	dofile( filename )
end

function gui_do_return_button()
	if GuiButton( gui, 0, 0, "Return", 9999999 ) then
		gui_frame_fn = gui_fn_main
	end
end

function gui_do_close_button()
	if GuiButton( gui, 0, 0, "Close", 99999991 ) then
		destroy = true
	end
end

function gui_do_button_list( actions, fn_get_name_from_action, fn_action_clicked )
	local num_actions = #actions
	local hax_btn_id = 123

	local gui_event_button = function( i )
		if GuiButton( gui, 0, 0, fn_get_name_from_action(actions[i]), hax_btn_id+i ) then
			fn_action_clicked( actions[i] )
		end
	end

	-- column 1
	local items_per_column = 30

	GuiLayoutBeginVertical( gui, 22, 13 )
	local starti = 1
	local endi = items_per_column

	for i=starti,endi do
		if i > num_actions then 
			break 
		end

		gui_event_button( i )
	end
	GuiLayoutEnd( gui )

	-- column 2
	GuiLayoutBeginVertical( gui, 48, 13 )
	starti = endi+1
	endi = endi+items_per_column
	for i=starti,endi do
		if i > num_actions then 
			break 
		end

		gui_event_button( i )
	end
	GuiLayoutEnd( gui )

	-- column 3
	GuiLayoutBeginVertical( gui, 74, 13 )
	starti = endi+1
	endi = endi+items_per_column
	for i=starti,endi do
		if i > num_actions then 
			break 
		end

		gui_event_button( i )
	end
	GuiLayoutEnd( gui )

end

function gui_fn_main()
	local hax_btn_id = 123
	
	GuiLayoutBeginVertical( gui, menu_pos_x, menu_pos_y )
	GuiText( gui, 0, 0, "== DEBUG MENU ==" )
	GuiText( gui, 0, 0, "Current biome: " .. DebugBiomeMapGetFilename() )
	GuiText( gui, 0, 0, "---")
	for i,it in ipairs(main_menu_items) do
		if GuiButton( gui, 0, 0, it.ui_name, hax_btn_id ) then
			it.action()
		end
		hax_btn_id = hax_btn_id + 1
	end

	GuiLayoutEnd( gui )
end

function gui_fn_spawn_perk()
	GuiLayoutBeginVertical( gui, menu_pos_x, menu_pos_y )
	GuiText( gui, 0,0, "== Select a perk to spawn ==" )
	GuiText( gui, 0,0, tostring(#perk_list) .. " perks" )
	gui_do_return_button()
	GuiLayoutEnd( gui)

	gui_do_button_list( 
		perk_list, 
		function(item) return item.id end,
		function(item)
			GamePrint( "DEBUG - attempting to spawn " .. item.id .. " at player location" )
			local x, y = GameGetCameraPos()
			local player_entity = EntityGetClosestWithTag( x, y, "player_unit")
			if( player_entity ~= 0 ) then
				x, y = EntityGetTransform( player_entity )
			end
			perk_spawn( x, y - 8, item.id )
		end
	)

end
	
function gui_fn_spawn_streaming_event()
	local run_this_item = nil

	GuiLayoutBeginVertical( gui, menu_pos_x, menu_pos_y )
	GuiText( gui, 0,0, "== Select an event to run ==" )
	if GuiButton( gui, 0, 0, "Reload event_list.lua", 99999999 ) then
		reload_dofile( "data/scripts/streaming_integration/event_list.lua" )
	end

	if GuiButton( gui, 0, 0, "Run all events", 99999998 ) then
		async(function()
			for _,it in ipairs(streaming_events) do
				GamePrint("Running " .. it.ui_name)
				if ( it.action_delayed ~= nil ) then
					if it.delay_timer ~= nil then
						local p = get_players()
						
						if ( #p > 0 ) then
							for a,b in ipairs( p ) do
								add_timer_above_head( b, it.id, it.delay_timer )
							end
						end
					end
					
					wait(10)
				elseif ( it.action ~= nil ) then
					it.action(it)
					wait(10)
				end
			end
		end)
	end

	gui_do_return_button()
	GuiLayoutEnd( gui )

	gui_do_button_list( 
		streaming_events, 
		function(item) return item.ui_name end,
		function(item) run_this_item = item end
	)

	-- reload, run
	if run_this_item ~= nil then
		dofile( "data/scripts/streaming_integration/event_list.lua")
		
		if ( run_this_item.action_delayed ~= nil ) then
			if run_this_item.delay_timer ~= nil then
				local p = get_players()
				
				if ( #p > 0 ) then
					for a,b in ipairs( p ) do
						add_timer_above_head( b, run_this_item.id, run_this_item.delay_timer )
					end
				end
			end
		elseif ( run_this_item.action ~= nil ) then
			run_this_item.action(run_this_item)
		end
	end
end
	
function gui_fn_teleport_to_location()
	local locations = {
		{ui_name = "Starting area", 	x=227, y=-100, },
		{ui_name = "1st Holy Mountain", x=-380, y=1380, },
		{ui_name = "Pyramid", 			x=8900, y=-320, },
		{ui_name = "Frozen vault", 		x=-10000, y=360, },
		{ui_name = "Orb - lava lake", 	x=4354, y=763, },
		{ui_name = "Floating island", 	x=774, y=-1197, },
		{ui_name = "Lake", 				x=-14000, y=140, },
		{ui_name = "---" },
		{ui_name = "excavationsite", 	x=190, y=1500, },
		{ui_name = "snowcave", 			x=190, y=3000, },
		{ui_name = "snowcastle", 		x=190, y=5000, },
		{ui_name = "rainforest", 		x=190, y=6500, },
		{ui_name = "vault", 			x=190, y=8500, },
		{ui_name = "crypt", 			x=190, y=10700, },
		{ui_name = "boss", 				x=3500, y=13060, },
		{ui_name = "ancient laboratory", x=-3150, y=860, },
		{ui_name = "dark altar", 		x=3840, y=15590, },
		{ui_name = "ending #1", 		x=6241, y=15130, },
		{ui_name = "---" },
		{ ui_name ="orb 2", 			x=-10010, y=2827, },
		{ ui_name ="orb 4", 			x=9955, y=2819, },
		{ ui_name ="orb 5", 			x=-4375, y=3867, },
		{ ui_name ="orb 6", 			x=-4859, y=8973, },
		{ ui_name ="orb 7", 			x=4343, y=814, },
		{ ui_name ="orb 8", 			x=-255, y=16147, },
		{ ui_name ="orb 9", 			x=-8957, y=14609, },
		{ ui_name ="orb 10", 			x=10476, y=16148, },

		-- #pyramid
		-- 1, floating island
		-- 3, Nuke 

	}

	GuiLayoutBeginVertical( gui, 2, 11 )
	GuiText( gui, 0,0, "== Select location ==" )
	gui_do_return_button()
	GuiLayoutEnd( gui )

	gui_do_button_list( 
		locations, 
		function(item) return item.ui_name end,
		function(item)
			local player_entity = EntityGetClosestWithTag( 0, 0, "player_unit")
			if player_entity ~= 0 and item.x ~= nil then
				EntitySetTransform( player_entity, item.x, item.y )
			else
				GameSetCameraPos( item.x, item.y )
				-- GamePrint("Can't teleport - player doesn't exist")
			end
		end
	)
end
	
function gui_fn_biome_modifiers()
	GuiLayoutBeginVertical( gui, 2, 11 )
	GuiText( gui, 0,0, "== Select modifier ==" )
	gui_do_return_button()
	GuiLayoutEnd( gui )

	if biome_modifiers == nil then
		return
	end
	gui_do_button_list( 
		biome_modifiers, 
		function(item) return item.ui_description end,
		function(item)
			apply_modifier_to_all_biomes( item.id )
		end
	)
end
	

main_menu_items = 
{
	{
		ui_name="Spawn perk",
		action = function() gui_frame_fn = gui_fn_spawn_perk end
	},
	{
		ui_name="Spawn streaming integration event",
		action = function() gui_frame_fn = gui_fn_spawn_streaming_event end,
	},
	{
		ui_name="Teleport player to location",
		action = function() gui_frame_fn = gui_fn_teleport_to_location end,
	},
	{
		ui_name="Apply biome modifier to all biomes",
		action = function() gui_frame_fn = gui_fn_biome_modifiers end,
	},
	{
		ui_name="Fade out music",
		action = function() GameTriggerMusicFadeOutAndDequeueAll(10) end,
	},
	{
		ui_name="Spawn sampo",
		action = function() 
			local x,y = DEBUG_GetMouseWorld()
			local player_entity = EntityGetClosestWithTag( 0, 0, "player_unit")
			if player_entity ~= 0 then
				x, y = EntityGetTransform( player_entity )
			end
			EntityLoad( "data/entities/animals/boss_centipede/sampo.xml", x, y ) 
		end,
	},
	{
		ui_name="Spawn all emerald tablets",
		action = function() 
			local spacing = 20
			local x,y = DEBUG_GetMouseWorld()
			EntityLoad( "data/entities/items/books/book_00.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_01.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_02.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_03.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_04.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_05.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_06.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_07.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_08.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_10.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_corpse.xml", x,y ) x=x+spacing
			EntityLoad( "data/entities/items/books/book_tree.xml", x,y ) x=x+spacing
		end,
	},
	{
		ui_name="Close",
		action = function() destroy = true end,
	},
}

gui_frame_fn = gui_fn_main


async_loop(function()
	if gui ~= nil then
		GuiStartFrame( gui )
	end

	if gui_frame_fn ~= nil then
		gui_frame_fn()
	end
	
	-----
	if destroy then
		GuiDestroy( gui )
		gui_frame_fn = nil
		gui = nil
		EntityKill( GetUpdatedEntityID() )
	end

	wait(0)
end)
