local xx = 780;
local yy = -50;
local xx2 = 780;
local yy2 = 400;
local ofs = 85;
local ofs2 = 35;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()

	

	camX = 'camFollow.x';
	camY = 'camFollow.y';

	setPropertyFromClass('GameOverSubstate', 'characterName', 'Casanova-Bad');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'nova_death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverTrap'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverTrapEnd'); --put in mods/music/
	
	makeAnimatedLuaSprite('stuff1', 'newYorkEvil/evilNYC', -710,-1050)
	addAnimationByPrefix('stuff1', 'ads', 'evilAds',22,true)
	addLuaSprite('stuff1',false)
	objectPlayAnimation('stuff1', 'ads',false)
	setScrollFactor('stuff1', 0.5, 0.7);


	makeLuaSprite('floor', 'newYorkEvil/evilGround', -450, 500);
	setScrollFactor('floor', 0.9, 0.9);
	addLuaSprite('floor', false);
	
	makeAnimatedLuaSprite('pico', 'newYorkEvil/picoBike', 910,400)
	addAnimationByPrefix('pico', 'ass', 'picoAppear',22,true)
	objectPlayAnimation('pico', 'ass',false)
	setScrollFactor('pico', 0.9, 0.9);
	

	if not lowQuality then
		makeLuaSprite('haze', 'newYorkEvil/groundHazepink', -300, 400);
		setScrollFactor('haze', 0.8, 1.1);
		addLuaSprite('haze', true);
		targetAlpha = tonumber(0.7);
			setProperty('haze.alpha', targetAlpha);
	end

	if not lowQuality then
		makeLuaSprite('action', 'tunnel/movie bars', -500, -200);
		setScrollFactor('action', 0, 0);
		addLuaSprite('action', true);
		setObjectCamera('action', 'hud')
		scaleObject('action', '1','1');
		setObjectOrder('action',  2)
	end

	makeLuaSprite('dead', 'newYork/black', -120, -100);
	addLuaSprite('dead', true);
	setObjectCamera('dead', 'hud')
	
	makeAnimatedLuaSprite('rate', 'ratings', 300,200)
	addAnimationByPrefix('rate', 'sick', 'sickRating',24,false)
	setScrollFactor('rate', 0, 0);
	setObjectCamera('rate', 'hud')
	
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- self explanatory
    end
    
end

stepHitFuncs = {

	[1] = function() --removes black screen
		removeLuaSprite('dead', true);
		cameraFlash('camGame', '330000', 2, false)
		doTweenZoom('come on', 'camGame', 0.65, 1, 'smootherStepInOut');

	end,
	
	[1155] = function()
		
		setProperty(camX, 980)
		setProperty(camY, 450)
		addLuaSprite('pico',false)
		playSound('bikeEnter', 0.5);
	end,
	[1015] = function()
		
		if rating > 0.95 then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'sick',false)
			runTimer('daRating', 1.6, 1);
			playSound('rate', 1);
		end
	end,
	[1210] = function()
		
		cameraFade('camGame', '000000', 0.5, false)
	end
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'daRating' then
		removeLuaSprite('rate'); --removing her to make the game run slightly better
	end
end


