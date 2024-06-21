------------------------------------------------------------------------------SETTINGS-----------------------------------------------------------------------------------
--(its configured to be used on the test song)

------------important------------

local charid = "mordodkd" --it doesn´t matter what you put in here, it just has to be different than any other charid of the scripts in the folder

local id = 1 --only numbers, and as charid, always different than any other id of the scripts in the folder

----------miscellaneous----------

local hidebf = false --bf will do miss animations for every note and since i´m dumb i dont know how to fix it so you can hide it instead and of course, replace it with ANOTHER LUA CHARACTER!

--------character options--------

local alternatingidles = false --enabled: the character will idle between bfs idles, like, if bf idles in beats 2, 4 and 6, the character will idle in beats 1,3 and 5

local charimg = "mordecai_snapped" --use the image name from image/characters

local charpath = "characters/snapback/" -- in case you want to use another path

local charorder = 11 --use this if you want your character to be behind something, i used 1000 but normally you dont need more than 20

local flipx = false --in case you want to... well... flip your character x, this will break your offsets if you have any

local scale = 1.4

local notename = "mordo snapped sing" --what notetype will the character sing

local cameraoffset = {0, 0} --for the IC camera event

local charpos = {-250, 830} --position of the character in the stage
--x,y

------------animations-----------

--tip: if you have a .json of the character you can use it to fill this

--another tip =) : make your .json in the character editor and use it to fill this

local anims = {
    --i´ll use the idle as an example on how to fill this

    [1] = {"idle", 24, false, 0, 0, "idle"},
    --     prefix              framerate    is looped?    x offset    y offset    animation name     NOTE: changing the default animations names will only make them stop working in the event

    [2] = {"left", 24, false, 85, -95, "left"}, --left
    [3] = {"down", 24, false, -5, -54, "down"}, --down
    [4] = {"up", 24, false, -27, 137, "up"}, --up
    [5] = {"right", 24, false, -148, -68, "right"}, --right
    [6] = {"BF NOTE LEFT MISS", 24, false, -34, 19, "left-alt"}, --left-alt
    [7] = {"BF NOTE DOWN MISS", 24, false, -23, -16, "down-alt"}, --down-alt
    [8] = {"BF NOTE UP MISS", 24, false, 4, 27, "up-alt"}, --up-alt
    [9] = {"BF NOTE RIGHT MISS", 24, false, 46, 22, "right-alt"}, --right-alt
    --NOTE:to use alt animations add a notetype with the same name of the notetype variable but ending in -alt

    [10] = {"BF NOTE LEFT MISS", 24, false, -34, 19, "leftmiss"}, --leftmiss
    [11] = {"BF NOTE DOWN MISS", 24, false, -23, -16, "downmiss"}, --downmiss
    [12] = {"BF NOTE UP MISS", 24, false, 4, 27, "upmiss"}, --upmiss
    [13] = {"BF NOTE RIGHT MISS", 24, false, 46, 22, "rightmiss"}, --rightmiss
    --custom animations

    [14] = {"BF HEY!!", 24, false, 0, 3, "bfhey"},
    [15] = {"BF hit", 24, false, 0, 0, "bfhit"}

    --this works the same as the previous, NOTE: the character will stop idling until you hit a key or you make it do an idle with the event,
    --for the second option you have to fill in the event values as follows:
    --v1 = charid(the value you have chosen)
    --v2 = 1
}

----------animations settings------------

local opponent = true --if disabled, the character will not be able to idle until all the keys have been released, its not necessarily for opponents but you should always use it on opponents

local jsonoffsets = true --if enabled, all of the offsets will be multiplied by -1, this is to match the json offset sistem but if you usually work with lua sprites disabling this might be more intuitive

local nomissmode = false --if the character doesn´t have miss animations this will prevent the idle from stopping when you miss a note

local idlemissnumber = "0013" --the number of the frame the character does when it comes back from missing its usually the last frame of the idle animation

local comebackwithidle = false --if you dont want or dont know how to use idlemissnumber then enable this and the character will idle instead, it might look weird

-----------------------------------------------------------------------------SETTINGSN´T-----------------------------------------------------------------------------

local allowidle = {[id] = true}
local nextidle = {[id] = true}
local static = false
local beat = 0
local missstep = 0
function tablelength(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end

function onCreatePost()
    anim = 1

    makeAnimatedLuaSprite(charid, charpath .. charimg, charpos[1], charpos[2])

    setObjectOrder(charid, charorder)

    scaleObject(charid, scale, scale)

    if flipx then
        scaleObject(charid, -1, 1)
    end
    if alternatingidles then
        beat = 1
    end
    if hidebf then
        setProperty("boyfriend.alpha", 0)
    end
    if jsonoffsets then
        jsonorsprite = -1
    else
        jsonorsprite = 1
    end
    --debugPrint("" .. tablelength(anims))
    if anims[anim] ~= nil then
        setAnims(anims[anim])
        offsetcrap(anims[anim])
    end
end

function setAnims(curanim)
    animname = {
        "idle",
        "left",
        "down",
        "up",
        "right",
        "left-alt",
        "down-alt",
        "up-alt",
        "right-alt",
        "leftmiss",
        "downmiss",
        "upmiss",
        "rightmiss"
    }

    if not static then
        addAnimationByPrefix(charid, animname[anim] .. "static", curanim[1] .. idlemissnumber, curanim[2], curanim[3])
        static = true
    end

if curanim ~= nil then
    if anim > 13 then
        addAnimationByPrefix(charid, curanim[6], curanim[1] .. "0", curanim[2], curanim[3])
    else
        addAnimationByPrefix(charid, animname[anim], curanim[1] .. "0", curanim[2], curanim[3])
    end
end


    anim = anim + 1
    if anims[anim] ~= nil then
        setAnims(anims[anim])
    end
end

function onSongStart()
    if not alternatingidles then
        objectPlayAnimation(charid, "idle", true)
    end
end

function onCountdownTick(counter)
    if counter == 2 then
        onSongStart()
    end
    if alternatingidles and counter == 3 then
        objectPlayAnimation(charid, "idle", true)
    end
    if alternatingidles and counter == 1 then
        objectPlayAnimation(charid, "idle", true)
    end
end

function onStepHit()
    if miss then
        missstep = missstep + 1
        if missstep >= 23 then
            missidle()
            miss = false
        end
    else
        missstep = 0
    end
end
function onBeatHit()
    --apparently i dont know how to use if curBeat %2 == 1 then
    --UPDATE: i learned how to use it but i like this better :)
    beat = beat + 1
    if beat == 2 then
        idle()
        beat = 0
    end
