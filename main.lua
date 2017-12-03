--[[found some tutorials on module creation:
				1) http://www.geeks3d.com/20130906/how-to-create-a-lua-module/
				2) http://lua-users.org/wiki/ModulesTutorial
		The second one seemed simpler and is the one I am currently using but you have to have the module file inside the same folder as your code
		None of them seem to have a way to incoorperate several files into one module so we can either put all the library in one file or do lots of little modules in the library
		Also I abbriviated the library name to lsl :)]]

--Requires
local ui = require "ui"


--Loads
function love.load()
	--N/A
	ui.test()
end

--Updates
function love.update()
	--N/A
end

--Drawing
function love.draw()
	--N/A
end

--NOTE TO ANYONE USING THIS LIBRARY: main.lua is un-needed as none of the functions are stored here. Only use this file for experimentations with the library.