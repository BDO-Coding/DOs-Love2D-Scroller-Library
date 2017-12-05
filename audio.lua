local audio = {}

function audio.load()

	click = love.audio.newSource("click.wav")
	click:setLooping(true)
	click:play()

end

function audio.update()



end

function audio.draw()--probably obsolete



end

return audio