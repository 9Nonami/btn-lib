local buttonGroup = {}

function buttonGroup.update(btns, mx, my, mousePressed, s, gyo)
	local localId
	for i = 1, #btns do
		localId = btns[i].update(mx, my, mousePressed, s, gyo)
		if localId ~= -1 then
			return localId
		end
	end
	return -1
end

function buttonGroup.draw(btns, s, gyo)
	for i = 1, #btns do
		btns[i].draw(s, gyo)
	end
end

function buttonGroup.reset(btns)
	for i = 1, #btns do
		btns[i].reset()
	end
end

return buttonGroup