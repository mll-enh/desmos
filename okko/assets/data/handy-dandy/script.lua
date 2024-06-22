function onCreate()
    makeAnimatedLuaSprite('confetti', 'confetti', 0,0) 
    addAnimationByPrefix('confetti', 'confetti', 'anim', 24, false)
    setObjectCamera('confetti', 'hud')
    scaleObject('confetti', 1.1, 1.1)
    precacheImage('confetti')
    
    makeLuaSprite('vignette', 'vignette', 0,0)
    addLuaSprite('vignette', true)
    setProperty('vignette.alpha', 0)
    setObjectCamera('vignette', 'hud')
    setObjectOrder('vignette', 3)

    makeLuaSprite('scanlines', 'scanlines', 0,0)
    addLuaSprite('scanlines', true)
    setProperty('scanlines.alpha', 0)
    setObjectCamera('scanlines', 'other')
    scaleObject('scanlines', 2.5, 2.5)


end


function onEndSong()
    if not cool then
        makeLuaSprite('win', 'THANKS', 0, 0)
        addLuaSprite('win', false)
        setObjectCamera('win', 'other')
        setProperty('win.alpha', 0)
        doTweenAlpha('winTween', 'win', 1, 1, 'linear')
        scaleObject('win', 0.69, 0.69)
        playMusic('tyfwts', 1, true)  --song during endcard
        cool = true
        return Function_Stop;
    end
    return Function_Continue;
end

cool = false
function onUpdate()
    if cool then
        if keyJustPressed('accept') then
            endSong()
        end
    end


    if curStep == 1152  then
        setObjectCamera('flashwhite', 'other')
        doTweenColor('bfcolor', 'boyfriendGroup', '1bf772', 0.1, 'linear')
        doTweenColor('dadcolor', 'dadGroup', '1bf772', 0.1, 'linear')
        doTweenColor('vignettecolor', 'vignette', '78F7AA', 0.1, 'linear')
        setObjectCamera('boyfriendGroup', 'hud')
        setProperty('boyfriend.y',60)
        setProperty('boyfriend.x',600)
        setProperty('boyfriend.alpha',0)
        doTweenAlpha('boyfriendtween', 'boyfriend', 1,0.2,'linear')
        setObjectCamera('dadGroup', 'hud')
        setProperty('dad.y',70)
        setProperty('dad.x',130)
        setProperty('dad.alpha',0)
        doTweenAlpha('dadtween', 'dad', 1,0.2,'linear')

        doTweenAlpha('scanlinesin', 'scanlines', 0.6, 0.2, 'linear')
    end




    if curStep == 1408 then
            for i=0,70 do
                setProperty('binary' .. i .. '.alpha', 0)
                removeLuaSprite('binary' .. i, true)

        setObjectCamera('flashwhite', 'hud')
        setProperty('vignette.alpha', 0)
        doTweenColor('bfcolorrevert', 'boyfriendGroup', 'ffffff', 0.1, 'linear')
        setObjectCamera('boyfriendGroup', 'game')
        setProperty('boyfriend.y',360)
        setProperty('boyfriend.x',700)
        setProperty('boyfriend.alpha',1)

        doTweenColor('dadcolorrevert', 'dadGroup', 'ffffff', 0.1, 'linear')
        setObjectCamera('dadGroup', 'game')
        setProperty('dad.y',370)
        setProperty('dad.x',0)
        setProperty('dad.alpha',1)

        setProperty('scanlines.alpha', 0)
            end
    end


    if curStep == 1671 then
        addLuaSprite('confetti', true)
        setProperty('confetti.alpha', 0.6)
        doTweenAlpha('confettiAlpha', 'confetti', 0, 2, 'linear')
    end
end

binaryAmount = 0
function onBeatHit()
    if curStep >= 1150 and curStep <= 1406 then
        makeLuaText('binary' .. binaryAmount, math.random(0,1) ,screenWidth,-370,360 + getRandomInt(-300,300));
        setTextSize('binary' .. binaryAmount,math.random(40,200));
        setProperty('binary.alpha', 0.8)
        setTextColor('binary' .. binaryAmount, '20C20E')
        setTextAlignment('binary' .. binaryAmount,'left');
        setObjectCamera('binary' .. binaryAmount, 'hud')
        addLuaText('binary' .. binaryAmount);
        setTextFont('binary' .. binaryAmount, 'binchrt.ttf')
        setTextBorder('binary' .. binaryAmount, 0, '891EAF')
        setObjectOrder('binary' .. binaryAmount, getObjectOrder('gfGroup') + 1.1)
        doTweenX('binary' .. binaryAmount, 'binary' .. binaryAmount, 1500, 5, 'linear')
        binaryAmount = binaryAmount + 1

        if curBeat % 4 == 0 then
            setProperty('boyfriend.alpha',0.4)
            doTweenAlpha('boyfriendflicker', 'boyfriend', 0.7,0.5,'linear')

            setProperty('dad.alpha',0.4)
            doTweenAlpha('dadflicker', 'dad', 0.7,0.5,'linear')
        end

    end
end