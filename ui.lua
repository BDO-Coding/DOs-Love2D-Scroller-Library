local ui = {}

function ui.load()
	
	mouseX, mouseY = love.mouse.getPosition()

	buttonArray = {{}}
	
	click = love.audio.newSource("click.wav")

	backgrounds = {} --template {page,backgroundType,background}

end

function ui.inGameMenu(key,inGameMenuPage)

	if inGame == true then
		if love.keyboard.isDown(key) == true then
			if canOpenMenu == true then
				inGameMenuOpen = not inGameMenuOpen
				canOpenMenu = false
			end
		elseif love.keyboard.isDown(key) == false then
			canOpenMenu = true
		end
		if inGameMenuOpen == true then
			menuPage = inGameMenuPage
		elseif inGameMenuOpen == false then
			menuPage = runPage
		end
		if menuPage == inGameMenuPage or menuPage == runPage then
			inGame = true
		else
			inGame = false
		end
	end

end

function ui.addButton(x,y,xsize,ysize,r,g,b,text,textx,texty,page,action)

	buttonArray[#buttonArray+1]={x,y,xsize,ysize,r,g,b,text,textx,texty,page,action}

end

function drawButton()

	for i=1,#buttonArray do
		if buttonArray[i][11] == menuPage then
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
		    love.graphics.print(buttonArray[i][8], buttonArray[i][1]+buttonArray[i][3]/2-string.len(buttonArray[i][8])*11-5+spaces*10+buttonArray[i][9], buttonArray[i][2]+buttonArray[i][4]/2-20+buttonArray[i][10], 0, 3, 3)
		end
	end

end

function mousepressed()

	for i=1,#buttonArray do
		if buttonArray[i][11] == menuPage then
			if love.mouse.isDown(1) == true then
				if canClick == true then
					if mouseX > buttonArray[i][1] and mouseX < buttonArray[i][1]+buttonArray[i][3] and mouseY > buttonArray[i][2] and mouseY < buttonArray[i][2]+buttonArray[i][4] then
						if buttonArray[i][12] == "exit" then
				        	love.event.quit()
				        elseif buttonArray[i][12] == "run" then
				        	menuPage = runPage
				        else
				        	menuPage = buttonArray[i][12]
				            canClick = false
				        end
				        click:play()
				    end
				end
			elseif love.mouse.isDown(1) == false then
			    canClick = true
			end
		end
	end

end

function drawMenuBackgrounds() --Image or colour

	for i=1,#backgrounds do
		for j=1,#backgrounds[i][1] do
			if menuPage == backgrounds[i][1][j] then
				if backgrounds[i][2] == "colour" then
					love.graphics.setBackgroundColor(backgrounds[i][3][1], backgrounds[i][3][2], backgrounds[i][3][3])
				elseif backgrounds[i][2] == "image" then
					background = love.graphics.newImage(backgrounds[i][3])
					love.graphics.setColor(255,255,255)
					love.graphics.draw(background, 0, 0, 0, love.graphics.getWidth()/background:getWidth(), love.graphics.getHeight()/background:getHeight())
				end
			end
		end
	end
end

function ui.setMenuBackground(args)

	bType = "nil"
	bData = "nil"
	if args.image then 
		bType = "image"
		bData = args.image
	end

	if args.colour then 
		bType = "colour"
		bData = args.colour 
	end

	backgrounds[#backgrounds+1] = {args.page,bType,bData}

end

function ui.setPage(page)
	menuPage = page
end

function ui.getPage()
	return menuPage
end

function ui.update()

	mouseX, mouseY = love.mouse.getPosition()
	mousepressed()

	if menuPage == runPage then
		inGame = true
		inGameMenuOpen = false
	elseif menuPage == 0 then
		inGame = false
		inGameMenuOpen = false
	end

end

function ui.draw()

	drawMenuBackgrounds()
	drawButton()

end

return ui