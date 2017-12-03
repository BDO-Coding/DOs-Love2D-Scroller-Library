scroll = {}

function scroll.setup(args)

	if not(args.tilemap or args.mapLength or args.mapHeight) then
		print("Missing arguements for scroll.setup()") 
	end

	tilemap = love.graphics.newImage(args.tilemap)
	mapLength, mapHeight = args.mapLength, args.mapHeight

	minZoom,maxZoom,cameraSpeed,zoomSpeed = 0.2,1.5,0.1,0.05

	if args.minZoom then minZoom = args.minZoom end
	if args.maxZoom then maxZoom = args.maxZoom end
	if args.cameraSpeed then cameraSpeed = args.cameraSpeed end
	if args.zoomSpeed then zoomSpeed = args.zoomSpeed end

	minFilter,maxFilter,anstropy = "nearest", "nearest", 0

	if args.minFilter then minFilter = args.minFilter end
	if args.maxFilter then maxFilter = args.maxFilter end
	if args.anstropy then anstropy = args.anstropy end

	tilemap:setFilter(minFilter,maxFilter,anstropy)

end

function scroll.load()

	tileSize = 10

	mapLength,mapHeight = 10,10
	zoom = 1
	cameraX,cameraY = 0,0
	zoomOffset = 0

	map = {}

	for x = 1,mapLength do
		map[x] = {}
		for y = 1,mapHeight do
			map[x][y] = createBlankTiledata()
			print() 
		end
	end

end

function scroll.draw()

	for x=1,mapLength do
		for y=1, mapHeight do
			love.graphics.draw(tilemap,map[x][y][1],applyScroll(x,"x"),applyScroll(y,"y"),0,zoom,zoom)
		end
	end

end


function scroll.update()

	checkForKeyPresses()

end

function createBlankTiledata()

	return {love.graphics.newQuad(0,0,10,10,100,100)}

end

function checkForKeyPresses()

	if love.keyboard.isDown('w') then cameraY = cameraY + cameraSpeed end
	if love.keyboard.isDown('a') then cameraX = cameraX + cameraSpeed end
	if love.keyboard.isDown('s') then cameraY = cameraY - cameraSpeed end
	if love.keyboard.isDown('d') then cameraX = cameraX - cameraSpeed end

end

function love.wheelmoved(x, y)

    if y > 0 and zoom < maxZoom then
        zoom = zoom + zoomSpeed
        cameraX,cameraY = cameraX - zoomSpeed*zoom, cameraY - zoomSpeed*zoom
    elseif y < 0 and zoom > minZoom then
        zoom = zoom - zoomSpeed
        cameraX,cameraY = cameraX + zoomSpeed*zoom, cameraY + zoomSpeed*zoom
 	end

end

function applyScroll(num,axis) --num is x position in tiles
	
	if axis == "x" then 
		camera = cameraX 
	elseif axis == "y" then 
		camera = cameraY 
	else 
		print("Arguement 2 for applyScroll() must be \"x\" or \"y\"")
	end

	return num*zoom*tileSize+(camera*tileSize)

end

return scroll