local physics = {}

function physics.load()

	objects = {} --template: ID, doesScroll?, {x,y}, {xVel,yVel},{xAcc,yAcc},{image,quad}, scaling, {mouseHovering,{isColliding,collisionX,collisionY,collisionWidth,collisionHeight}}
	objectIDs = {}

end

function physics.update()
	--TODO
	applyAccelerations()
	applyVelocities()
	applyFrictions()
	checkForMouseHovering()
	checkForObjectCollision()

end

function physics.draw()

	if #objectIDs > 0 then
		for i = 1, #objectIDs do

			love.graphics.setColor(255,255,255)


			if objects[objectIDs[i][2]][2] == true then
				drawScrollingObject(objects[objectIDs[i][2]])
			end

			if not(objects[objectIDs[i][2]][8][2][1] == false) then

				love.graphics.setColor(255,0,0)
				love.graphics.rectangle("fill",applyScroll(objects[objectIDs[i][2]][8][2][2],"x"),applyScroll(objects[objectIDs[i][2]][8][2][3],"y"),objects[objectIDs[i][2]][8][2][4],objects[objectIDs[i][2]][8][2][5])

			end

		end
	end

	love.graphics.setColor(0,0,0)

	if drawHitboxes == true then
		drawAllHitboxes()
	end

	love.graphics.pop()


end

function physics.setup(args)

	friction = 0.001
	zero = 0.01
	drawHitboxes = false

	if args.friction then friction = args.friction end
	if args.zero then zero = args.zero end
	if args.drawHitboxes then drawHitboxes = args.drawHitboxes end

end

