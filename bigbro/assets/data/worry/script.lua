function onCreate()
	precacheImage('characters/bbworriedshadow_assets')
	addCharacterToList('bf-bbdark','boyfriend')
	precacheImage('characters/bbdeath2')
	addCharacterToList('bf-bbdark dead','boyfriend')
	precacheSound('light')
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bbdark dead'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --Put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
function onCreatePost()
	if isStoryMode then
		makeLuaSprite('phonecall','cutscenes/phonecall',0,0)
		addLuaSprite('phonecall',true)
		scaleObject('phonecall',1.76,1.76)
		setObjectCamera('phonecall','other')
	end
end
local allowCountdown = false
local playDialogue = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('bbIntro')
		allowCountdown = true
		playDialogue = true
		return Function_Stop
	elseif playDialogue then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0)
		playDialogue = false
		return Function_Stop
	end
	return Function_Continue
end
function onCountdownTick(counter)
	if counter == 0 then
		setProperty('phonecall.visible',false)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'dialoguemusic0')
	end
end
function onNextDialogue(count)
	if count == 1 then
		setObjectCamera('phonecall','hud')
		playSound('dialogue/worry/bb/1')
	elseif count == 2 then
		playSound('dialogue/worry/bb/2')
	elseif count == 3 then
		playSound('dialogue/worry/bb/3')
	end
end