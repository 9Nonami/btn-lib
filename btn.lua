local btn = {}

function btn.create(x, y, stan, focus, id, audio)
	local bt = {}
	bt.x = x
	bt.y = y
	bt.w = stan:getWidth()
	bt.h = stan:getHeight()
	bt.stan = stan
	bt.focus = focus
	bt.id = id
	bt.on = false
	bt.audio = audio
	bt.lockedAudio = false
	function bt.update(mx, my, mousePressed, s, gyo)
		local lx = bt.x*s
		local ly = (bt.y*s) + gyo
		local lw = bt.w*s
		local lh = bt.h*s
		bt.on = mx > lx and mx < lx + lw and my > ly and my < ly + lh
		if bt.on then
			if bt.audio and not bt.lockedAudio then
				bt.lockedAudio = true
				bt.audio:stop()
				bt.audio:play()
			end
			if mousePressed then
				return bt.id
			end
		else
			bt.lockedAudio = false
		end
		return -1
	end
	function bt.draw(s, gyo)
		local lx = bt.x*s
		local ly = (bt.y*s) + gyo
		if bt.on then
			love.graphics.draw(bt.focus, lx, ly, nil, s, s)
		else
			love.graphics.draw(bt.stan, lx, ly, nil, s, s)
		end
	end
	function bt.reset()
		bt.on = false
		bt.lockedAudio = false
		bt.audio:pause()
	end
	return bt
end

return btn