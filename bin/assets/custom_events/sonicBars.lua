local fastieX = 12
local fastieY = 0.2

local ye = false

function onCreate()
    makeLuaSprite('sosTop', 'hh', 0, -120)
    setObjectCamera('sosTop', 'hud')
    setObjectOrder('sosTop', getObjectOrder('strumLineNotes')-1)
    addLuaSprite('sosTop', true)
    setProperty('sosTop.flipY', true)

    makeLuaSprite('sosDwn', 'hh', -1280, screenHeight)
    setObjectCamera('sosDwn', 'hud')
    setObjectOrder('sosDwn', getObjectOrder('strumLineNotes')-1)
    addLuaSprite('sosDwn', true)

    doTweenX('sosTopTwX', 'sosTop', -1280, fastieX, 'linear')
    doTweenX('sosDwnTwX', 'sosDwn', 0, fastieX, 'linear')
end

function onUpdate()
    if getProperty('sosTop.x') == -1280 then
        setProperty('sosTop.x', 0)
        doTweenX('sosTopTwX', 'sosTop', -1280, fastieX, 'linear')
    end
    if getProperty('sosDwn.x') == 0 then
        setProperty('sosDwn.x', -1280)
        doTweenX('sosDwnTwX', 'sosDwn', 0, fastieX, 'linear')
    end

    if ye then
        doTweenY('sosTopTwY', 'sosTop', 0, fastieY, 'linear')
        doTweenY('sosDwnTwY', 'sosDwn', screenHeight-115, fastieY, 'linear')
    end
    if not ye then
        doTweenY('sosTopTwY', 'sosTop', -120, fastieY, 'linear')
        doTweenY('sosDwnTwY', 'sosDwn', screenHeight, fastieY, 'linear')
    end
end

function turnOn()
    if ye then ye = false else ye = true end
end

function onEvent(tag, v1, v2)
    if tag == 'sonicBars' then
        turnOn()

        if v1 == '' then
            setProperty('sosTop.color', getColorFromHex('4848E8'))
        else
            v1 = getColorFromHex(v1)
            setProperty('sosTop.color', v1)
        end
        if v2 == '' then
            setProperty('sosDwn.color', getColorFromHex('A22A35'))
        else
            v2 = getColorFromHex(v2)
            setProperty('sosDwn.color', v2)
        end
    end
end