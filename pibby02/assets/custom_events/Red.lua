function onEvent(n,v1,v2)
	if n == "Red" then
		if not lowQuality then
			runTimer('hide',1);
			makeAnimatedLuaSprite('redload','red',-250,-150)
			addAnimationByPrefix('redload','redpog','red appear',14,true)
			objectPlayAnimation('redload','redpog',false)
			setScrollFactor('redload', 0, 0);
			scaleObject('redload', 1.4, 1.4);
			setObjectCamera('redload', 'other');
			addLuaSprite('redload', true);
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'hide' then
		removeLuaSprite('redload', false);
    end
end
