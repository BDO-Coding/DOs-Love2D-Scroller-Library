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

---Data Types:

tiledata:
	{customImage,quad}
	