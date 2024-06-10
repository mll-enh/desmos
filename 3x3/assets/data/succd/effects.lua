sucked = false

local defaultNotePos = {};
 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onStepHit()
    if curStep == 1 or curStep == 64 or curStep == 640 or curStep == 704 or curStep == 1280 or curStep == 1344 then
        setCameraPos(200, 500, true)
        setProperty('defaultCamZoom', 1.05)
        setProperty('camGame.zoom', 1.05)
    end
    if curStep == 32 or curStep == 96 or curStep == 672 or curStep == 736 or curStep == 1312 or curStep == 1376 then
        setCameraPos(1000, 650, true)
    end
    if curStep == 128 or curStep == 768 or curStep == 1408 then
        setCameraPos(600, 550, false)
    end
    if ((curStep >= 128 and curStep < 384) or (curStep >= 768 and curStep < 1024)) and curStep % 32 == 1 then
        setProperty('defaultCamZoom', 0.7)
        triggerEvent('Camera Follow Pos', 580, 640)
        runTimer('zoom', 0.35, 3)
        doTweenAlpha('deeeez nuts', 'camGame', 0.8, 0.3, 'linear')
    end
    if (curStep > 384 and curStep < 389) or (curStep > 1024 and curStep < 1029) then
        triggerEvent('Camera Follow Pos')
        setProperty('defaultCamZoom', 0.75)
        doTweenAlpha('deeeez nuts 2 the reckoning', 'camGame', 1, 0.3, 'linear')
    end
    if curStep == 1400 then
        --setup bars and zoom
        setProperty('defaultCamZoom', 0.95)

        makeLuaSprite('topBar', '', 0, -100)
        makeGraphic('topBar', 1280, 100, '000000')
        setObjectCamera('topBar', 'hud')
        addLuaSprite('topBar')
        doTweenY('zoomdown', 'topBar', 0, 0.4, 'circInOut')

        setObjectCamera('fade', 'game')
        setProperty('fade.x', 0)
        setProperty('fade.y', -30)
        setProperty('fade.scale.x', 2)
        setProperty('fade.scale.y', 2.5)

        makeLuaSprite('botBar', '', 0, 720)
        makeGraphic('botBar', 1280, 100, '000000')
        setObjectCamera('botBar', 'hud')
        addLuaSprite('botBar', true)
        doTweenY('zoomup', 'botBar', 620, 0.4, 'circInOut')

        doTweenAlpha('bye1', 'iconP1', 0, 0.4, 'circInOut')
        doTweenAlpha('godbye', 'laneUnderlayP1', 0, 0.4, 'circInOut')
        doTweenAlpha('helo', 'laneUnderlayP2', 0, 0.4, 'circInOut')
        doTweenAlpha('bye2', 'iconP2', 0, 0.4, 'circInOut')
        doTweenY('scoreup', 'scoreTxt', 590, 0.4, 'circInOut')

        doTweenY('byebye', 'timeBar', -200, 0.4, 'circInOut')

        setProperty('STRUM_OFFSET', -323)


    end
    if curStep == 1408 then
        sucked = true
    end
    if curStep == 1696 then
        doTweenAlpha('dadadada', 'camHUD', 0, 0.5, 'circInOut')
        doTweenY('yeet', 'topBar', 0, 0.4, 'circInOut')
        doTweenY('gbye', 'botBar', 720, 0.4, 'circInOut')
    end

    if ((curStep >= 128 and curStep < 384) or (curStep >= 768 and curStep < 1024) or (sucked)) and curStep % 4 == 0 then
        setProperty('fade.alpha', 0.85)
    end
end


function onTimerCompleted(t, l, ll)
    if t == 'zoom' then
        setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
        if ll == 0 then
            setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
            runTimer('zoomOut', 0.35, 4)
        end
    end
    if t == 'zoomOut' then
        setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
        if ll == 0 then
            for i = 0,7 do
                noteTweenAngle('WEEE'..i..curStep, i, (getPropertyFromGroup('strumLineNotes', i, 'angle') == 720 and 0 or 720), 0.5, 'circInOut')
            end
        end
    end
    if t == 'wee' then
        setProperty('cameraSpeed', getPropertyFromClass('ClientPrefs', 'camSpeed'))
    end
