local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"

function lsl.load()

	testing = "d"

	if(testing=="d")then
		lsl.scroll.load()
	else
		lsl.ui.load()

end

function lsl.draw()

	if(testing=="d")then
		lsl.scroll.draw()
	else
		lsl.ui.draw()

end

function lsl.update()

	if(testing=="d")then
		lsl.scroll.update()
	else
		lsl.ui.draw()

end

return lsl