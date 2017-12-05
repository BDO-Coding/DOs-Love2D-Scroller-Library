local ui = {}

function ui.load()
	
	mouseX, mouseY = love.mouse.getPosition()

	buttonArray = {{}}

	BALength = 0
	menuPage = 0
	leftLock = false
	
	click = love.audio.newSource("click.wav")

end

function ui.addButton(x,y,xsize,ysize,r,g,b,text,page,action)

	buttonArray[BALength+1]={x,y,xsize,ysize,r,g,b,text,page,action}
	BALength = BALength + 1

end

function drawButton(BALength)

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

function mousepressed(BALength)

	for i=1,BALength do
		if buttonArray[i][9] == menuPage then
			if love.mouse.isDown(1) == true then
				if canClick == true then
					if mouseX > buttonArray[i][1] and mouseX < buttonArray[i][1]+buttonArray[i][3] and mouseY > buttonArray[i][2] and mouseY < buttonArray[i][2]+buttonArray[i][4] then
			            menuPage = buttonArray[i][10]
			            canClick = false
				        click:play()
				        if menuPage == "exit" then
				        	love.event.quit()
				        end
				    end
				end
			elseif love.mouse.isDown(1) == false then
			    canClick = true
			end
		end
	end

end

function ui.getPage()
	return menuPage
end

function ui.update()

	mouseX, mouseY = love.mouse.getPosition()
	mousepressed(BALength)

end

function ui.draw()

	love.graphics.setBackgroundColor(0, 255, 0)
	drawButton(BALength)

end

return ui