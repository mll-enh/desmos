-- script by ItsCapp don't steal, it's dumb

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'-3', '1'}
downoffsets = {'-2', '3'}
upoffsets = {'6', '-2'}
rightoffsets = {'4', '1'}

leftMissoffsets = {'-3', '5'}  -- you probably won't need these if it's for the opponent
downMissoffsets = {'-3', '3'}  --
upMissoffsets = {'0', '0'}    --
rightMissoffsets = {'6', '1'} --

-- alt animations, you don't need these if you're not gonna use them
leftAltoffsets = {'0', '0'}
downAltoffsets = {'0', '0'}
upAltoffsets = {'0', '0'}
rightAltoffsets = {'0', '0'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'BF PJ Idle'
left_xml_name = 'BF PJ Right'
down_xml_name = 'BF PJ Down'
up_xml_name = 'BF PJ Up'
right_xml_name = 'BF PJ Left'

left_miss_xml_name = 'BF PJ MISSRight'   -- you probably won't need these if it's for the opponent
down_miss_xml_name = 'BF PJ MISSDown'   --
up_miss_xml_name = 'BF PJ MISSUp'       --
right_miss_xml_name = 'BF PJ MISSLeft' --

left_alt_xml_name = 'left alt'
down_alt_xml_name = 'down alt'
up_alt_xml_name = 'up alt'
right_alt_xml_name = 'right alt'

-- basically horizontal and vertical positions
x_position = 649
y_position = 480

-- scales your character (set to 1 by default)
xScale = 2
yScale = 2

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = false

-- pretty self-explanitory
name_of_character_xml = 'BF_PJ'
name_of_character = 'standingbf2'
name_of_notetype = 'BF'
name_of_notetype2 = 'BFxBB' -- for multiple characters singing at the same time
--altnotetype = '' -- this is used for alt animations (uncomment if you use them)
--altnotetype2 = '' -- this is used for alt animations and singing at the same time (uncomment if you use them)

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = true
playablecharacter = true -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	precacheImage('characters/BF_Dead')
	addCharacterToList('standingbf2-dead','boyfriend')
	precacheImage('characters/bbstanddeath')
	addCharacterToList('bf-bb-standing-dead','boyfriend')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bb-standing-dead')

	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);

	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 30, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 30, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 30, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 30, false);

	addAnimationByPrefix(name_of_character, 'singLEFTmiss', left_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singDOWNmiss', down_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singUPmiss', up_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singRIGHTmiss', right_miss_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFT-alt', left_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singDOWN-alt', down_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singUP-alt', up_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character, 'singRIGHT-alt', right_alt_xml_name, 24, false);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_character, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_character, 'flipX', false);
	end

	scaleObject(name_of_character, xScale, yScale);


	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_character, 'alpha', 0)
	end
end
-- I know this is messy, but it's the only way I know to make it work on both sides.
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local altAnims ={"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == '' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bb-standing-dead')
	end
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'standingbf2-dead')
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
	if noteType == altnotetype or noteType == altnotetype2 then
        doIdle = false
        objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

        if direction == 0 then
            setProperty(name_of_character .. '.offset.x', leftAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', leftAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character .. '.offset.x', dowAltnoffsets[1]);
            setProperty(name_of_character .. '.offset.y', downAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);

            end
        elseif direction == 2 then
            setProperty(name_of_character .. '.offset.x', upAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', upAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character .. '.offset.x', rightAltoffsets[1]);
            setProperty(name_of_character .. '.offset.y', rightAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character, altAnims[direction + 1], true);
            end
        end
    end
end

local missAnims = {"singLEFTmiss", "singDOWNmiss", "singUPmiss", "singRIGHTmiss"}
function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == '' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bb-standing-dead')
	end
    if noteType == name_of_notetype or noteType == name_of_notetype2 then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'standingbf2-dead')
        doIdle = false
        objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
        if direction == 0 then
            setProperty(name_of_character .. '.offset.x', leftMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', leftMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character .. '.offset.x', downMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', downMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 2 then
            setProperty(name_of_character .. '.offset.x', upMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', upMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character .. '.offset.x', rightMissoffsets[1]);
            setProperty(name_of_character .. '.offset.y', rightMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_character, missAnims[direction + 1], true);
            end
        end
    end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_character, 'idle',true);
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation(name_of_character, 'idle',true);
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
	if counter == 0 then
		setProperty('ohnoitshim.visible',false)
	end
end
function onCreatePost()
	if isStoryMode then
		makeLuaSprite('ohnoitshim','cutscenes/ohnoitshim',0,0)
		addLuaSprite('ohnoitshim',true)
		scaleObject('ohnoitshim',1.76,1.76)
		setObjectCamera('ohnoitshim','hud')
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
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'killerdialoguemusic');
	end
end
function onNextDialogue(count)
	if count == 3 then
		playSound('dialogue/powerthrough/killer/1')
	elseif count == 4 then
		playSound('dialogue/powerthrough/killer/2')
	elseif count == 5 then
		playSound('dialogue/powerthrough/killer/3')
	elseif count == 6 then
		playSound('dialogue/powerthrough/killer/4')
	elseif count == 7 then
		playSound('dialogue/powerthrough/killer/5')
	elseif count == 8 then
		playSound('dialogue/powerthrough/killer/6')
	elseif count == 9 then
		playSound('dialogue/powerthrough/killer/7')
	elseif count == 10 then
		playSound('dialogue/powerthrough/killer/8')
	elseif count == 11 then
		playSound('dialogue/powerthrough/killer/9')
	elseif count == 14 then
		playSound('dialogue/powerthrough/killer/10')
	elseif count == 15 then
		playSound('dialogue/powerthrough/killer/11')
	elseif count == 17 then
		playSound('dialogue/powerthrough/killer/12')
	elseif count == 18 then
		playSound('dialogue/powerthrough/killer/13')
	elseif count == 19 then
		playSound('dialogue/powerthrough/killer/14')
	elseif count == 21 then
		playSound('dialogue/powerthrough/killer/15')
	elseif count == 22 then
		playSound('dialogue/powerthrough/killer/16')
	elseif count == 23 then
		playSound('dialogue/powerthrough/killer/17')
	elseif count == 24 then
		playSound('dialogue/powerthrough/bb/4')
	elseif count == 26 then
		playSound('dialogue/powerthrough/bb/5')
	elseif count == 28 then
		playSound('dialogue/powerthrough/killer/18')
	elseif count == 29 then
		playSound('dialogue/powerthrough/bb/6')
	end
end