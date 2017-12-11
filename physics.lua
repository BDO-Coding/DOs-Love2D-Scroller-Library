local physics = {}

function physics.load()

	objects = {} --template: ID, doesScroll?, {x,y}, {xVel,yVel},{xAcc,yAcc},{image,quad}, scaling
	objectIDs = {}

end

function physics.update()
	--TODO
	applyAccelerations()
	applyVelocities()
	applyFrictions()

end

function physics.draw()

	if #objectIDs > 0 then
		for i = 1, #objectIDs do
			if objects[objectIDs[i][2]][2] == true then
				drawScrollingObject(objects[objectIDs[i][2]])
			end
		end
	end

	love.graphics.setColor(0,0,0)

	love.graphics.pop()

end

function physics.setup(args)

	friction = 0.001
	zero = 0.01

	if args.friction then friction = args.friction end
	if args.zero then zero = args.zero end

end

function physics.newObject(ID,x,y,image,scaling)

	if not(objects[ID] == nil) then print("Overwritten an existing object") end

	objects[ID] = {ID,true,{x,y},{0,0},{0,0},{love.graphics.newImage(image),false},scaling}
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

return physics