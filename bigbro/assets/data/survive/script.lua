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
		makeLuaSprite('ohnoitshim','cutscenes/ohnoitshim',0,0)
		addLuaSprite('ohnoitshim',true)
		scaleObject('ohnoitshim',1.76,1.76)
		setObjectCamera('ohnoitshim','other')

		makeLuaSprite('kill','cutscenes/kill',0,0)
		addLuaSprite('kill',true)
		scaleObject('kill',1.76,1.76)
		setObjectCamera('kill','hud')
		setProperty('kill.visible',false)

		makeLuaSprite('trymebitch','cutscenes/trymebitch',0,0)
		addLuaSprite('trymebitch',false)
		scaleObject('trymebitch',1.76,1.76)
		setObjectCamera('trymebitch','hud')
		setProperty('trymebitch.visible',false)

		makeLuaSprite('bleeding','cutscenes/helpmebroimbleedingthefuckout',0,0)
		addLuaSprite('bleeding',false)
		scaleObject('bleeding',1.76,1.76)
		setObjectCamera('bleeding','hud')
		setProperty('bleeding.visible',false)

		makeLuaSprite('ending_card','cutscenes/ending_card',0,0)
		addLuaSprite('ending_card',false)
		scaleObject('ending_card',1.76,1.76)
		setObjectCamera('ending_card','other')
		setProperty('ending_card.visible',false)
	end
end
local allowCountdown = false
function onStartCountdown()
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
		setProperty('trymebitch.visible',false)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', 'killerdialoguemusic');
	end
end
local allowEnd = false
function onEndSong()
	setProperty('trymebitch.visible',true)
	setObjectCamera('trymebitch','other')
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true)
		startDialogue('dialogueEnd', 'killerdialoguemusic')
		allowEnd = true
		return Function_Stop
	end
	return Function_Continue;
end
function onNextDialogue(count)
	if count == 1 then
		setObjectCamera('ohnoitshim','hud')
		playSound('dialogue/survive/killer/1')
	elseif count == 2 then
		setProperty('ohnoitshim.visible',false)
		setProperty('kill.visible',true)
		playSound('dialogue/survive/gunhit/Impact')
	elseif count == 3 then
		playSound('dialogue/survive/bb/1')
	elseif count == 5 then
		playSound('dialogue/survive/killer/2')
	elseif count == 8 then
		playSound('dialogue/survive/killer/3')
	elseif count == 11 then
		playSound('dialogue/survive/bb/2')
	elseif count == 13 then
		playSound('dialogue/survive/killer/4')
	elseif count == 14 then
		playSound('dialogue/survive/bb/3')
	elseif count == 15 then
		setProperty('kill.visible',false)
		setProperty('trymebitch.visible',true)
	elseif count == 16 then
		playSound('dialogue/survive/bb/4')
	elseif count == 17 then
		playSound('dialogue/survive/bb/5')
	elseif count == 18 then
		playSound('dialogue/survive/bb/6')
	elseif count == 19 then
		playSound('dialogue/survive/bb/7')
	elseif count == 20 then
		playSound('dialogue/survive/killer/5')
	end

	if count == 21 then
		setObjectCamera('trymebitch','hud')
		playSound('dialogue/end/pants')
	elseif count == 22 then
		playSound('dialogue/end/killer/empty')
	elseif count == 23 then
		playSound('dialogue/end/killer/2')
	elseif count == 24 then
		playSound('dialogue/end/bb/2')
	elseif count == 26 then
		playSound('dialogue/end/killer/3')
	elseif count == 27 then
		playSound('dialogue/end/killer/4')
	elseif count == 28 then
		playSound('dialogue/end/bb/3')
	elseif count == 29 then
		playSound('dialogue/end/killer/5')
	elseif count == 30 then
		playSound('dialogue/end/killer/6')
	elseif count == 33 then
		playSound('dialogue/end/bb/4')
	elseif count == 34 then
		playSound('dialogue/end/bb/5')
	elseif count == 35 then
		playSound('dialogue/end/bb/6')
	elseif count == 36 then
		playSound('dialogue/end/killer/8')
	elseif count == 37 then
		playSound('dialogue/end/bb/7')
	elseif count == 38 then
		playSound('dialogue/end/killer/9')
	elseif count == 39 then
		playSound('dialogue/end/bb/8')
	elseif count == 40 then
		playSound('dialogue/end/bb/9')
	elseif count == 42 then
		playSound('dialogue/end/killerrunningawaylikealittlebitch')
	elseif count == 43 then
		setProperty('trymebitch.visible',false)
		setProperty('bleeding.visible',true)
	elseif count == 44 then
		playSound('dialogue/end/bb/10')
	elseif count == 46 then
		playSound('dialogue/end/bb/11')
	elseif count == 47 then
		playSound('dialogue/end/bb/12')
	elseif count == 49 then
		setProperty('bleeding.visible',false)
		setProperty('ending_card.visible',true)
	elseif count == 50 then
		setObjectCamera('ending_card','hud')
	elseif count == 53 then
		setProperty('camGame.alpha',0)
		doTweenAlpha('black','ending_card',0,0.2,'linear')
	end
end