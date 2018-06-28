local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"
lsl.input = require "input"
lsl.audio = require "audio"
lsl.physics = require "physics"

function lsl.load()

	scale = love.graphics.getWidth()/1200 -- 1200(the width we are optimising for)

	menuPage = 0
	runPage = "inGame"
	inGame = false
	inGameMenuOpen = false

	lsl.audio.load()
	lsl.input.load()
	lsl.scroll.load()
	lsl.physics.load()
	lsl.ui.load()

end

function lsl.draw()

	love.graphics.push()
	love.graphics.scale(scale)

	if(inGame==true)then
		lsl.scroll.draw()
		lsl.physics.draw()
	end
	lsl.ui.draw()

	love.graphics.pop()

end

function lsl.update()

	lsl.input.update()
	lsl.audio.update()
	lsl.ui.update()

	if(inGame==true and menuPage == runPage)then
		lsl.scroll.update()
		lsl.physics.update()
	end

end
 
return lsl