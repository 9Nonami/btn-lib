local btn = require("btn")
local buttonGroup = require("buttonGroup")

local s = 1
local gyo = 0

local btns

function love.load()
	local stan = love.graphics.newImage("stan.png")
	local focus = love.graphics.newImage("focus.png")
	local audio = love.audio.newSource("click.wav", "static")
	local bt1 = btn.create(0, 0, stan, focus, 1, audio)
	local bt2 = btn.create(40, 0, stan, focus, 2, audio)
	btns = {bt1, bt2}
end

function love.update()
	local mx = love.mouse.getX()
	local my = love.mouse.getY()
	buttonGroup.update(btns, mx, my, false, s, gyo)
end

function love.draw()
	buttonGroup.draw(btns, s, gyo)
end