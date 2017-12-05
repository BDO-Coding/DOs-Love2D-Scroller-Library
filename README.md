# DOs-Love2D-Scroller-Library

---Functions:

scroll.setup(args)
	Must be called in love.load() - required args are tilemap, tileSize, mapLength, mapHeight - optionals are min/maxZoom, camera/zoomSpeed, min/maxFilter and anstropy
	e.g. lsl.scroll.setup({tilemap = "tilemap.png", tileSize = 10, mapLength = 10, mapHeight = 20, cameraSpeed = 2})
	The map will automatically generate with all tiles at 0,0 in the tilemap

scroll.setTile(x,y,tiledata)

tiledata = scroll.createTiledata(args)
	Args either x and y or customImage
	The advantage of using a custom image is you can have it at a resolution higher than the rest of your tiles

input.setClickListener(args)
		Must have ID(just make these integers incrementing from 1 by 1 each time), click(either 1,2, or 3), event(the function you want it to call e.g. "testFunction").
		There is an optional arguement of condition (set out as condition = {minX,maxX,minY,maxY}) - this will only return a click if it is within the specified region
		It will put x,y of the click into the function you nominate.
		You may only enter a function that is inside input or main (moduleName.functionName doesn't work with G_ for some reason)

input.activateClickListener(ID)
			stops the listener requested from working
			
input.deactivateClickListener(ID)
			ditto
			
mapCoords = scroll.mouseCoordsToMap(x,y)
		
		converts the x and y coords of the mouse into the coords of the tile they clicked
		returns {tileX,tileY}


---Data Types:

tiledata:
	{customImage,quad}
	
ui.addButton(x,y,xsize,ysize,r,g,b,text,page,action)
	x = x position (left hand corner)
	y = y position (left hand corner)
	xsize = size of button on x axis
	ysize = size of button on y axis
	r = red colour of button
	g = green colour of button
	b = blue colour of button
	text = what the button says
	page = what page of the menu the button is on
	action = what page of the menu the button will take you to (you can use minus numbers for events e.g. -1 starts game, also if this is equal to the string "exit" then the program will quit)