function onCreate()
removeLuaScript("custom_events/zCameraFix")
  addLuaScript("custom_events/zCameraFix")
	setPropertyFromClass('GameOverSubstate', 'characterName', 'shitstain dead normal'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	
	makeLuaSprite('BROWN','bedroom/brownd',0,0)
	makeAnimatedLuaSprite('POOF','bedroom/poof',-300,-500)
	scaleObject('POOF', 1.3, 1.3);
	addAnimationByPrefix('POOF', 'yipee', 'poof poof', 24, false)
	addLuaSprite('BROWN')
	setObjectCamera('BROWN','camHUD')
	setBlendMode('BROWN','add')
	setProperty('BROWN.alpha',0)
	
end



function onBeatHit()
	
	if curBeat == 260 then
		addLuaSprite('POOF', true)
	end
	if curBeat == 262 then
		doTweenAlpha('adios','POOF',0,0.2,'linear')
	end

	if curBeat == 432 then
		doTweenAlpha('outch','camHUD',1,1.6,'sineInOut')
	end

	if curBeat == 190 then
		doTweenAlpha('oudddddtch','BROWN',0.25,2,'linear')
	end
	if curBeat == 254 then
		doTweenAlpha('ouddydddtch','BROWN',0,1.6,'linear')
	end

end

function onTweenCompleted(t,l,ll)

if t == 'outch' then


doTweenAlpha('outch2','camHUD',0.8,1.3,'sineInOut')

end
if t == 'outch2' then


doTweenAlpha('outch','camHUD',1,1.3,'sineInOut')

end


end