function physics.newObject(ID,x,y,image,scaling)

	if not(objects[ID] == nil) then print("Overwritten an existing object") end

	objects[ID] = {ID,true,{x,y},{0,0},{0,0},{love.graphics.newImage(image),false},scaling,{false,{false,0,0,0,0}}}
	objectIDs[#objectIDs+1] = {#objectIDs+1,ID}

end

function physics.accelerate(ID,xAcc,yAcc)
	objects[ID][5][1] = objects[ID][5][1] + xAcc
	objects[ID][5][2] = objects[ID][5][2] + yAcc
end

function physics.push(ID,xVel,yVel)
	objects[ID][4][1] = objects[ID][4][1] + xVel
	objects[ID][4][2] = objects[ID][4][2] + yVel
end

function physics.step(ID,x,y)
	objects[ID][3][1] = objects[ID][3][1] + x
	objects[ID][3][2] = objects[ID][3][2] + y
end

function physics.setPos(ID,x,y)
	objects[ID][3][1] = x
	objects[ID][3][2] = y
end

function physics.setVel(ID,x,y)
	objects[ID][4][1] = x
	objects[ID][4][2] = y
end

function physics.setAcc(ID,x,y)
	objects[ID][5][1] = x
	objects[ID][5][2] = y
end

function physics.getObject(ID)
	--return {x = objects[ID][3][1], y = objects[ID][3][2], xVel}		WIP
end

function applyAccelerations()

	if #objectIDs > 0 then
		for i = 1, #objectIDs do
			objects[objectIDs[i][2]][4][1] = objects[objectIDs[i][2]][4][1] + objects[objectIDs[i][2]][5][1]
			objects[objectIDs[i][2]][4][2] = objects[objectIDs[i][2]][4][2] + objects[objectIDs[i][2]][5][2]
		end
	end

end

function checkForObjectCollision()

	if #objectIDs > 0 then
		for subject = 1, #objectIDs do
			objects[objectIDs[subject][2]][8][2][1] = false
			for object = 1, #objectIDs do
				if not(object==subject) then

					--CAN ALSO RETURN THE RECTANGLE OF INTERSECTION TO DRAW
					--SEE ONENOTE

					sminX,smaxX = objects[objectIDs[subject][2]][3][1], objects[objectIDs[subject][2]][3][1]+(objects[objectIDs[subject][2]][6][1]:getWidth()*objects[objectIDs[subject][2]][7]/tileSize)
					sminY,smaxY = objects[objectIDs[subject][2]][3][2], objects[objectIDs[subject][2]][3][2]+(objects[objectIDs[subject][2]][6][1]:getHeight()*objects[objectIDs[subject][2]][7]/tileSize)
					ominX,omaxX = objects[objectIDs[object][2]][3][1], objects[objectIDs[object][2]][3][1]+(objects[objectIDs[object][2]][6][1]:getWidth()*objects[objectIDs[object][2]][7]/tileSize)
					ominY,omaxY = objects[objectIDs[object][2]][3][2], objects[objectIDs[object][2]][3][2]+(objects[objectIDs[object][2]][6][1]:getHeight()*objects[objectIDs[object][2]][7]/tileSize)

					if ((sminX > ominX and sminX < omaxX) or (smaxX > ominX and smaxX < omaxX)) and ((sminY > ominY and sminY < omaxY) or (smaxY > ominY and smaxY < omaxY)) then

						objects[objectIDs[subject][2]][8][2][1] = object

						if (sminX > ominX and sminX < omaxX) then 
							objects[objectIDs[subject][2]][8][2][2] = sminX 
							objects[objectIDs[subject][2]][8][2][4] = (omaxX - sminX)*tileSize

						end

						if (smaxX > ominX and smaxX < omaxX) then 
							objects[objectIDs[subject][2]][8][2][2] = ominX 
							objects[objectIDs[subject][2]][8][2][4] = (smaxX - ominX)*tileSize
						end


						if (sminY > ominY and sminY < omaxY) then 
							objects[objectIDs[subject][2]][8][2][3] = sminY 
							objects[objectIDs[subject][2]][8][2][5] = (omaxY - sminY)*tileSize
						end

						if (smaxY > ominY and smaxY < omaxY) then 
							objects[objectIDs[subject][2]][8][2][3] = ominY 
							objects[objectIDs[subject][2]][8][2][5] = (smaxY - ominY)*tileSize
						end

					end

				end
			end	
		end
	end

end

function applyVelocities()

	if #objectIDs > 0 then
		for i = 1, #objectIDs do
			objects[objectIDs[i][2]][3][1] = objects[objectIDs[i][2]][3][1] + objects[objectIDs[i][2]][4][1]
			objects[objectIDs[i][2]][3][2] = objects[objectIDs[i][2]][3][2] + objects[objectIDs[i][2]][4][2]
		end
	end

end

function applyFrictions()

	if #objectIDs > 0 then
		for i = 1, #objectIDs do

			objects[objectIDs[i][2]][4][1] = applyVelFriction(objects[objectIDs[i][2]][4][1])
			objects[objectIDs[i][2]][4][2] = applyVelFriction(objects[objectIDs[i][2]][4][2])

		end
	end
end

function checkForMouseHovering()

	x,y = love.mouse.getX(),love.mouse.getY()
	x,y = mouseCoordsToExactMap(x,y)

	if #objectIDs > 0 then
		for i = 1, #objectIDs do

				objects[objectIDs[i][2]][8][1] = checkForPointCollision({x,y},objectIDs[i][2])

		end
	end

end

function checkForPointCollision(point,objectID)

	x,y = point[1],point[2]

		ox,oy = objects[objectID][3][1],objects[objectID][3][2]
		oimage,oscaling = objects[objectID][6][1],objects[objectID][7]
		realw,realh = oimage:getWidth()*oscaling,oimage:getHeight()*oscaling
		ow,oh = ox+(realw/tileSize),oy+(realh/tileSize)

		if x >= ox and y >= oy and x <= ow and y <= oh then
			return true
		else
			return false
		end

end

function applyVelFriction(num)

	if num > -zero and num < zero then num = 0 end

	if num > 0 then
		num = num - friction
	elseif num < 0 then
		num = num + friction
	end

	return num

end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function drawAllHitboxes()

	if #objectIDs > 0 then
		for i = 1, #objectIDs do

			image = objects[objectIDs[i][2]][6][1]
			x,y = objects[objectIDs[i][2]][3][1],objects[objectIDs[i][2]][3][2]
			w,h = image:getWidth()*objects[objectIDs[i][2]][7], image:getHeight()*objects[objectIDs[i][2]][7]

			love.graphics.rectangle("line",applyScroll(x,"x"),applyScroll(y,"y"),w,h)
			--objects[objectIDs[i][2]][4][1] = applyVelFriction(objects[objectIDs[i][2]][4][1])
			--objects[objectIDs[i][2]][4][2] = applyVelFriction(objects[objectIDs[i][2]][4][2])

		end
	end

end

return physics