local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"
lsl.input = require "input"
lsl.audio = require "audio"
lsl.physics = require "physics"

function lsl.load()

	inGame = false

	lsl.audio.load()
	lsl.input.load()
	lsl.scroll.load()
	lsl.physics.load()
	lsl.ui.load()

end

function lsl.draw()

	if(inGame==true)then
		lsl.scroll.draw()
	else
		lsl.ui.draw()
	end

end

function lsl.update()

	lsl.input.update()
	lsl.audio.update()
	lsl.physics.update()

	if(inGame==true)then
		lsl.scroll.update()
	else
		lsl.ui.update()
	end

end

return lsl