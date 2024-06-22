function onCreate()
    makeAnimatedLuaSprite('ENID_BGBOP', 'ENID_BGBOP', 290,200)
    addAnimationByPrefix('ENID_BGBOP', 'ENID_BGBOP', 'enid bop', 24, false)
    addLuaSprite('ENID_BGBOP', 0, 0)

    makeAnimatedLuaSprite('RAD_BGBOP', 'RAD_BGBOP', -310,50)
    addAnimationByPrefix('RAD_BGBOP', 'RAD_BGBOP', 'rad bop', 24, false)
    addLuaSprite('RAD_BGBOP', 0, 0)

    makeLuaSprite('powFlicker', '', 0, 0);
    makeGraphic('powFlicker',1280,720,'B11BC6')
      addLuaSprite('powFlicker', true);
      setObjectCamera('powFlicker', 'other')
      setProperty('powFlicker.scale.x',2)
      setProperty('powFlicker.scale.y',2)
      setProperty('powFlicker.alpha',0)
    setBlendMode('powFlicker', 'multiply')

    makeLuaSprite('spookyvignette', 'spookyvignette', 0,0)
    addLuaSprite('spookyvignette', true)
    setProperty('spookyvignette.alpha', 0)
    setObjectCamera('spookyvignette', 'hud')
    setObjectOrder('spookyvignette', 3)
    scaleObject('spookyvignette', 1.1, 1.1)


end

flickerChange = 0.35

function onUpdate()
    if curStep == 639 then
        doTweenAlpha('spookyvignettealpha', 'spookyvignette', 0.8, 0.1, 'linear')
        doTweenColor('bfcolor', 'boyfriendGroup', 'CBCBCB', 0.1, 'linear')
        doTweenColor('dadcolor', 'dadGroup', 'CBCBCB', 0.1, 'linear')
    elseif curStep == 767 then
        doTweenAlpha('spookyvignettealpha2', 'spookyvignette', 0, 0.1, 'linear')
        doTweenColor('bfcolor2', 'boyfriendGroup', 'ffffff', 0.1, 'linear')
        doTweenColor('dadcolor2', 'dadGroup', 'ffffff', 0.1, 'linear')
        flickerChange = 0
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
    objectPlayAnimation('ENID_BGBOP', 'ENID_BGBOP', false)
    objectPlayAnimation('RAD_BGBOP', 'RAD_BGBOP', false)
    end

    if (curStep >= 639 and curStep <= 767) and curBeat % 4 == 0 then
        cameraShake('hud', 0.008, 0.1)
        cameraShake('game', 0.008, 0.1)
    end
end

function onEvent(n)
    if n == "POW flicker" then
        doTweenAlpha('powflicker', 'powFlicker', flickerChange, 0.1, 'linear')
        cameraShake('hud', 0.002, 0.1)
        cameraShake('game', 0.001, 0.1)
    end
end

function onTweenCompleted(tag)
    if tag == 'powflicker' then
        doTweenAlpha('powflicker2', 'powFlicker', 0, 0.2, 'linear')
    end
end