function onCreate()
	-- background shit
	makeLuaSprite('victoriaSecret', 'victoriaSecret/wall base', -500, -280);
	setScrollFactor('victoriaSecret', 0.9, 0.9);
	addLuaSprite('victoriaSecret', false);
	
	if songName == 'foreplay' then
		makeAnimatedLuaSprite('bop1', 'victoriaSecret/mom_bop', 50,200)
		addAnimationByPrefix('bop1', 'bounce', 'mommy',24,true)
		addLuaSprite('bop1',false)
		objectPlayAnimation('bop1', 'bounce',false)
	end

	if songName == 'aye-papi' then
		makeAnimatedLuaSprite('bop2', 'victoriaSecret/BGBops2', 850,200)
		addAnimationByPrefix('bop2', 'bounce', 'BGbops2',24,true)
		addLuaSprite('bop2',false)
		objectPlayAnimation('bop2', 'bounce',false)
	end
	
	if not lowQuality then
		makeLuaSprite('lightShit', 'victoriaSecret/chand', 320, -200);
		setScrollFactor('lightShit', 0.9, 0.9);
		addLuaSprite('lightShit', false);
		setScrollFactor('lightShit', 0.9,0.9);
	end

	if not lowQuality then
		makeLuaSprite('overLight', 'victoriaSecret/blurryShit', 1150, 0);
		setScrollFactor('overLight', 0.9, 0.9);
		addLuaSprite('overLight', false);
		setScrollFactor('overLight', 0.9,0.9);
	end

	if not lowQuality then
		makeLuaSprite('light', 'victoriaSecret/daLights', -100, -100);
		setScrollFactor('light', 0.9, 0.9);
		addLuaSprite('light', true);
	end
	
	
	makeAnimatedLuaSprite('bop', 'victoriaSecret/FG_bops', -210,400)
	addAnimationByPrefix('bop', 'bounce1', 'FG BOPS',24,true)
	addLuaSprite('bop',true)
	objectPlayAnimation('bop', 'bounce1',true)
	setScrollFactor('bop', 0.6, 0.6);
	
	
	makeAnimatedLuaSprite('ui', 'UI_text', -400,250)
	addAnimationByPrefix('ui', 'text', 'foreplayText',32,true)
	objectPlayAnimation('ui', 'text',false)
	setObjectCamera('ui', 'hud')
	addLuaSprite('ui',true)

	if not lowQuality then
		makeLuaSprite('action', 'tunnel/movie bars', -500, -200);
		setScrollFactor('action', 0, 0);
		addLuaSprite('action', true);
		setObjectCamera('action', 'hud')
		setObjectOrder('action',  1)
	end

	makeAnimatedLuaSprite('rate', 'ratings', 300,200)
	addAnimationByPrefix('rate', 'baddie', 'baddieRating',24,false)
	setScrollFactor('rate', 0, 0);
	setObjectCamera('rate', 'hud')

	--precaching shart
	precacheImage('victoriaSecret/FG_bops');
	precacheImage('victoriaSecret/daLights');
	precacheImage('victoriaSecret/blurryShit');
	precacheImage('victoriaSecret/chand');
	precacheImage('victoriaSecret/mom_bop');
	precacheImage('victoriaSecret/wall base');

end


function onBeatHit()
	objectPlayAnimation('bop', 'bounce1',true)
	objectPlayAnimation('bop1', 'bounce',true)


	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		characterPlayAnim('boyfriend','idle',true)
	end

	if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad','idle',true)
	end
end

stepHitFuncs = { --ui thingies

	[5] = function()
		if songName == 'foreplay' then
			doTweenX('move', 'ui', 0, 1, 'smootherStepOut')
			playSound('JasmineSFX', 0.4);
		end
	end,

	[60] = function()
		if songName == 'foreplay' then
			doTweenX('move', 'ui', -400, 2, 'smootherStepOut')	
		end
	end,
	
	[65] = function()
		removeSprite('ui',false)	
	end,

	[519] = function()
		if rating > 0.9 and songName == 'aye-papi' then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'baddie',false)
			runTimer('daRating', 1.6, 1);
			playSound('rate', 1);
		end
	end,

	[970] = function()
		if rating > 0.9 and songName == 'foreplay' then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'baddie',false)
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

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'daRating' then
		removeLuaSprite('rate'); --removing her to make the game run slightly better
	end
end
