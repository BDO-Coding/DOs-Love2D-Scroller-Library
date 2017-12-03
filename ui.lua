--testing for modules

local ui = {}

function ui.load()
	
	mouseX, mouseY = love.mouse.getPosition()

end

function ui.createMenu()

	print("test")


end

function ui.drawButton(x,y,xsize,ysize,r,g,b)

	--if mouseX > x and mouseX < 390 and mouseY > 180 and mouseY < 240 then
    love.graphics.setColor(r, g, b)
    love.graphics.rectangle("fill", x, y, xsize, ysize)
    --[[else
        love.graphics.setColor(126, 204, 230)
        love.graphics.rectangle("fill", 170, 180, 220, 60)
    end''']]

end

function ui.update()
	--N/A
end

function ui.draw()
	ui.drawButton(170,180,220,60,126,204,230)
end

return ui