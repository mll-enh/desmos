function onCreate()
	-- background shit
	setPropertyFromClass('GameOverSubstate', 'characterName', 'BF-Cassette'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'electricShock'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	
	makeLuaSprite('cyber', 'cyberCity/uhh', -500, -250);
	setScrollFactor('cyber', 0.5, 0.5);
	addLuaSprite('cyber', false);

	
	makeLuaSprite('floor', 'cyberCity/ground', -200, -150);
	setScrollFactor('floor', 0.9, 0.9);
	addLuaSprite('floor', false);

	makeAnimatedLuaSprite('daPeeps', 'cyberCity/CG_bops', -370,300)
	addAnimationByPrefix('daPeeps', 'bounce', 'bops', 24)
	addLuaSprite('daPeeps',false)
	objectPlayAnimation('daPeeps', 'bounce',false)

	if not lowQuality then
		makeLuaSprite('roof', 'cyberCity/thing roof', -300, -100);
		setScrollFactor('roof', 0.9, 0.9);
		addLuaSprite('roof', false);
	end

	if not lowQuality then
		makeAnimatedLuaSprite('rainDrop', 'cyberCity/rain', -510,-300)
		addAnimationByPrefix('rainDrop', 'bounce', 'rain tho',48,true)
		addLuaSprite('rainDrop',true)
		objectPlayAnimation('rainDrop', 'cyberCity/bounce',false)
		setBlendMode('rainDrop', 'overlay')
		targetAlpha = tonumber(0.2);
			setProperty('rainDrop.alpha', targetAlpha);
	end
	
	if not lowQuality then
		makeAnimatedLuaSprite('cameraEffect', 'cyberCity/camera', -50, -10)
		addAnimationByPrefix('cameraEffect', 'blink', 'camera',24,true)
		addLuaSprite('cameraEffect',true)
		setScrollFactor('cameraEffect', 0, 0);
		objectPlayAnimation('cameraEffect', 'blink',false)
		targetAlpha = tonumber(1);
			setProperty('cameraEffect.alpha', targetAlpha);
		setBlendMode('cameraEffect', 'lighten')
	end

	if not lowQuality then
		makeLuaSprite('rainEffect', 'cyberCity/droplets', -100, -100);
		setScrollFactor('rainEffect', 0.9, 0.9);
		addLuaSprite('rainEffect', true);
		setScrollFactor('rainEffect', 0, 0);
		targetAlpha = tonumber(0.95);
			setProperty('rainEffect.alpha', targetAlpha);
		setBlendMode('rainEffect', 'add')
	end
	
	makeAnimatedLuaSprite('rate', 'ratings', 300,200)
	addAnimationByPrefix('rate', 'cool', 'coolRating',24,false)
	setScrollFactor('rate', 0, 0);
	setObjectCamera('rate', 'hud')

	--precaching shitt
	precacheImage('cyberCity/uhh');
	precacheImage('cyberCity/ground');
	precacheImage('cyberCity/thing roof');
	precacheImage('cyberCity/rain');
	precacheImage('cyberCity/CG_bops');
	precacheImage('cyberCity/droplets');
	precacheImage('cyberCity/camera');


end

function onBeatHit()
	objectPlayAnimation('daPeeps', 'bounce',true)

	if getProperty('dad.animation.curAnim.name') == 'idle' then
		characterPlayAnim('dad','idle',true)
	end

	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		characterPlayAnim('boyfriend','idle',true)
	end
end

stepHitFuncs = {
	
	[658] = function()
		if rating > 0.95 and songName == 'donnie-soft' then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'cool',false)
			runTimer('daRating', 1.6, 1);
			playSound('rate', 1);
		end
	end,
	[1055] = function()
		if rating > 0.95 and songName == 'kagayaku-kassetto' then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'cool',false)
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