end
function onSectionHit()
    if resetnextsection then
        resetnextsection = false
    end
end

function idle()
    if
        allowidle[id] and nextidle[id] and getProperty(charid .. ".animation.curAnim.name") == "idle" or
            getProperty(charid .. ".animation.curAnim.name") == "idlestatic"
     then --took that getProperty from Sir Top Hat´s LUACHAR script, but only that
        objectPlayAnimation(charid, "idle", true)
        offsetcrap(anims[1])
    else
        nextidle[id] = true
    end
end
function postnoteidle()
    objectPlayAnimation(charid, "idle", true)
    offsetcrap(anims[1])
    allowidle[id] = true
    nextidle[id] = false
end

function missidle()
    allowidle[id] = true
    if not comebackwithidle then
        objectPlayAnimation(charid, "idlestatic", true)
        offsetcrap(anims[1])
    elseif comebackwithidle then
        postnoteidle()
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    direction = {"left", "down", "up", "right"}

    if noteType == notename then
        miss = false
        objectPlayAnimation(charid, direction[noteData + 1], true)
        allowidle[id] = false
        runTimer(charid, 0.5, 1)
        offsetcrap(anims[noteData + 2])
    end
    if noteType == notename .. "-alt" then
        miss = false
        objectPlayAnimation(charid, direction[noteData + 1] .. "-alt", true)
        allowidle[id] = false
        runTimer(charid, 0.5, 1)
        offsetcrap(anims[noteData + 6])
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    direction = {"left", "down", "up", "right"}

    if noteType == notename then
        miss = false
        objectPlayAnimation(charid, direction[noteData + 1], true)
        allowidle[id] = false
        runTimer(charid, 0.5, 1)
        offsetcrap(anims[noteData + 2])
    end
    if noteType == notename .. "-alt" then
        miss = false
        objectPlayAnimation(charid, direction[noteData + 1] .. "-alt", true)
        allowidle[id] = false
        runTimer(charid, 0.5, 1)
        offsetcrap(anims[noteData + 6])
    end
end
function noteMiss(id, noteData, noteType, isSustainNote)
    if not nomissmode then
        direction = {"left", "down", "up", "right"}

        if noteType == notename or noteType == notename .. "-alt" then
            miss = true
            missstep = 0
            nextidle[id] = false
            objectPlayAnimation(charid, direction[noteData + 1] .. "miss", true)
            allowidle[id] = false
            offsetcrap(anims[noteData + 10])
        end
    end
end

function offsetcrap(curanim)
	if curanim ~= nil then
        setProperty(charid .. ".x", charpos[1] + curanim[4] * jsonorsprite)
        setProperty(charid .. ".y", charpos[2] + curanim[5] * jsonorsprite)
    end
end

function onTimerCompleted(name)
    if name == charid then
        if opponent then
            postnoteidle()
        elseif keyPressed("left") or keyPressed("down") or keyPressed("up") or keyPressed("right") then
            runTimer(charid .. "holdcheck", 0.01, 1)
        else
            postnoteidle()
        end
    end
    if name == charid .. "holdcheck" then
        if opponent then
            postnoteidle()
        elseif keyPressed("left") or keyPressed("down") or keyPressed("up") or keyPressed("right") then
            runTimer(charid .. "holdcheck", 0.01, 1)
        else
            postnoteidle()
        end
    end
end

function onEvent(n, v1, v2)
    if n == "IC play animation" then
        lol = tonumber(v2)
        if v1 == charid then
            eventAnimation(anims[lol])
        end
    end

    if n == "IC camera" then
        if v1 == charid then
            cameracontrol(v2)
        end
    end
end

function cameracontrol(mode)
    if mode == "3" then
        triggerEvent("Camera Follow Pos", "", "")
    end
    if mode == "2" then
        triggerEvent("Camera Follow Pos", charpos[1] + cameraoffset[1], charpos[2] + cameraoffset[2])
    end
    if mode == "1" then
        triggerEvent("Camera Follow Pos", charpos[1] + cameraoffset[1], charpos[2] + cameraoffset[2])
        triggerEvent("Camera Follow Pos", "", "")
    end
end
function eventAnimation(curanim)
    objectPlayAnimation(charid, curanim[6], true)
    setProperty(charid .. ".x", charpos[1] + curanim[4] * jsonorsprite)
    setProperty(charid .. ".y", charpos[2] + curanim[5] * jsonorsprite)
end

function onCreate()
    for i = 0, getProperty("unspawnNotes.length") - 1 do
        if
            getPropertyFromGroup("unspawnNotes", i, "noteType") == notename or
                getPropertyFromGroup("unspawnNotes", i, "noteType") == notename .. "-alt"
         then
            setPropertyFromGroup("unspawnNotes", i, "noAnimation", true)
        end
    end
end

