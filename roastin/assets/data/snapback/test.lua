function onCreate()
    makeLuaSprite("lahud", "", -500, -200)
    makeGraphic("lahud", 4000, 4000, "FF67D5")
    addLuaSprite("lahud")
    setObjectOrder("lahud", 289)

    makeLuaSprite("lavoid", "", -500, -200)
    makeGraphic("lavoid", 4000, 4000, "FFFFFF")
    addLuaSprite("lavoid")
    makeLuaSprite("laflash", "", -5000, -4000)
    makeGraphic("laflash", 12000, 10000, "FF67D5")
    addLuaSprite("laflash")
    makeLuaSprite("laswitch", "", -500, -200)
    makeGraphic("laswitch", 4000, 4000, "FFFFFF")
    setObjectCamera("laswitch", "other")
    addLuaSprite("laswitch")
end

function onCreatePost()
    setProperty("iconP1.visible", false)
    setProperty("iconP2.visible", false)
    setProperty("scoreTxt.visible", false)
    setProperty("timeBar.visible", false)
    setProperty("timeBarBG.visible", false)
    setProperty("timeTxt.visible", false)
    setProperty("cn_fg.alpha", 0)
    setProperty("gf.alpha", 0)
    setProperty("healthBarHigh.visible", false)
    setProperty("healthBarBG.visible", false)
    setProperty("songTxt.visible", false)
    setProperty("healthBarWN.visible", false)
    setProperty("healthBar.visible", false)

    setProperty("judgementCounter.visible", false)

    setProperty("healthStrips.visible", false)
    setProperty("boyfriend.color", 0)
    setProperty("dad.color", 0)
    setProperty("mordo.color", 0)

    setProperty("testlol.visible", false)
    setProperty("testlol.alpha", 0)

    setProperty("boyfriend.alpha", 0)
    setProperty("dad.alpha", 0)
    setProperty("mordo.alpha", 0)
    setProperty("mordo-dkd.alpha", 0)

    --setProperty("testlol.alpha", 0.001)
    --setProperty("mordodkd.alpha", 0.001)
    setProperty("laflash.alpha", 0)
    setProperty("lahud.alpha", 0)
    setProperty("laswitch.alpha", 0)
    setProperty("laflash.alpha", 0.01)

    triggerEvent("Camera Follow Pos", 680, 1100)

    for i = 0, 7 do
        setPropertyFromGroup("strumLineNotes", i, "visible", false)
    end
end

local setInvis = false
local setVis = true
function onUpdatePost()
    if not setInvis and getProperty("mordodkd.alpha")>0.01 then
        setProperty("mordodkd.alpha", 0.0001)
        setObjectOrder("mordodkd", 9)
        setInvis = true
    end

    if not setVis and getProperty("mordodkd.alpha")<0.01 then
        setProperty("mordodkd.alpha", 1)
        setVis = true
    end
end

local lastStep = 0

function unstep(inputTime)
    return (lastStep < inputTime and curStep >= inputTime)
end

function onStepHit()
    if curStep == 64 or unstep(64) then
        doTweenAlpha("mordoAlphaTween", "mordo", 1, 1.2, "circOut")
    end
    if curStep == 83 or unstep(83) then
        doTweenAlpha("dadAlphaTween", "dad", 1, 1.2, "circOut")
    end
    if curStep == 112 or unstep(112) then
        doTweenAlpha("boyfriendAlphaTween", "boyfriend", 1, 1.6, "circOut")
    end
    if curStep == 128 or unstep(128) then
        for i = 0, 7 do
            setPropertyFromGroup("strumLineNotes", i, "visible", true)
        end
        setProperty("laswitch.alpha", 1)
        doTweenAlpha("theswitch", "laswitch", 0, 1.92, "circOut")

        setProperty("cameraSpeed", 99)
        setProperty("lahud.alpha", 1)
        doTweenAlpha("thehud", "lahud", 0, 1.92, "circOut")
        setProperty("laflash.alpha", 1)
    end
    if curStep == 265 or unstep(265) then
        doTweenZoom("raaa", "camGame", 0.07, 0.79, "expoIn")
    end
    if curStep == 272 or unstep(272) then
        triggerEvent("Camera Follow Pos")
        setProperty("mordo.alpha", 0)
        setProperty("cameraSpeed", 1.5)
        setProperty("laswitch.alpha", 1)
        doTweenAlpha("theswitch", "laswitch", 0, 1.92, "circOut")
        setProperty("lavoid.alpha", 0)
        setProperty("iconP1.visible", true)
        setProperty("iconP2.visible", true)
        setProperty("scoreTxt.visible", true)
        setProperty("timeBar.visible", true)
        setProperty("timeBarBG.visible", true)
        setProperty("timeTxt.visible", true)
        setProperty("judgementCounter.visible", true)
        setProperty("songTxt.visible", true)
        setProperty("cn_fg.alpha", 1)
        setProperty("cn_bg2.alpha", 1)
        setProperty("gf.alpha", 1)
        setProperty("healthBarHigh.visible", true)
        setProperty("healthBarBG.visible", true)
        setProperty("healthBarWN.visible", true)
        setProperty("healthBar.visible", true)
        setProperty("healthStrips.visible", true)
        setProperty("mordodkd.visible", true)
        setVis = false
        setProperty("testlol.alpha", 1)
        setProperty("testlol.visible", true)
        setProperty("boyfriend.color", getColorFromHex("FFFFFF"))
        setProperty("dad.color", getColorFromHex("FFFFFF"))
        setProperty("mordo.color", getColorFromHex("FFFFFF"))
        setProperty("laflash.alpha", getColorFromHex("FFFFFF"))
        setProperty("lahud.alpha", getColorFromHex("FFFFFF"))
    end
    lastStep = curStep
end

