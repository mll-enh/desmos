local camSpeed = 20;

function onCreate()
	setProperty('camHUD.visible',true);
	-- background shit

	setPropertyFromClass('GameOverSubstate', 'characterName', 'BF-Cassette'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'electricShock'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

	makeLuaSprite('cyber', 'cyberCity/uhh', -500, -250);
	setScrollFactor('cyber', 0.5, 0.5);
	addLuaSprite('cyber', false);

	
	makeLuaSprite('floor', 'cyberCity/ground', -400, -150);
	setScrollFactor('floor', 0.9, 0.9);
	addLuaSprite('floor', false);

	makeAnimatedLuaSprite('daPeeps', 'cyberCity/CG_bopsEvil', -350,320)
	addAnimationByPrefix('daPeeps', 'bounce', 'bopsEvil', 24)
	addLuaSprite('daPeeps',false)
	objectPlayAnimation('daPeeps', 'bounce',false)

	if not lowQuality then
		makeLuaSprite('roof', 'cyberCity/thing roof', -300, -100);
		setScrollFactor('roof', 0.9, 0.9);
		addLuaSprite('roof', false);
	end

	makeAnimatedLuaSprite('daPortal', 'cyberCity/goonAppear', -230,30)
	addAnimationByPrefix('daPortal', 'open', 'portalOpen',24,false)
	objectPlayAnimation('daPortal', 'open',false)
	precacheImage('cyberCity/goonAppear')

	if not lowQuality then
		makeAnimatedLuaSprite('rainDrop', 'cyberCity/rain', -510,-300)
		addAnimationByPrefix('rainDrop', 'bounce', 'rain tho',48,true)
		addLuaSprite('rainDrop',true)
		objectPlayAnimation('rainDrop', 'bounce',false)
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
		makeAnimatedLuaSprite('cameraEffect2', 'cyberCity/cameraBroke', -110, -40)
		addAnimationByPrefix('cameraEffect2', 'blink', 'camera broken',24,true)
		setScrollFactor('cameraEffect2', 0, 0);
		objectPlayAnimation('cameraEffect2', 'blink',false)
		targetAlpha = tonumber(1);
			setProperty('cameraEffect.alpha', targetAlpha);
		scaleObject('cameraEffect2', '1.3','1.3');
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

	makeAnimatedLuaSprite('daKick', 'cyberCity/cgNO', -820,-680)
	addAnimationByPrefix('daKick', 'kick', 'SPLAT',24,false)
	
	if not lowQuality then
		makeAnimatedLuaSprite('ui', 'UI_text', -400,250)
		addAnimationByPrefix('ui', 'text', 'malfunctionText',32,true)
		objectPlayAnimation('ui', 'text',false)
		setObjectCamera('ui', 'hud')
		addLuaSprite('ui',true)
	end

	makeAnimatedLuaSprite('daError', 'cyberCity/error', -110,-50)
	addAnimationByPrefix('daError', 'damn', 'uhoh',24,false)
	setScrollFactor('daError', 0, 0)
	objectPlayAnimation('daError', 'damn',false)
	setObjectCamera('daError', 'game');
	scaleObject('daError', '1.1','1.1');

	addCharacterToList('Goon','dad') --precaching shit, won't fuck up your game, or it will idk lol
	precacheImage('cyberCity/cgNO');
	precacheImage('cyberCity/rain');
	precacheImage('cyberCity/CG_bopsEvil');
	precacheImage('cyberCity/droplets');
	precacheImage('cyberCity/camera');
	precacheImage('cyberCity/cameraBroke');
	precacheImage('cyberCity/goonAppear');
	precacheImage('cyberCity/ground');
	precacheImage('cyberCity/error');
	precacheImage('cyberCity/thing roof');
	precacheImage('cyberCity/uhh');
	precacheSound('Lighting');
end

stepHitFuncs = {
	[5] = function()
		
		doTweenX('move', 'ui', 0, 1, 'smootherStepOut')
		playSound('CGSFX', 0.3);
	end,
	
	[32] = function()
		
		cameraFlash('camGame', 'FF0000', 0.3, false)
	end,
	[36] = function()
		cameraFlash('camGame', 'FF0000', 0.3, false)
	end,
	[40] = function()
		cameraFlash('camGame', 'FF0000', 0.3, false)
		doTweenX('move', 'ui', -400, 2, 'smootherStepOut')
	end,
	[44] = function()
		cameraFlash('camGame', 'FF0000', 0.3, false)
		removeSprite('ui',false)	
	end,
	[48] = function()
		cameraFlash('camGame', 'FF0000', 0.3, false)
	end,
	[52] = function()
		cameraFlash('camGame', 'FF0000', 0.3, false)
	end,
	[56] = function()
		cameraFlash('camGame', 'FF0000', 0.3, false)
	end,
	[60] = function()
		cameraFlash('camGame', 'FF0000', 0.3, false)
	end,
	
	[80] = function()
		cameraFlash('camGame', 'FFFFFF', 1, false)
		playSound('Lighting', 0.3);
	end,
		
	[436] = function()
		cameraFlash('camGame', 'FFFFFF', 2, false)
		addLuaSprite('daPortal',false)
		doTweenZoom('come on', 'camGame', 0.8, 2, 'circOut');
	end,
	
	[445] = function()
		addLuaSprite('daKick',true)
		objectPlayAnimation('daKick', 'kick',false)
		setScrollFactor('daKick', 0, 0)
		removeLuaSprite('daPortal',true)
		doTweenZoom('come on', 'camGame', 0.85, 0.5, 'circInOut');
	
	end,

	[447] = function()
		addLuaSprite('cameraEffect2',true)
		removeLuaSprite('cameraEffect',false)
		cameraShake('camGame', 0.15, 0.2)
	end,

	[452] = function()
		removeLuaSprite('daKick',true)
	end,

	[534] = function()
		cameraFlash('camGame', 'FFFFFF', 1, false)
		playSound('Lighting', 0.3);
	end,

	[680] = function()
		cameraFlash('camGame', 'FFFFFF', 1, false)
		playSound('Lighting', 0.3);
	end,
	
	[709] = function()
		setProperty('camHUD.visible',false);
		
		setProperty('boyfriend.alpha', 0)
		setProperty('gf.alpha', 0)
		setProperty('dad.alpha', 0)
		removeLuaSprite('rainDrop',true)
		removeLuaSprite('daPeeps',true)
		removeLuaSprite('cameraEffect',true)
		removeLuaSprite('cameraEffect2',true)
		removeLuaSprite('cyber',true)
		removeLuaSprite('floor',true)
		removeLuaSprite('roof',true)
		removeLuaSprite('rain',true)
		removeLuaSprite('rainEffect',true)
		addLuaSprite('daError',true)
		
	end,
	
	[736] = function()
		playSound('turnoff', 0.3);
	end,

	
	[760] = function()
		cameraFade('camGame', '000000', 1, true)
	end
	
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end

function onBeatHit()
	objectPlayAnimation('daPeeps', 'bounce',true)

end

--447