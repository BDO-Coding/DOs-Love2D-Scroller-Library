local physics = {}

function physics.load()
	--TODO
	objects = {} --template: ID, doesScroll?, {x,y}, {xVel,yVel}, {image,quad}, scaling
	objectIDs = {}

end

function physics.update()
	--TODO

end

function physics.draw()

	if #objectIDs > 0 then
		for i = 1, #objectIDs do
			if objects[objectIDs[i][2]][2] == true then
				drawScrollingObject(objects[objectIDs[i][2]])
			end
		end
	end

end

function physics.newObject(ID,x,y,image,scaling)

	objects[ID] = {ID,true,{x,y},{0,0},{love.graphics.newImage(image),false},scaling}
	objectIDs[#objectIDs+1] = {#objectIDs+1,ID}

	if not(objects[ID] == nil) then print("Overwritten an existing object") end

end

return physics