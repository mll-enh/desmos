function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-s'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --Put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
function onCreatePost()
	if isStoryMode then
		makeLuaSprite('intro1-1','cutscenes/intro1-1',0,0)
		scaleObject('intro1-1', 2.0, 2.0);
		addLuaSprite('intro1-1',true)
		setObjectCamera('intro1-1','other')

		makeLuaSprite('intro1-2','cutscenes/intro1-2',0,0)
		scaleObject('intro1-2', 2.0, 2.0);
		addLuaSprite('intro1-2',true)
		setObjectCamera('intro1-2','other')
		setProperty('intro1-2.visible',false)

		makeLuaSprite('intro1-3','cutscenes/intro1-3',0,0)
		scaleObject('intro1-3', 2.0, 2.0);
		addLuaSprite('intro1-3',true)
		setObjectCamera('intro1-3','hud')
		setProperty('intro1-3.visible',false)
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
		setObjectCamera('intro1-1','hud')
	elseif count == 2 then
		setProperty('intro1-1.visible',false)
		setProperty('intro1-2.visible',true)
	elseif count == 3 then
		setProperty('intro1-2.visible',false)
		setProperty('intro1-3.visible',true)
		playSound('dialogVoice/fam/1')
	elseif count == 4 then
		playSound('dialogVoice/fam/2')
	elseif count == 5 then
		playSound('dialogVoice/fam/3')
	elseif count == 6 then
		playSound('dialogVoice/fam/4')
	elseif count == 8 then
		playSound('dialogVoice/fam/5')
	elseif count == 9 then
		playSound('dialogVoice/fam/6')
	elseif count == 10 then
		playSound('dialogVoice/fam/7')
	elseif count == 12 then
		playSound('dialogVoice/fam/8')
	elseif count == 13 then
		playSound('dialogVoice/fam/9')
	elseif count == 15 then
		playSound('dialogVoice/fam/10')
	elseif count == 16 then
		playSound('dialogVoice/fam/11')
	elseif count == 17 then
		playSound('dialogVoice/fam/12')
	elseif count == 18 then
		playSound('dialogVoice/fam/13')
	end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end