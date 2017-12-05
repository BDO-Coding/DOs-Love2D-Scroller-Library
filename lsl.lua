local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"
lsl.input = require "input"
lsl.audio = require "audio"
lsl.physics = require "physics"

function lsl.load()

	inGame = false
	gameMenu = false

	lsl.audio.load()
	lsl.input.load()
	lsl.scroll.load()
	lsl.physics.load()
	lsl.ui.load()

end

function lsl.draw()

	if(inGame==true)then
		lsl.scroll.draw()
	end
	lsl.ui.draw()

end

function lsl.update()

	lsl.input.update()
	lsl.audio.update()
	lsl.physics.update()
	lsl.ui.update()

	if(inGame==true and lsl.ui.getPage() == -1)then
		lsl.scroll.update()
	end

end

return lsl