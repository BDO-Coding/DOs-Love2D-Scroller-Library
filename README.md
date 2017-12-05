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
		It will put x,y of the click into the function you nominate.
		You may only enter a function that is inside input or main (moduleName.functionName doesn't work with G_ for some reason)
		EVENT CONDITIONS (E.G ONLY ACTIVATE IF X IS > 10) ARE WIP

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
	