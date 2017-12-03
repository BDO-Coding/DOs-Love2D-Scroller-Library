local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"
lsl.input = require "input"

function lsl.load()

	testing = "d"

		lsl.scroll.load()
		lsl.ui.load()
		lsl.input.load()

end

function lsl.draw()

	if(testing=="d")then
		lsl.scroll.draw()
	else
		lsl.ui.draw()
	end

end

function lsl.update()

	lsl.input.update()

	if(testing=="d")then
		lsl.scroll.update()
	else
		lsl.ui.draw()
	end

end

return lsl