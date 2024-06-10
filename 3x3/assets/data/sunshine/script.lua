local defaultNotePos = {};

function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onStepHit()
    if curStep == 575 then
        setProperty('defaultCamZoom', 0.7)
        triggerEvent('Camera Follow Pos', getProperty('dad.x'), getProperty('dad.y'))
        doTweenY('characterFall', 'dadGroup', 1500, 1.2, 'elasticInOut')
    end
    if curStep == 581 then
        setProperty('dadGroup.y', 2000)
        setProperty('dadGroup.visible', false)
        setObjectCamera('dadGroup', 'hud')
    end
    if curStep == 583 then
        setProperty('dadGroup.visible', true)
        setProperty('dad.scale.x', 0.8)
        setProperty('dad.scale.y', 0.8)
        setProperty('dad.x', getProperty('dad.x') + 170)
        doTweenY('characterRise', 'dadGroup', 1000, 0.5, 'circInOut')
    end
    if curStep == 586 then
        cameraFlash('hud', '0xFF000000', 3)
        showUI(false)
        for i = 0,3 do setPropertyFromGroup('strumLineNotes', i, 'x', -1000) end
        for i = 4,7 do setPropertyFromGroup('strumLineNotes', i, 'x', -20 + (110 * i)) end
    end
    if curStep == 858 then  
        cameraFlash('hud', '0xFF000000', 3)
    end
    if curStep == 859 then
        showUI(true)
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
            noteTweenAlpha('naw'..i, i, 1, 0.001) 
        end
        setProperty('defaultCamZoom', 0.65)
        triggerEvent('Camera Follow Pos', '', '')
        setObjectCamera('dadGroup', 'game')
        setProperty('dad.scale.x', 1)
        setProperty('dad.scale.y', 1)
        setProperty('dad.x', getProperty('dad.x') - 170)
        setProperty('dad.y', 800)
    end
end

function mathlerp(from,to,i)return from+(to-from)*i end

function onUpdatePost()
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)

    if curStep > 573 and curStep < 581 then
        setProperty('camGame.zoom', mathlerp(getProperty('camGame.zoom'), 0.7, 0.03))
    end
    if curStep < 853 and curStep >= 587 then
        for i = 4,7 do 
            noteTweenAlpha('superCoolEffectThingLol' .. i, i, math.abs(math.sin((currentBeat+1*0.1)*math.pi)) + 0.145, 1.1)
        end     
    end
end

function onCreate()
    precacheImage('characters/B3_Tails_Doll_Alt')
end

function showUI(bool)
    setProperty('healthBar.visible', bool)
    setProperty('healthBarBG.visible', bool)
    setProperty('iconP1.visible', bool)
    setProperty('iconP2.visible', bool)
    setProperty('laneUnderlayP1.visible', bool)
    setProperty('laneUnderlayP2.visible', bool)
    setProperty('timeBar.visible', bool)
    setProperty('timeBarBG.visible', bool)
    setProperty('scoreTxt.visible', bool)
    setProperty('timeTxt.visible', bool)
end