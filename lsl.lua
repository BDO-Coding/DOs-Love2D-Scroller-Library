local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"

function lsl.load()

	inGame = false

	lsl.scroll.load()
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

	if(inGame==true)then
		lsl.scroll.update()
	else
		lsl.ui.update()
	end

end

return lsl