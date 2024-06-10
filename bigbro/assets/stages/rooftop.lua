function onCreate()
	makeLuaSprite('bg','rooftop/bg',-330,-150)
	addLuaSprite('bg',false)
	scaleObject('bg', 2.0, 2.0);
	setScrollFactor('bg',0,0)

	makeLuaSprite('buildings','rooftop/buildings',-725,-220)
	addLuaSprite('buildings',false)
	scaleObject('buildings',2.4,2.4)
	setScrollFactor('buildings',0.3,0.3)

	makeLuaSprite('lights','rooftop/lights',-725,-220)
	addLuaSprite('lights',false)
	scaleObject('lights',2.4,2.4)
	setScrollFactor('lights',0.3,0.3)

	makeLuaSprite('lamppost','rooftop/lamppost',-680,-200)
	addLuaSprite('lamppost',false)
	scaleObject('lamppost',2.2,2.2)

	makeLuaSprite('rooftop','rooftop/rooftop',-680,-150)
	addLuaSprite('rooftop',false)
	scaleObject('rooftop',2.2,2.2)
end
function onBeatHit()
	if curBeat % 4 == 0 then
		doTweenAlpha('lights1','lights',1,0.1,'linear')
	end
end
function onTweenCompleted(tag, loops, loopsLeft)
	if tag == 'lights1' then
		doTweenAlpha('lights2','lights',0.1,0.5,'linear')
	end
end