--Requires
local lsl = require "lsl"


--Loads
function love.load()

	lsl.scroll.setup({zoomToMouse = true, tilemap = "tilemap.png", tileSize = 10, mapLength = 10, mapHeight = 10, maxZoom = 10, cameraSpeed = 5, zoomSpeed = 0.1})
	lsl.physics.setup({friction =  0.001, zero = 0.01,drawHitboxes = false})

	lsl.load()

	lsl.scroll.setTile(1,5,lsl.scroll.createTiledata({customImage = "testCustomTile.png",minFilter = "linear",maxFilter = "linear", anstropy = 10}))

	lsl.ui.addButton(170,180,220,60,126,204,230,"Play Yay",0,0,0,"run")
	lsl.ui.addButton(170,400,220,60,126,204,230,"Hey!",0,0,0,1)
	lsl.ui.addButton(170,510,220,60,126,204,230,"Exit",0,0,0,"exit")

	lsl.ui.addButton(170,180,500,60,126,204,230,"Type:",0,0,1,"inputText")
	lsl.ui.addButton(170,400,220,60,126,204,230,"Back",0,0,1,0)

	lsl.ui.addButton(170,290,220,60,126,204,230,"Options",0,0,0,2)
	lsl.ui.addButton(170,290,240,60,126,204,230,"Volume:100",0,0,2,2)
	lsl.ui.addButton(170,400,220,60,126,204,230,"Back",0,0,2,0)

	lsl.ui.addButton(480,100,220,60,126,204,230,"Resume",5,0,"gameMenu1","run")
	lsl.ui.addButton(450,300,280,60,126,204,230,"Back to menu",5,0,"gameMenu1",0)
	lsl.ui.addButton(480,500,220,60,126,204,230,"Exit",2,0,"gameMenu1","exit")

	lsl.ui.setMenuBackground({page = {0,1,2},image = "testCustomTile.png"})

	lsl.audio.newTrack(1,"music.mp3")
	lsl.audio.volume(1,0.2)
	lsl.audio.play(1)

	lsl.physics.newObject("ball1",5,5,"coal.png",0.1)
	lsl.physics.newObject("ball2",5.5,5.5,"coal.png",0.1)
	--lsl.physics.setAcc("ball1",0.02,0)

	lsl.scroll.setMouseHovering({set = false,color = {50,50,50}})

end

--Updates
function love.update()
	lsl.update()
	lsl.ui.inGameMenu("escape","gameMenu1")
	--print(lsl.ui.getInputButtonText(4))
	--lsl.audio.volume(1,lsl.ui.getInputButtonText(7))
	--lsl.input.setClickListener({ID = 1,click = 1, event = "printClickTile"})
	x,y = lsl.scroll.mouseCoordsToExactMap(love.mouse.getX(),love.mouse.getY())
	lsl.physics.setPos("ball1",x,y)
end

--Drawing
function love.draw()
	lsl.draw()
end

--
--NOTE TO ANYONE USING THIS LIBRARY: main.lua is un-needed as none of the functions are stored here. Only use this file for experimentations with the library. Although you must require lsl