end

function math.lerp(a, b, t)
    return (b - a) * t + a;
end
function math.invlerp(a, b, t)
    return (t - a) / (b - a);
end

function setCameraPos(x, y, forced)
    setProperty('camFollow.x', x)
    setProperty('camFollow.y', y)
    setProperty('cameraSpeed', 10000)
    runTimer('wee', 0.1)
    if forced then
        triggerEvent('Camera Follow Pos', x, y)
    else
        triggerEvent('Camera Follow Pos', '', '')
    end
end

function onUpdate()
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 60)

    if curStep >= 384 and curStep <= 640 then
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + 17.5 * math.cos((currentBeat + i*0.15) * math.pi))
        end
    end
    if curStep >= 640 and curStep <= 645 then
        for i = 0,7 do
            noteTweenX("deeznuts " .. i, i, defaultNotePos[i + 1][1], 0.1, "linear")
            noteTweenY("fatdick " .. i, i, defaultNotePos[i + 1][2], 0.1, "linear")
        end
    end
    if curStep >= 1152 and curStep < 1280 then
        setProperty('camGame.zoom', math.lerp(getProperty('camGame.zoom'), 1.05, 0.000195))
        setProperty('defaultCamZoom', math.lerp(getProperty('defaultCamZoom'), 1.05, 0.00195))
    end
    if curStep > 1399 and curStep < 1440 then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', math.lerp(getPropertyFromGroup('strumLineNotes', i, 'x'), 415 + (i - 4) * 112, 0.05))
            setPropertyFromGroup('strumLineNotes', i, 'angle', math.lerp(getPropertyFromGroup('strumLineNotes', i, 'angle'), 720, 0.08))
        end
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', math.lerp(getPropertyFromGroup('strumLineNotes', i, 'alpha'), 0.2, 0.08))
        end
    end
    if sucked == true then
        setPropertyFromClass('ClientPrefs', 'hideHud', true);
    end
    if sucked == false then
        setPropertyFromClass('ClientPrefs', 'hideHud', false);
    end
    if getProperty('fade.alpha') > 0 then
        setProperty('fade.alpha', math.lerp(getProperty('fade.alpha'), 0, 0.055))
    end
end

function onUpdatePost()
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)

    if curStep > 1400 then
        for i = 0, getProperty('notes.length') - 1 do
            if getPropertyFromGroup('notes', i, 'mustPress') == false then
                setPropertyFromGroup('notes', i, 'copyAlpha', false);
                setPropertyFromGroup('notes', i, 'alpha', 0.2);
            end
        end
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'x', (600 - 560*math.sin((currentBeat+1*0.1)*math.pi)) + ((i - 1.5) * 112))
            setPropertyFromGroup('strumLineNotes', i, 'y', (downscroll and 570 or 50) + 25 * math.cos((currentBeat + i*0.5) * (math.pi * 2)))
        end
    end
end

function onCreatePost()
    if sucked == true then
        setProperty('STRUM_OFFSET', -323)
        setPropertyFromClass('ClientPrefs', 'hideHud', true);
    end
    makeLuaSprite('fade', 'menus/options/fade', 0, 0)
    setObjectCamera('fade', 'hud')
    --doTweenColor('deeznuts', 'fade', 'e605ff', 0.001, 'linear')
    --setProperty('fade.alpha', 0)
    addLuaSprite('fade', true)

    setProperty('fade.alpha', 0)
end

function onDestroy()
    setProperty('STRUM_OFFSET', 0)
    setPropertyFromClass('ClientPrefs', 'hideHud', false);
end

function onGameOver()
	if sucked == true then
        setProperty('STRUM_OFFSET', 0)
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onEndSong()
	if sucked == true then
        setProperty('STRUM_OFFSET', 0)
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onPause()
	if sucked == true then
		setProperty('STRUM_OFFSET', 0)
        setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onResume() -- lol put it back on
	if sucked == true then
        setProperty('STRUM_OFFSET', -323)
		setPropertyFromClass('ClientPrefs', 'hideHud', true);
	end
end