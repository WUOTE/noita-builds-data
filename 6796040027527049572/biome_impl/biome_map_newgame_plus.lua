-- constants (color format is ARGB)
dofile_once("data/scripts/lib/utilities.lua")

function clamp(val, lower, upper)
    assert(val and lower and upper, "not very useful error message here")
    if lower > upper then lower, upper = upper, lower end -- swap if boundaries supplied the wrong way
    return math.max(lower, math.min(upper, val))
end


function paint_biome_area( x, y, w, h, biome_color, buffer )
	local extra_width = Random( 0, buffer )
	x = x - extra_width
	w = w + extra_width + Random( 0, buffer )

	for iy=y,y+h-1 do
		for ix=x,x+w-1 do
			BiomeMapSetPixel( ix, iy, biome_color )
		end
	end
end

function paint_biome_area_split( x, y, w, h, biome_color1, biome_color2, buffer )

	local extra_width = Random( 0, buffer )
	x = x - extra_width
	w = w + extra_width + Random( 0, buffer )
	
	local cutoff_point = Random( y + 1, y+h - 2 )

	for ix=x,x+w-1 do
		for iy=y,y+h-1 do
			if( iy < cutoff_point ) then
				BiomeMapSetPixel( ix, iy, biome_color1 )
			else
				BiomeMapSetPixel( ix, iy, biome_color2 )
			end
		end

		cutoff_point = cutoff_point + Random( -1, 1 )
		cutoff_point = clamp( cutoff_point, y + 1, y+h-2 )
	end
end

function paint_cave( x, y, dir, biome_color, length )

	for i=1,length do

		BiomeMapSetPixel( x, y, biome_color )

		if( i < 5 or Random( 0, 100 ) < 75 ) then
			x = x + dir
		else
			x = x - dir
		end

		BiomeMapSetPixel( x, y, biome_color )

		if( i > 3 ) then
			if( Random( 0, 100 ) < 65 ) then
				y = y + 1
			else
				y = y - 1
			end
		end

		if( i > 6 ) then
			if( Random( 0, 100 ) < 35 ) then BiomeMapSetPixel( x - 1, y, biome_color ) end
			if( Random( 0, 100 ) < 35 ) then BiomeMapSetPixel( x + 1, y, biome_color ) end
			if( Random( 0, 100 ) < 35 ) then BiomeMapSetPixel( x, y - 1, biome_color ) end
			if( Random( 0, 100 ) < 35 ) then BiomeMapSetPixel( x, y + 1, biome_color ) end
		end

	end

end

-------------------------------------------------

local w = 64
local h = 48

BiomeMapSetSize( w, h )
BiomeMapLoadImage( 0, 0, "data/biome_impl/biome_map_newgame_plus.png" )

SetRandomSeed( 4573, 4621 )

----

local biome_coalmines = 0xFFD57917
local biome_collapsedmines = 0xFFD56517
local biome_fungicave = 0xFFE861F0
local biome_excavationsite = 0xFF124445
local biome_snowcaves = 0xFF1775D5
local biome_hiisibase = 0xFF0046FF
local biome_jungle_1 = 0xFFA08400
local biome_jungle_2 = 0xFF808000
local biome_vault = 0xFF008000
local biome_sandcaves = 0xFFE1CD32
local biomes_snowvault = 0xFF0080A8
local biomes_wandcave = 0xFF006C42

if( Random( 0, 100 ) < 35 ) then
	biome_coalmines, biome_collapsedmines = biome_collapsedmines, biome_coalmines
end

if( Random( 0, 100 ) < 35 ) then
	biome_fungicave, biome_excavationsite = biome_excavationsite, biome_fungicave
end

if( Random( 0, 100 ) < 35 ) then
	biome_snowcaves, biome_hiisibase = biome_hiisibase, biome_snowcaves
end

if( Random( 0, 100 ) < 35 ) then
	biome_jungle_1, biome_jungle_2 = biome_jungle_2, biome_jungle_1
end

if( Random( 0, 100 ) < 35 ) then
	biome_sandcaves, biome_fungicave = biome_fungicave, biome_sandcaves
end

if( Random( 0, 100 ) < 35 ) then
	biomes_wandcave, biome_sandcaves = biome_sandcaves, biomes_wandcave
end
-- caves
-- left side: 27
-- right side: 35
if( Random( 0, 100 ) < 65 ) then paint_cave( 27, 15, -1, biome_fungicave, Random( 4, 50 ) ) end
if( Random( 0, 100 ) < 65 ) then paint_cave( 35, 15, 1, biome_fungicave, Random( 4, 50 ) ) end

