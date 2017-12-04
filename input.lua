local input = {}

require "scroll"

function input.setClickListener(args) --The IDs for setClickListener must be consecutive integers, starting from 1

	if not(args.conditions) then
		conditions = false
	else conditions = args.conditions end

	clickListeners[args.ID] = {args.click,args.event,true,conditions} --conditions have yet to be fully implemented

end

function input.activateClickListener(ID)

	clickListeners[ID][3] = true

end

function input.deactivateClickListener(ID)

	clickListeners[ID][3] = false

end

function input.load()

	clickListeners = {}

	mouseButtons = {{1,false,false},{2,false,false},{3,false,false}} --buttonNum,lastCondition,condition

end

function input.update()

	listenForClicks()

end

function listenForClicks()

	for i=1,3 do
		mouseButtons[i][2] = mouseButtons[i][3]
		if love.mouse.isDown(i) == true then mouseButtons[i][3] = true else mouseButtons[i][3] = false end
	end

	for i=1, #clickListeners do
		if clickListeners[i][3] == true then
			if mouseButtons[clickListeners[i][1]][3] == true then
				if mouseButtons[clickListeners[i][1]][2] == false then
					_G[clickListeners[i][2]](love.mouse.getX(),love.mouse.getY())
				end
			end
		end
	end

end

return input