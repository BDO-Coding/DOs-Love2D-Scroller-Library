local audio = {}

function audio.load()

	tracks = {}

	fadeSpeed = 0.1

end

function audio.update()

	fadeTracks()

end

function audio.newTrack(ID,track)

	tracks[ID] = {love.audio.newSource(track),"none"} --track,fade

end

function audio.play(ID)

	tracks[ID][1]:play()

end

function audio.stop(ID)

	tracks[ID][1]:rewind()
	tracks[ID][1]:stop()

end

function audio.volume(ID,volume)

	tracks[ID][1]:setVolume(volume)

end

function audio.fade(ID,way)

	tracks[ID][2] = way

end

function audio.loop(ID,isLooping)

	tracks[ID][1]:setLooping(isLooping)

end

function fadeTracks()

	if #tracks > 0 then

		for i=1,#tracks do

			if not(tracks[i][2] == "none") then

				if tracks[i][2] == "out" then
					tracks[i][1]:setVolume(round(tracks[i][1]:getVolume()-(0.1*fadeSpeed),3))
				end

				if tracks[i][2] == "in" then
					tracks[i][1]:setVolume(round(tracks[i][1]:getVolume()+(0.1*fadeSpeed),3))
				end

				if tracks[i][1]:getVolume() > 1 or tracks[i][1]:getVolume() < 0.00001 then tracks[i][2] = "none" end
			end
		end
	end
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

return audio