function onCreate()
	precacheImage('characters/bbstanddeath')
	addCharacterToList('bf-bb-standing-dead','boyfriend')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bb-standing-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --Put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
function onCreatePost()
	if isStoryMode then
		makeLuaSprite('rooftopChat','cutscenes/rooftopChat',0,0)
		addLuaSprite('rooftopChat')
		scaleObject('rooftopChat',1.76,1.76)
		setObjectCamera('rooftopChat','other')
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
		setProperty('rooftopChat.visible',false)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'dialoguemusic0');
	end
end
local allowEnd = false
function onEndSong()
	setProperty('rooftopChat.visible',true)
	setObjectCamera('rooftopChat','other')
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true)
		startDialogue('dialogueEnd', 'dialoguemusic0')
		allowEnd = true
		return Function_Stop
	end
	return Function_Continue;
end
function onNextDialogue(count)
	if count == 1 then
		setObjectCamera('rooftopChat','hud')
		playSound('dialogue/alwayshere/bb/1')
	elseif count == 2 then
		playSound('dialogue/alwayshere/bb/2')
	elseif count == 4 then
		playSound('dialogue/alwayshere/bb/3')
	elseif count == 5 then
		playSound('dialogue/alwayshere/bb/4')
	elseif count == 6 then
		playSound('dialogue/alwayshere/bb/5')
	elseif count == 8 then
		playSound('dialogue/alwayshere/bb/6')
	elseif count == 10 then
		playSound('dialogue/alwayshere/bb/7')
	elseif count == 12 then
		playSound('dialogue/alwayshere/bb/8')
	elseif count == 14 then
		playSound('dialogue/alwayshere/bb/9')
	elseif count == 15 then
		playSound('dialogue/alwayshere/bb/10')
	elseif count == 17 then
		playSound('dialogue/alwayshere/bb/11')
	elseif count == 19 then
		playSound('dialogue/alwayshere/bb/12')
	elseif count == 21 then
		playSound('dialogue/alwayshere/bb/13')
	elseif count == 23 then
		playSound('dialogue/alwayshere/bb/14')
	elseif count == 24 then
		playSound('dialogue/alwayshere/bb/15')
	elseif count == 26 then
		playSound('dialogue/alwayshere/bb/16')
	elseif count == 27 then
		playSound('dialogue/alwayshere/bb/17')
	elseif count == 29 then
		playSound('dialogue/alwayshere/bb/18')
	end

	if count == 30 then
		setObjectCamera('rooftopChat','hud')
		playSound('dialogue/powerthrough/bb/1')
	elseif count == 32 then
		playSound('dialogue/powerthrough/bb/2')
	elseif count == 33 then
		playSound('dialogue/powerthrough/bb/3')
	elseif count == 35 then
		playSound('dialogue/powerthrough/motherheckinglocksound/1')
	end
end