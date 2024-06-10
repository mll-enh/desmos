function onCreate()
	precacheImage('characters/playablebb')
	addCharacterToList('playablebb-dead','boyfriend')
    setPropertyFromClass('GameOverSubstate', 'characterName', 'playablebb-dead'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --Put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
function onCreatePost()
	if isStoryMode then
		makeLuaSprite('intro1-3','cutscenes/intro1-3',0,0)
		scaleObject('intro1-3', 2.0, 2.0);
		addLuaSprite('intro1-3',true)
		setObjectCamera('intro1-3','other')
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
		setProperty('intro1-3.visible',false)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'dialoguemusic0');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	if count == 1 then
		setObjectCamera('intro1-3','hud')
		playSound('dialogVoice/alw/1')
	elseif count == 2 then
		playSound('dialogVoice/alw/2')
	elseif count == 3 then
		playSound('dialogVoice/alw/3')
	elseif count == 5 then
		playSound('dialogVoice/alw/4')
	elseif count == 6 then
		playSound('dialogVoice/alw/5')
	elseif count == 8 then
		playSound('dialogVoice/alw/6')
	elseif count == 9 then
		playSound('dialogVoice/alw/7')
	elseif count == 10 then
		playSound('dialogVoice/alw/8')
	end
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end