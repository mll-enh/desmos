function onStepHit()
	if curStep == 380 then

		makeLuaSprite('1', '1', 0, -1300);
		scaleObject('1', 0.3, 0.3);
		addLuaSprite('1', false);
		setProperty('1.visible', true);
		setObjectCamera('1', 'other');

		doTweenY("1", "1", 50, 2, "linear")	
	end
	if curStep == 435 then
		doTweenY("1", "1", 780, 2, "linear")
	end
	if curStep == 435 then

		makeLuaSprite('2', '2', -50, -1300);
		scaleObject('2', 0.3, 0.3);
		addLuaSprite('2', false);
		setProperty('2.visible', true);
		setObjectCamera('2', 'other');

		doTweenY("2", "2", 50, 2, "linear")	
	end
	if curStep == 490 then
		doTweenY("2", "2", 780, 2, "linear")
	end
	if curStep == 440 then

		makeLuaSprite('3000', '3000', 2000, 300);
		scaleObject('3000', 0.17, 0.17);
		addLuaSprite('3000', false);
		setProperty('3000.visible', true);
		setObjectCamera('3000', 'other');

		doTweenX("3000", "3000", 600, 2, "linear")	
	end
	if curStep == 490 then
		doTweenX("3000", "3000", 2000, 2, "linear")
	end
	if curStep == 900 then

		makeLuaSprite('tank', 'tank', -500, 200);
		scaleObject('tank', 0.25, 0.25);
		addLuaSprite('tank', false);
		setProperty('tank.visible', true);
		setObjectCamera('tank', 'other');

		doTweenX("tank", "tank", 50, 1, "linear")	
	end
	if curStep == 901 then
		doTweenX("tank", "tank", 1100, 1, "linear")
	end
	if curStep == 1410 then

		makeLuaSprite('tank', 'tank', -500, 200);
		scaleObject('tank', 0.25, 0.25);
		addLuaSprite('tank', false);
		setProperty('tank.visible', true);
		setObjectCamera('tank', 'other');

		doTweenX("tank", "tank", 50, 1, "linear")	
	end
	if curStep == 1411 then
		doTweenX("tank", "tank", 1100, 1, "linear")
	end
	end