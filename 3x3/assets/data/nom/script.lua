local gfx = 0

function onCreatePost()
    setProperty('skipCountdown', true)
    setProperty('camHUD.alpha', 0)
    makeLuaSprite('do', '', -900, -300)
    makeGraphic('do', 3000, 1500, '000000')
    addLuaSprite('do', true)

	setProperty('dad.alpha', 0)
	
    makeAnimatedLuaSprite('dada', 'characters/b3_gf_phase_3', getProperty('dad.x'), getProperty('dad.y'))
    addAnimationByPrefix('dada', 'talk', 'GF_TALK_START', 24 * (getPropertyFromClass("ClientPrefs", "dTime") and 1.5 or 1), false)
end

function onSongStart()
    setProperty('dada.y', getProperty('dada.y') + 295)
    setProperty('dada.x', getProperty('dada.x') + 150)
    addLuaSprite('dada')
    doTweenAlpha('voic', 'do', 0, 0.6, 'circInOut')
    characterPlayAnim('dad', 'talk', false)
    setProperty('dad.specialAnim', true)
    setProperty('camGame.zoom', 1.25)
    triggerEvent('Camera Follow Pos', 450, 500)
end

function onStepHit()
    if curStep == 56 then
        doTweenAlpha('cam', 'camHUD', 1, 0.5)
    end
    if curStep == 62 then
	    setProperty('do.y', 500)
    	setProperty('do.alpha', 1)
	    doTweenY('byebye', 'do', -2500, 1, 'cubeInOut')
    end
    if curStep == 64 then
        triggerEvent('Camera Follow Pos', '', '')
	    setProperty('dad.alpha', 1)
	    setProperty('dada.alpha', 0)
    end
    if curStep == 80 then
	    removeLuaSprite('do', true)
    end
    if curStep == 703 then 
        doTweenAlpha('cam', 'camHUD', 0, 0.25)
        setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.4)
    end
    if curStep == 742 then
        doTweenAlpha('cam', 'camHUD', 1, 1)
        setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.25) --keeps zoomed in a bit
    end
end