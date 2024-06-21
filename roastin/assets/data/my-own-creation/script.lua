function onCreatePost()
        triggerEvent('Camera Follow Pos', '750', '-750')
        doTweenAlpha('camHUDOff' ,'camHUD', 0, 0.00000001, 'linear')
end
function onCreate()
        setProperty('skipCountdown', true)
end
function onBeatHit()
	if curBeat == 16 then
            doTweenY('cameraDown', 'camFollow', 450, 7, 'smoothstepinout')
        end

        if curBeat == 32 then
            setScrollFactor('clouds1', 0.35, 0.35)
            setScrollFactor('clouds2', 0.55, 0.55)
            setScrollFactor('clouds3', 0.55, 0.55)
        end
end