--Requires
local lsl = require "lsl"


--Loads
function love.load()
	
	lsl.scroll.setup({tilemap = "tilemap.png", tileSize = 10, mapLength = 20, mapHeight = 10, maxZoom = 10})
	lsl.load()
	lsl.scroll.setTile(1,5,lsl.scroll.createTiledata({customImage = "testCustomTile.png",minFilter = "linear",maxFilter = "linear", anstropy = 10}))

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