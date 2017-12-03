local lsl = {}

lsl.ui = require "ui"
lsl.scroll = require "scroll"

function lsl.load()

	lsl.ui.load()
	lsl.scroll.load()

end

function lsl.draw()

	lsl.scroll.draw()

end

function lsl.update()

	lsl.scroll.update()

end

return lsl