if( Random( 0, 100 ) < 65 ) then paint_cave( 27, 18, -1, biome_fungicave, Random( 4, 50 ) ) end
if( Random( 0, 100 ) < 65 ) then paint_cave( 35, 18, 1, biome_fungicave, Random( 4, 50 ) ) end

if( Random( 0, 100 ) < 65 ) then paint_cave( 27, 20 + Random( 0, 5 ), -1, biomes_wandcave, Random( 5, 50 ) ) end
if( Random( 0, 100 ) < 65 ) then paint_cave( 35, 20 + Random( 0, 5 ), 1, biomes_wandcave, Random( 5, 50 ) ) end

if( Random( 0, 100 ) < 65 ) then paint_cave( 27, 27 + Random( 0, 6 ), -1, biome_sandcaves, Random( 5, 50 ) ) end
if( Random( 0, 100 ) < 65 ) then paint_cave( 35, 27 + Random( 0, 6 ), 1, biome_sandcaves, Random( 5, 50 ) ) end


-- biome 1 
paint_biome_area( 32, 14, 3, 2,  biome_coalmines, 0 )
paint_biome_area( 28, 15, 4, 1,  biome_collapsedmines, 1 )

-- biome 2
paint_biome_area( 28, 17, 4, 2,  biome_excavationsite, 2 )

-- biome 3
paint_biome_area_split( 28, 20, 7, 6,  biome_snowcaves, biome_hiisibase, 3 )

-- biome 4
paint_biome_area_split( 28, 27, 7, 4,  biome_jungle_1, biome_jungle_2, 4 )
paint_biome_area_split( 28, 29, 7, 5,  biome_jungle_2, biome_vault, 4 )

-- orb rooms
local orb_1 = 0xFFFFD105
local orb_2 = 0xFFFFD106
local orb_3 = 0xFFFFD107

-- pyramid at 51,11
local orb_pyramid = 0xFFC88F5F
BiomeMapSetPixel( 51, 11, orb_pyramid )

-- floating island
local orb_floating_island = 0xFFC08082
BiomeMapSetPixel( 33, 11, orb_floating_island )

-- vault 2 
local orb_vault2 = 0xFFFFD102
local x = Random( 0, 5 ) + 10
local y = Random( 0, 2 ) + 18
BiomeMapSetPixel( x, y, orb_vault2 )

-- inside pyramid
local orb_inside_pyramid = 0xFFFFD104
local x = Random( 0, 5 ) + 49
local y = Random( 0, 3 ) + 17
BiomeMapSetPixel( x, y, orb_inside_pyramid )

-- hell
local orb_hell = 0xFFFFD108
local x = Random( 0, 9 ) + 27
local y = Random( 0, 3 ) + 44
BiomeMapSetPixel( x, y, orb_hell )

-- snowcave bottom
local orb_snowcave_bottom = 0xFFFFD109
local x = Random( 0, 6 ) + 12
local y = Random( 0, 3 ) + 40
BiomeMapSetPixel( x, y, orb_snowcave_bottom )

-- desert bottom
local orb_desert_bottom = 0xFFFFD110
local x = Random( 0, 4 ) + 51
local y = Random( 0, 5 ) + 41
BiomeMapSetPixel( x, y, orb_desert_bottom )


-- TODO (nuke)
local orb_room_nuke = 0xFFFFD103
local x = Random( 0, 5 ) + 58
local y = Random( 0, 5 ) + 34
BiomeMapSetPixel( x, y, orb_room_nuke )

local x = Random( 0, 9 ) + 40
local y = Random( 0, 11 ) + 21
BiomeMapSetPixel( x, y, orb_1 )

local x = Random( 0, 7 ) + 17
local y = Random( 0, 8 ) + 21
BiomeMapSetPixel( x, y, orb_2 )

local x = Random( 0, 7 ) + 1
local y = Random( 0, 9 ) + 24
BiomeMapSetPixel( x, y, orb_3 )

-- biome 5
-- crypt

--[[
for y=0,h-1 do
	for x=0,w-1 do

		if y > 19 then
			BiomeMapSetPixel( x, y, snowcave )
		elseif y > 16 then
			BiomeMapSetPixel( x, y, excavation_site )
		elseif y > 14 then
			BiomeMapSetPixel( x, y, coalmine )
		else
			BiomeMapSetPixel( x, y, hills )
		end

	end
end
]]--