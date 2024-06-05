--script by ImaginationSuperHero52806

--[[Settings... cause why not?]]--

local prefs = {
	move = 10, -- How much the note should move (if a pixel stage its divided by 2)
	shouldPixelMove = true, -- Should pixel have its own stuff
	tween = 'circOut', -- Pick a tween ig
	tweenPixel = 'sineOut', -- Pixel if you want to
	--tweenHeld = 'quadIn', -- When it returns after being held, also no pixel var cause lazy
	wierdStupidKindaDumb = true, -- Basically a wierd Countdown thing WIP added
	onSickHit = true -- When on when you don't get get a sick or good the tween doesn't play (doesn't work right now)
}

--[[For new coders I recommend you don't touch the code below!]]--
local strumLinePlayer
local strumLineOpponent
local sicks
local goods
local moveAmount
local tweenAmount
local tweenType
--local tweenBackType
local isPixelStage
local isSustainNote
function onCreatePost()
    isPixelStage = getPropertyFromClass('PlayState', 'isPixelStage')
    for i = 0, 3 do
        strumLinePlayer = getPropertyFromGroup('strumLineNotes', i + 4, 'y')
        strumLineOpponent = getPropertyFromGroup('strumLineNotes', i, 'y')
    end
    for i = 0, 7, getProperty("unspawnNotes.length") - 1 do
        isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote')
    end
    sicks = getProperty("sicks")
    goods = getProperty("goods")
end

function onUpdatePost(elapsed)
	--tweenBackType = prefs.tweenHeld
    if prefs.shouldPixelMove and isPixelStage then
        moveAmount = (downscroll and (prefs.move / 2) or (prefs.move / -2))
        tweenAmount = (scrollSpeed / curBpm) * (moveAmount / 7)
        tweenType = prefs.tweenPixel
    elseif isPixelStage == false then
        moveAmount = (downscroll and prefs.move or (prefs.move / -1))
        tweenAmount = (scrollSpeed / curBpm) * (moveAmount / 5)
        tweenType = prefs.tween
    end
    --debugPrint(moveAmount .. ' ' .. tweenAmount .. ' ' .. curBpm)
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if prefs.wierdStupidKindaDumb then
    	for i = 0, 3 do
        	if counter == 3 then
        strumLinePlayer = getPropertyFromGroup('strumLineNotes', i + 4, 'y')
        strumLineOpponent = getPropertyFromGroup('strumLineNotes', i, 'y')
            	noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer + moveAmount / 2, tweenAmount, tweenType)
            	noteTweenY('moveOpponent' .. i, i, strumLineOpponent + moveAmount / 2, tweenAmount, tweenType)
        	elseif counter == 4 then
            	runTimer('returnPlayer' .. i, tweenAmount, 1)
            	runTimer('returnOpponent' .. i, tweenAmount, 1)
        	end
    	end
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    for i = 0, 3 do
        if prefs.onSickHit and sicks or goods then
            if noteData == i then
                noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer + moveAmount, tweenAmount, tweenType)
                runTimer('returnPlayer' .. i, tweenAmount, 1)
            end
        end
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    for i = 0, 3 do
        if noteData == i then
            noteTweenY('moveOpponent' .. i, i, strumLineOpponent + moveAmount, tweenAmount, tweenType)
            runTimer('returnOpponent' .. i, tweenAmount, 1)
        end
    end
end

function onTimerCompleted(tag, loop, loopsLeft)
    for i = 0, 3 do
        if tag == 'returnPlayer' .. i then
            --[[if isSustainNote then
                noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer, tweenAmount * 5, tweenBackType)
            else]]
                noteTweenY('movePlayer' .. i, i + 4, strumLinePlayer, tweenAmount, tweenType)
            --end
        elseif tag == 'returnOpponent' .. i then
            --[[if isSustainNote then
                noteTweenY('moveOpponent' .. i, i, strumLineOpponent, tweenAmount * 5, tweenBackType)
            else]]
                noteTweenY('moveOpponent' .. i, i, strumLineOpponent, tweenAmount, tweenType)
            --end
        end
    end
end



local Credits = { -- [[ ik wierd way to do this ]] --
	WIP = 'Script Creator', -- 'WIP Mod Maker/Modifier'
	ISH52806 = 'Basically helped overhaul the entire script' -- 'ImaginationSuperHero52806'
}

function onSongStart()
	if getPropertyFromClass('PlayState', 'chartingMode') then
	end
end