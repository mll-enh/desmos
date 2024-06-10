local win = -1
function onCreate()
	makeLuaSprite('rooftopsky','prologue/rooftopsky',-145,-10)
	scaleObject('rooftopsky', 2.0, 2.0);
	addLuaSprite('rooftopsky',false)
	setScrollFactor('rooftopsky',0,0)

	makeLuaSprite('distantcity','prologue/distantcity',-150,-40)
	addLuaSprite('distantcity',false)
	scaleObject('distantcity', 1.7, 1.7)
	setScrollFactor('distantcity',0.3,0.3)

	makeLuaSprite('win0','prologue/win0',-150,-40)
	addLuaSprite('win0',false)
	scaleObject('win0', 1.7, 1.7)
	setScrollFactor('win0',0.3,0.3)
	setProperty('win0.alpha',0)

	makeLuaSprite('win1','prologue/win1',-150,-40)
	addLuaSprite('win1',false)
	scaleObject('win1', 1.7, 1.7)
	setScrollFactor('win1',0.3,0.3)
	setProperty('win1.alpha',0)

	makeLuaSprite('win2','prologue/win2',-150,-40)
	addLuaSprite('win2',false)
	scaleObject('win2', 1.7, 1.7)
	setScrollFactor('win2',0.3,0.3)
	setProperty('win2.alpha',0)

	makeLuaSprite('win3','prologue/win3',-150,-40)
	addLuaSprite('win3',false)
	scaleObject('win3', 1.7, 1.7)
	setScrollFactor('win3',0.3,0.3)
	setProperty('win3.alpha',0)

	makeLuaSprite('win4','prologue/win4',-150,-40)
	addLuaSprite('win4',false)
	scaleObject('win4', 1.7, 1.7)
	setScrollFactor('win4',0.3,0.3)
	setProperty('win4.alpha',0)

	makeLuaSprite('poll','prologue/poll',-425,-80)
	scaleObject('poll', 2.0, 2.0);
	addLuaSprite('poll',false)

	makeLuaSprite('rooftop','prologue/rooftop',-550,-80)
	scaleObject('rooftop', 2.0, 2.0);
	addLuaSprite('rooftop',false)
end
function onUpdate(elapsed)
	if win >= 5 then
		win = 0
	end
	if win == 0 then
		setProperty('win4.alpha',0)
		setProperty('win0.alpha',1)
	end
	if win == 1 then
		setProperty('win0.alpha',0)
		setProperty('win1.alpha',1)
	end
	if win == 2 then
		setProperty('win1.alpha',0)
		setProperty('win2.alpha',1)
	end
	if win == 3 then
		setProperty('win2.alpha',0)
		setProperty('win3.alpha',1)
	end
	if win == 4 then
		setProperty('win3.alpha',0)
		setProperty('win4.alpha',1)
	end
end
function onBeatHit()
	if curBeat % 4 == 0 then
		win = win+1
	end
end