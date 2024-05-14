function onEvent(tag, var1, var2)
    if tag == 'Rebounced' then
        toggle = tonumber(var1)

        angle = tonumber(var2.split(',')[0])
        intensity = tonumber(var2.split(',')[1])
        bounceY = tonumber(var2.split(',')[2])

        if toggle == 0 then
            for i = 1,4 do cancelTween(x[i]) end

            doTweenAngle('resetgame', 'camGame', 0, Cro, 'cubeOut');
            doTweenX('resetgame2', 'camGame', 0, Cro, 'linear')
        end
    end
end

function onBeatHit()
    Cro = crochet / 1000
    if toggle == 1 then
        if curBeat % 2 == 0 then
            AngleBitch = angle
        else
            AngleBitch = -angle
        end

        triggerEvent("Add Camera Zoom", 0.02, 0.05);
    end
end

function onTweenCompleted(tag)
    if tag == 'YHUD1' then
        doTweenY('YHUD2', 'camHUD', 0, Cro * 0.25, "cubeIn")
    end
end