function onCreate()
	precacheImage('characters/bbhappy')
	addCharacterToList('bf-bbhappy','boyfriend')
	precacheImage('characters/bbdeath2')
	addCharacterToList('bf-bbdark dead','boyfriend')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bbdark dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --Put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
function onCreatePost()
	if isStoryMode then
		makeLuaSprite('theboyschillin','cutscenes/theboyschillin',0,0)
		scaleObject('theboyschillin', 2.0, 2.0);
		addLuaSprite('theboyschillin',true)
		setObjectCamera('theboyschillin','other')
	end
end
local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function onCountdownTick(counter)
	if counter == 0 then
		setProperty('theboyschillin.visible',false)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'dialoguemusic0');
	end
end
function onNextDialogue(count)
	if count == 1 then
		setObjectCamera('theboyschillin','hud')
		playSound('dialogue/dontworry/bb/1')
	elseif count == 3 then
		playSound('dialogue/dontworry/bb/2')
	elseif count == 5 then
		playSound('dialogue/dontworry/bb/3')
	elseif count == 6 then
		playSound('dialogue/dontworry/bb/4')
	elseif count == 7 then
		playSound('dialogue/dontworry/bb/5')
	elseif count == 8 then
		playSound('dialogue/dontworry/bb/6')
	elseif count == 10 then
		playSound('dialogue/dontworry/bb/7')
	elseif count == 11 then
		playSound('dialogue/dontworry/bb/8')
	elseif count == 13 then
		playSound('dialogue/dontworry/bb/9')
	elseif count == 14 then
		playSound('dialogue/dontworry/bb/10')
	elseif count == 15 then
		playSound('dialogue/dontworry/bb/11')
	elseif count == 16 then
		playSound('dialogue/dontworry/bb/12')
	elseif count == 17 then
		playSound('dialogue/dontworry/bb/13')
	elseif count == 20 then
		playSound('dialogue/dontworry/bb/14')
	elseif count == 21 then
		playSound('dialogue/dontworry/bb/15')
	elseif count == 22 then
		playSound('dialogue/dontworry/bb/16')
	elseif count == 24 then
		playSound('dialogue/dontworry/bb/17')
	elseif count == 25 then
		playSound('dialogue/dontworry/bb/18')
	elseif count == 27 then
		playSound('dialogue/dontworry/bb/19')
	elseif count == 31 then
		playSound('dialogue/dontworry/bb/20')
	end
end