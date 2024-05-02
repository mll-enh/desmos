local xx = 600;
local yy = 550;
local xx2 = 920;
local yy2 = 550;
local ofs = 30;
local angleshit = 1;
local anglevar = 1;
local followchars = true;
function onCreate()
    makeAnimatedLuaSprite('pibby','pibbyshade',1130,530)
	addAnimationByPrefix('pibby','bounce','pibby idle',24,false)
	addLuaSprite('pibby',true)

    makeAnimatedLuaSprite('glitch', 'static', -600, -300);
	scaleObject('glitch', 2, 2);
	addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
	objectPlayAnimation('glitch', 'glitchout');
	addLuaSprite('glitch', true); -- false = add behind characters, true = add over characters
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.04);
        end
    end

    local luckyRoll = math.random(1, 50)
    local luckyRoll2 = math.random(1, 50)
    
    if mustHitSection == false then
        if (luckyRoll >= 45) then
            cameraShake('hud', 0.08, 0.05);
        end
    end
    if mustHitSection == false then
        if (luckyRoll2 >= 45) then
            cameraShake('game', 0.08, 0.05);
        end
    end
end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function onStepHit()
    if curBeat > 0 then
        if curBeat < 289 then
            cameraShake('hud', 0.003, 0.2);
        end
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('pibby','bounce',true)
    end
    if curBeat > 32 then
        if curBeat < 289 then
            if curBeat % 2 == 0 then
                angleshit = anglevar;
            else
                angleshit = -anglevar;
            end
            setProperty('camHUD.angle',angleshit*3)
            setProperty('camGame.angle',angleshit*3)
            doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
            doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
            doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
            doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
        end
    end
end