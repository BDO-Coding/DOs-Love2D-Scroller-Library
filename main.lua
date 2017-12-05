--Requires
local lsl = require "lsl"


--Loads
function love.load()
	
	lsl.scroll.setup({tilemap = "tilemap.png", tileSize = 10, mapLength = 20, mapHeight = 10, maxZoom = 10, cameraSpeed = 1, zoomSpeed = 0.3})
	lsl.load()
	lsl.scroll.setTile(1,5,lsl.scroll.createTiledata({customImage = "testCustomTile.png",minFilter = "linear",maxFilter = "linear", anstropy = 10}))

	lsl.ui.addButton(170,180,220,60,126,204,230,"Play Yay",0,-1)
	lsl.ui.addButton(170,400,220,60,126,204,230,"Hey!",0,1)
	lsl.ui.addButton(170,510,220,60,126,204,230,"Exit",0,"exit")

	lsl.ui.addButton(170,290,220,60,126,204,230,"Options",0,2)
	lsl.ui.addButton(170,290,240,60,126,204,230,"Volume:100",2,2)
	lsl.ui.addButton(170,400,220,60,126,204,230,"Back",2,0)

	lsl.ui.addButton(170,400,220,60,126,204,230,"Back",1,0)

	lsl.ui.setMenuBackground({page = {0,1,2},image = "testCustomTile.png"})

end

--Updates
function love.update()
	lsl.update()

	if lsl.ui.getPage() == -1 then
		inGame = true
	end
end

--Drawing
function love.draw()
	lsl.draw()
end

--
--NOTE TO ANYONE USING THIS LIBRARY: main.lua is un-needed as none of the functions are stored here. Only use this file for experimentations with the library.