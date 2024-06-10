function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-worried'); --Character json file for the death animation
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

		makeLuaSprite('aftermath0','cutscenes/aftermath0',0,0)
		scaleObject('aftermath0', 2.0, 2.0);
		addLuaSprite('aftermath0')
		setObjectCamera('aftermath0','other')
		setProperty('aftermath0.visible',false)

		makeLuaSprite('aftermath1','cutscenes/aftermath1',0,0)
		scaleObject('aftermath1', 2.0, 2.0);
		addLuaSprite('aftermath1')
		setObjectCamera('aftermath1','hud')
		setProperty('aftermath1.visible',false)

		makeLuaSprite('aftermath2','cutscenes/aftermath2',0,0)
		scaleObject('aftermath2', 2.0, 2.0);
		addLuaSprite('aftermath2')
		setObjectCamera('aftermath2','hud')
		setProperty('aftermath2.visible',false)

		makeLuaSprite('aftermath3','cutscenes/aftermath3',0,0)
		scaleObject('aftermath3', 2.0, 2.0);
		addLuaSprite('aftermath3')
		setObjectCamera('aftermath3','hud')
		setProperty('aftermath3.visible',false)
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
local allowEnd = false
function onEndSong()
	setProperty('aftermath0.visible',true)
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true)
		startDialogue('dialogueEnd', 'dialoguemusic0')
		allowEnd = true
		return Function_Stop
	end
	return Function_Continue;
end
-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	if count == 1 then
		setObjectCamera('intro1-3','hud')
		playSound('dialogVoice/hea/1')
	elseif count == 2 then
		playSound('dialogVoice/hea/2')
	elseif count == 3 then
		playSound('dialogVoice/hea/3')
	elseif count == 5 then
		playSound('dialogVoice/hea/4')
	elseif count == 6 then
		playSound('dialogVoice/hea/5')
	elseif count == 7 then
		playSound('dialogVoice/hea/6')
	elseif count == 8 then
		playSound('dialogVoice/hea/7')
	elseif count == 10 then
		playSound('dialogVoice/hea/8')
	elseif count == 11 then
		playSound('dialogVoice/hea/9')
	end

	if count == 13 then
		setObjectCamera('aftermath0','hud')
		playSound('dialogVoice/end/1')
	elseif count == 14 then
		playSound('dialogVoice/end/2')
	elseif count == 15 then
		playSound('dialogVoice/end/3')
	elseif count == 16 then
		playSound('dialogVoice/end/4')
	elseif count == 19 then
		setProperty('aftermath0.visible',false)
		setProperty('aftermath1.visible',true)
		playSound('dialogVoice/end/5')
	elseif count == 20 then
		playSound('dialogVoice/end/6')
	elseif count == 21 then
		playSound('dialogVoice/end/7')
	elseif count == 22 then
		playSound('dialogVoice/end/8')
	elseif count == 23 then
		playSound('dialogVoice/end/9')
	elseif count == 24 then
		playSound('dialogVoice/end/10')
	elseif count == 25 then
		playSound('dialogVoice/end/11')
	elseif count == 26 then
		playSound('dialogVoice/end/12')
	elseif count == 28 then
		playSound('dialogVoice/end/13')
	elseif count == 29 then
		setProperty('aftermath1.visible',false)
		setProperty('aftermath2.visible',true)
		playSound('dialogVoice/end/14')
	elseif count == 30 then
		playSound('dialogVoice/end/15')
	elseif count == 31 then
		playSound('dialogVoice/end/16')
	elseif count == 32 then
		playSound('dialogVoice/end/17')
	elseif count == 33 then
		playSound('dialogVoice/end/18')
	elseif count == 35 then
		playSound('dialogVoice/end/19')
	elseif count == 36 then
		playSound('dialogVoice/end/20')
	elseif count == 37 then
		playSound('dialogVoice/end/21')
	elseif count == 38 then
		playSound('dialogVoice/end/22')
	elseif count == 39 then
		setProperty('aftermath2.visible',false)
		setProperty('aftermath3.visible',true)
		playSound('dialogVoice/end/23')
	elseif count == 40 then
		setObjectCamera('aftermath3','other')
	end
end