# DOs-Love2D-Scroller-Library

----------------------------------------------------------------------------------------------------------------------------------------------------------
---Scroll Functions---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

scroll.setup(args)
	Must be called in love.load() - required args are tilemap, tileSize, mapLength, mapHeight - optionals are min/maxZoom, camera/zoomSpeed, min/maxFilter and anstropy
	e.g. lsl.scroll.setup({tilemap = "tilemap.png", tileSize = 10, mapLength = 10, mapHeight = 20, cameraSpeed = 2})
	The map will automatically generate with all tiles at 0,0 in the tilemap

scroll.setTile(x,y,tiledata)

tiledata = scroll.createTiledata(args)
	Args either x and y or customImage
	The advantage of using a custom image is you can have it at a resolution higher than the rest of your tiles

mapCoords = scroll.mouseCoordsToMap(x,y)
	converts the x and y coords of the mouse into the coords of the tile they clicked
	returns {tileX,tileY}

----------------------------------------------------------------------------------------------------------------------------------------------------------
---Input Functions----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

input.setClickListener(args)
	Must have ID(just make these integers incrementing from 1 by 1 each time), click(either 1,2, or 3), event(the function you want it to call e.g. "testFunction").
	There is an optional arguement of condition (set out as condition = {minX,maxX,minY,maxY}) - this will only return a click if it is within the specified region
	It will put x,y of the click into the function you nominate.
	You may only enter a function that is inside input or main (moduleName.functionName doesn't work with G_ for some reason)

input.activateClickListener(ID)
	stops the listener requested from working
			
input.deactivateClickListener(ID)
	ditto

----------------------------------------------------------------------------------------------------------------------------------------------------------
---Audio Functions----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

audio.newTrack(ID,track)
	makes a new track
	the IDs should start at 1 and increment by 1 each time and the track shou;d be a string of the file location

audio.play(ID)

audio.stop(ID)

audio.volume(ID,volume)
	the volume must be an int between 0 and 1

audio.loop(ID,doesLoop)
	doesLoop is a boolean
		
audio.fade(ID,way)
	way is a string either "in" or "out" depending on the direction you want the track to fade

----------------------------------------------------------------------------------------------------------------------------------------------------------
-----UI Functions-----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

ui.addButton(x,y,xsize,ysize,r,g,b,text,textx,texty,page,action)
	x = x position (left hand corner)
	y = y position (left hand corner)
	xsize = size of button on x axis
	ysize = size of button on y axis
	r = red colour of button
	g = green colour of button
	b = blue colour of button
	text = what the button says
	textx = used to change the x of the text
	texty = used to change the y of the text
	page = what page of the menu the button is on
	action = what page of the menu the button will take you to, can be any type of variable (you can use this to set a certain action to trigger an event, if this is equal to the string "exit" then the program will quit)

ui.setMenuBackground({page = {x}, image/colour = y})
	page = the page that you want the background to appear on, can be an array of pages
	image = set this on different page from colour, set this as the name of the image e.g. "test.png"
	colour = set this on different page from image, set this as an array containing the r g b of the colours e.g. {255,0,145}

ui.inGameMenu(key,inGameMenuPage)
	key = what key on the keyboard you want to open the menu
	inGameMenuPage = what opening page you want the inGameMenu to be on

----------------------------------------------------------------------------------------------------------------------------------------------------------
------Data Types------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------

tiledata:
	{customImage,quad}