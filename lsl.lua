local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"
lsl.input = require "input"

function lsl.load()

	inGame = false

	lsl.scroll.load()
	lsl.ui.load()
	lsl.input.load()

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

	if(inGame==true)then
		lsl.scroll.update()
	else
		lsl.ui.update()
	end

end

return lsl