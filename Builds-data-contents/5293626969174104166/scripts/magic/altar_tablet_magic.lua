dofile( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local tablets = EntityGetWithTag( "tablet" )

if ( tablets ~= nil ) then
	local collected = false
	
	for i,tablet_id in ipairs(tablets) do
		local tx, ty = EntityGetTransform( tablet_id )
		
		local distance = math.abs(x - tx) + math.abs(y - ty)
	
		if ( distance < 32 ) then
			EntityLoad("data/entities/particles/image_emitters/chest_effect.xml", tx, ty)
			EntityConvertToMaterial( tablet_id, "gold")
			collected = true
		end
	end
	
	if collected then
		GamePrintImportant( "$log_altar_magic", "" )
	end
end