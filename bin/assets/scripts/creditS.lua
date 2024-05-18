function onStepHit()
	if curStep == 240 then

		makeLuaSprite('credits', 'credits', 200, -1200);
		scaleObject('credits', 1.0, 1.0);
		addLuaSprite('credits', false);
		setProperty('credits.visible', true);
		setObjectCamera('credits', 'other');

		doTweenY("credits", "credits", -0, 2, "linear")	
	end
	if curStep == 380 then
		doTweenY("credits", "credits", -780, 2, "linear")
	end
	end