function onCreate()

	setProperty('cameraSpeed', 0.3)

	-- background shit
	makeLuaSprite('victoriaSecret', 'latinaLand/wallBG', -650, -480);
	setScrollFactor('victoriaSecret', 0.9, 0.9);
	addLuaSprite('victoriaSecret', false);
	scaleObject('victoriaSecret', '1.1','1');
	
	makeLuaSprite('comfy', 'latinaLand/bed', -550, 300);
	setScrollFactor('comfy', 0.9, 0.9);
	addLuaSprite('comfy', false);
	scaleObject('comfy', '1','1');
	
	makeLuaSprite('blank', 'latinaLand/blanket', -700, -25);
	setScrollFactor('blank', 1, 0.9);
	addLuaSprite('blank', true);
	scaleObject('blank', '1.1','1.1');

	if not lowQuality then
		makeAnimatedLuaSprite('drain1', 'latinaLand/hornyDrain', 500, 400)
		addAnimationByPrefix('drain1', 'pull', 'downBad',24, false)
		setScrollFactor('drain1', 0, 0)
		setObjectCamera('drain1', 'hud');
	end
	
	if not lowQuality then
		makeAnimatedLuaSprite('ui', 'UI_text', -400,250)
		addAnimationByPrefix('ui', 'text', 'sexText',32,true)
		objectPlayAnimation('ui', 'text',false)
		setObjectCamera('ui', 'hud')
		addLuaSprite('ui',true)
	end

	makeLuaSprite('light', 'victoriaSecret/daLights', -200, -100);
	setScrollFactor('light', 0.9, 0.9);
	addLuaSprite('light', true);
	setBlendMode('light', 'add')

	makeLuaSprite('dead', 'newYork/black', -120, -100);
	addLuaSprite('dead', true);
	setObjectCamera('dead', 'hud');

	makeAnimatedLuaSprite('rate', 'ratings', 300,200)
	addAnimationByPrefix('rate', 'baddie', 'baddieRating',24,false)
	setScrollFactor('rate', 0, 0);
	setObjectCamera('rate', 'hud')
	


	precacheImage('latinaLand/hornyDrain');
	precacheImage('latinaLand/blanket');
	precacheImage('latinaLand/bed');
	precacheImage('latinaLand/wallBG');
	precacheImage('victoriaSecret/daLights');
	
	
end


stepHitFuncs = {

	[5] = function()
		removeLuaSprite('dead', true);
		doTweenX('move', 'ui', 0, 1, 'smootherStepOut')
		playSound('JasmineSFX', 0.3);
		playSound('woosh', 0.4);
		cameraFlash('camGame', 'FFFFFF', 1, false)
	end,

	[60] = function()
		doTweenX('move', 'ui', -400, 2, 'smootherStepOut')	
	end,
	
	[65] = function()
		removeSprite('ui',false)	
	end,

	[256] = function()
		addLuaSprite('drain1', true)
		objectPlayAnimation('drain1', 'pull', true);
		
	end,
	
	[576] = function()
		addLuaSprite('drain1', true)
		objectPlayAnimation('drain1', 'pull', true);
	end,
	[704] = function()
		addLuaSprite('drain1', true)
		objectPlayAnimation('drain1', 'pull', true);

	end,
	
	[976] = function()
		if rating > 0.95 then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'sick',false)
			runTimer('daRating', 1.6, 1);
			playSound('rate', 1);
		end
	end
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end
	
function onBeatHit()
	objectPlayAnimation('bop', 'bounce',true)

	if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad','idle',true)
	end

	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		characterPlayAnim('boyfriend','idle',true)
	end
end

function onUpdate()

	setProperty('boyfriend.scrollFactor.x', 0.9);
	setProperty('boyfriend.scrollFactor.y', 0.9);
	
	setProperty('dad.scrollFactor.x', 0.9);
	setProperty('dad.scrollFactor.y', 0.9);

end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'daRating' then
		removeLuaSprite('rate'); --removing her to make the game run slightly better
	end
end


