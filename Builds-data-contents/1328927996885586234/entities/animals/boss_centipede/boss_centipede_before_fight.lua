dofile( "data/scripts/lib/coroutines.lua" )
dofile( "data/scripts/lib/utilities.lua" )

-- animate eyes and skull randomly -----------------

local limb_positions = {}



async_loop(function()
	local x,y = EntityGetTransform( GetUpdatedEntityID() )
	
	local player_nearby = false
	
	local players = EntityGetWithTag( "player_unit" )
	if players ~= nil then
		local player_id = players[1]
		local px,py = EntityGetTransform( player_id )
		local distance = math.abs(py - y) * 0.5 + math.abs(px - x)
		--local direction = 0 - math.atan2(py - y, px - x)
		
		if (distance < 128) then
			player_nearby = true
		end
	end

	local children = EntityGetAllChildren( GetUpdatedEntityID() )

	if children ~= nil then

		for i,it in ipairs(children) do
			if (limb_positions[i] == nil) then
				limb_positions[i] = {x, y}
			end
	
			-- this actually needs to be done only once, not every update
			edit_component( it, "IKLimbWalkerComponent", function(comp,vars)
				EntitySetComponentIsEnabled( it, comp, false )
			end)

			if (math.random(1, 50) == 2) or player_nearby then
				local ox,oy = 0,0

				edit_component( it, "IKLimbComponent", function(comp,vars)
					ox,oy = ComponentGetValueVector2( comp, "end_position")
				end)
			
				ox = ox - x
				oy = oy - y
				
				if (player_nearby == false) then
					ox = math.min(math.max(ox + math.random(-24, 24), -32), 32)
					oy = math.min(math.max(oy + math.random(-48, 80), 32), 100)
				else
					ox = math.cos(i * 30) * 128
					oy = 0 - math.sin(i * 30) * 128
				end

				local nx = x + ox
				local ny = y + oy
				
				limb_positions[i][3] = nx
				limb_positions[i][4] = ny
			end

			local x_source = limb_positions[i][1]
			local y_source = limb_positions[i][2]
			
			local x_target = x_source
			local y_target = y_source

			if( limb_positions[i][3] ~= nil ) then x_target = limb_positions[i][3] end
			if( limb_positions[i][4] ~= nil ) then y_target = limb_positions[i][4] end

			local x_interpolation = (x_target - x_source) * 0.2
			local y_interpolation = (y_target - y_source) * 0.2
			
			limb_positions[i][1] = x_source + x_interpolation
			limb_positions[i][2] = y_source + y_interpolation

			edit_component( it, "IKLimbComponent", function(comp,vars)
				ComponentSetValueVector2( comp, "end_position", x_source + x_interpolation, y_source + y_interpolation )
			end)

		end
	end

	wait(0)
end)