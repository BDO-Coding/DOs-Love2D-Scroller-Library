--testing for modules

local ui = {}

function ui.load()
	
	mouseX, mouseY = love.mouse.getPosition()

	buttonArray = {{}}

	BALength = 0
	menuPage = 0
	clickDelay = 0
	

end

function ui.addButton(x,y,xsize,ysize,r,g,b,text,page,action)

	buttonArray[BALength+1]={x,y,xsize,ysize,r,g,b,text,page,action}
	BALength = BALength + 1

end

function ui.drawButton(BALength)

	for i=1,BALength do
		if buttonArray[i][9] == menuPage then
			if mouseX > buttonArray[i][1] and mouseX < buttonArray[i][1]+buttonArray[i][3] and mouseY > buttonArray[i][2] and mouseY < buttonArray[i][2]+buttonArray[i][4] then
		    	love.graphics.setColor(buttonArray[i][5]-150, buttonArray[i][6]-150, buttonArray[i][7]-150)
		    else
		        love.graphics.setColor(buttonArray[i][5], buttonArray[i][6], buttonArray[i][7])
		    end
		    love.graphics.rectangle("fill", buttonArray[i][1], buttonArray[i][2], buttonArray[i][3], buttonArray[i][4])
		    love.graphics.setColor(0, 0, 0)
		    love.graphics.rectangle("line", buttonArray[i][1], buttonArray[i][2], buttonArray[i][3], buttonArray[i][4])
		    local spaces = 0
			for i in string.gfind(buttonArray[i][8], " ") do
				spaces = spaces + 1
			end --NOTE : Text print doesn't work well with spaces vv
		    love.graphics.print(buttonArray[i][8], buttonArray[i][1]+buttonArray[i][3]/2-string.len(buttonArray[i][8])*11-5+spaces*9, buttonArray[i][2]+buttonArray[i][4]/2-20, 0, 3, 3)
		end
	end

end

function ui.mousepressed(BALength)

	clickDelay = clickDelay - 0.1

	for i=1,BALength do
		if buttonArray[i][9] == menuPage then
			if love.mouse.isDown(1) == true and clickDelay <= 0 then
				if mouseX > buttonArray[i][1] and mouseX < buttonArray[i][1]+buttonArray[i][3] and mouseY > buttonArray[i][2] and mouseY < buttonArray[i][2]+buttonArray[i][4] then
					if buttonArray[i][10] == -1 then
						inGame = true
					else
		            	menuPage = buttonArray[i][10]
		            	clickDelay = 1
		           	end
		        end
		    end
		end
    end

end

function ui.update()

	mouseX, mouseY = love.mouse.getPosition()
	ui.mousepressed(BALength)

	ui.addButton(170,180,220,60,126,204,230,"Play Yay",0,-1)
	ui.addButton(170,400,220,60,126,204,230,"Hey!",0,1)
	ui.addButton(170,400,220,60,126,204,230,"Back",1,0)

end

function ui.draw()

	love.graphics.setBackgroundColor(0, 255, 0)
	ui.drawButton(BALength)

end

return ui