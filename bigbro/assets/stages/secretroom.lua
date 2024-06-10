function onCreate()
	precacheImage('characters/BOYFRIEND')
	addCharacterToList('bf','boyfriend')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --Put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

	makeLuaSprite('thankyoubg','thankyoubg',-1055,-760)
	scaleObject('thankyoubg', 4.0, 4.0);
	addLuaSprite('thankyoubg',false)

	makeLuaSprite('thank_you_bg','thank_you_bg',-1055,-760)
	scaleObject('thank_you_bg', 4.0, 4.0);
	addLuaSprite('thank_you_bg',false)

	makeAnimatedLuaSprite('BG_bounce','BG_bounce',-1055,-760)
	scaleObject('BG_bounce', 2.0, 2.0);
	addLuaSprite('BG_bounce',false)
	addAnimationByPrefix('BG_bounce','BG bounce bounce bg','BG bounce bounce bg',24,false)

	makeLuaSprite('hidden_room','hidden_room',-750,-430)
	addLuaSprite('hidden_room',false)
	scaleObject('hidden_room',3.2,3.2)

	setObjectOrder('gfGroup',3)
end
function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('BG_bounce','BG bounce bounce bg',true)
	end
end
function onStepHit()
	if songName == 'thank-you' and curStep == 896 then
		doTweenAlpha('thank you','hidden_room',0,0.2,'quadInOut')
		setProperty('defaultCamZoom',0.5)
	end
	if songName == 'thank-you' and curStep == 1536 then
		doTweenAlpha('gf gone','gfGroup',0,0.5,'quadInOut')
		doTweenAlpha('people gone','BG_bounce',0,0.5,'quadInOut')
		doTweenY('text fall','thank_you_bg',-160,1,'elasticInOut')
	end
	if songName == 'thank-you' and curStep == 1664 then
		doTweenAlpha('bf gone','boyfriendGroup',0,0.2,'quadInOut')
		doTweenAlpha('kitty gone','dadGroup',0,0.2,'quadInOut')
	end
	if songName == 'thank-you' and curStep == 1728 then
		doTweenAlpha('bg gone','thankyoubg',0,0.2,'quadInOut')
	end
end
function onMoveCamera(focus)
	if songName == 'thank-you' and curStep >= 1536 then
		cameraSetTarget('dad')
	end
end