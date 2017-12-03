--Requires
local lsl = require "lsl"


--Loads
function love.load()
	
	lsl.load()
	lsl.scroll.setup({tilemap = "tilemap.png", mapLength = 20, mapHeight = 10, maxZoom = 10})

end

--Updates
function love.update()
	--N/A
	lsl.update()
end

--Drawing
function love.draw()
	--N/A
	lsl.draw()
end

--NOTE TO ANYONE USING THIS LIBRARY: main.lua is un-needed as none of the functions are stored here. Only use this file for experimentations with the library.