local physics = {}

function physics.load()
	--TODO
	objects = {}
	objectIDs = {}

end

function physics.update()
	--TODO
	if #objectIDs > 0 then
		for i = 1, #objectIDs do
			print(objects[objectIDs[i][2]][2])
		end
	end

end

function physics.newObject(ID,name)

	objects[ID] = {ID,name}
	objectIDs[#objectIDs+1] = {#objectIDs+1,ID}

	if not(objects[ID] == nil) then print("Overwritten an existing object") end

end

return physics