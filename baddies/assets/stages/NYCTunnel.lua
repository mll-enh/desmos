local xx = 920;
local yy = 50; 
local xx2 = 1420; 
local yy2 = 150; 
local ofs = 50;  
local followchars = true; 
local del = 0;
local del2 = 0;



function onCreate()

	setProperty('cameraSpeed', 1.5)

	camX = 'camFollow.x';
	camY = 'camFollow.y';

	
	setPropertyFromClass('GameOverSubstate', 'characterName', 'deathBike');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bikeDeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverTrap'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverTrapEnd'); --put in mods/music/

	
	-- background shit
	makeLuaSprite('sky', 'tunnel/newBG', -500, -610);
	setScrollFactor('sky', 0.3, 0.6);
	addLuaSprite('sky', false);

	if not lowQuality then
		makeAnimatedLuaSprite('heli', 'tunnel/heliLmao', -1680, -225) 
		addLuaSprite('heli', false); --Added offscreen before it starts moving.
		addAnimationByPrefix('heli', 'Move', 'helicopterFriends', 24, true);
	end

	if not lowQuality then
		makeAnimatedLuaSprite('police2', 'tunnel/daPopos', -200,-1420);
		addAnimationByPrefix('police2', 'uhoh', 'helicopters',24,true);
		setScrollFactor('police2', 0.7, 0.7);
		addLuaSprite('police2',false)
		objectPlayAnimation('police2', 'uhoh',false)
	end

	makeAnimatedLuaSprite('newYork', 'tunnel/myWayOrTheHighway', -760,-690);
	addAnimationByPrefix('newYork', 'ground', 'newGround',36,true);
	setScrollFactor('newYork', 0.7, 0.7);
	addLuaSprite('newYork',false)
	objectPlayAnimation('newYork', 'ground',false)

	makeAnimatedLuaSprite('newYork2', 'tunnel/daLights', -410,-270);
	addAnimationByPrefix('newYork2', 'light', 'lightsMove',36,true);
	setScrollFactor('newYork2', 0.75, 0.73);
	addLuaSprite('newYork2',false)
	objectPlayAnimation('newYork2', 'light',false)

	makeAnimatedLuaSprite('police', 'tunnel/policeCars', 795,320);
	addAnimationByPrefix('police', 'weewoo', 'policeChase',40,true);
	setScrollFactor('police', 0.7, 0.7);
	addLuaSprite('police',false)
	objectPlayAnimation('police', 'weewoo',false)
	
	makeAnimatedLuaSprite('parents', 'tunnel/parents', 600,100);
	addAnimationByPrefix('parents', 'wee', 'dadAppear',18,true);
	setScrollFactor('parents', 1, 1);
	objectPlayAnimation('parents', 'wee',true)
	scaleObject('parents', '1.2','1.2');

	makeAnimatedLuaSprite('parents2', 'tunnel/drivelol', 610,130);
	addAnimationByPrefix('parents2', 'vroom', 'car',24,true);
	setScrollFactor('parents2', 1, 1);
	objectPlayAnimation('parents2', 'vroom',false)
	scaleObject('parents2', '1.2','1.2');

	if not lowQuality then
		makeAnimatedLuaSprite('smoke', 'tunnel/smokeHeart', 560,-150);
		addAnimationByPrefix('smoke', 'byebye', 'heart explode',19,false);
		setScrollFactor('smoke', 0.7, 0.7);
	end

	if not lowQuality then
		makeLuaSprite('action', 'tunnel/movie bars', -500, -200);
		setScrollFactor('action', 0, 0);
		addLuaSprite('action', true);
		setObjectCamera('action', 'hud')
		setObjectOrder('action',  0)
	end
	
	if not lowQuality then
		makeAnimatedLuaSprite('ui', 'UI_text', -400,250)
		addAnimationByPrefix('ui', 'text', 'driftText',32,true)
		objectPlayAnimation('ui', 'text',false)
		setObjectCamera('ui', 'hud')
		addLuaSprite('ui',true)
	end

	makeLuaSprite('dead', 'newYork/black', -120, -100); --cover up
	addLuaSprite('dead', true);
	setObjectCamera('dead', 'hud')
	
	makeAnimatedLuaSprite('rate', 'ratings', 300,200)
	addAnimationByPrefix('rate', 'fucked', 'fuckedRating',24,false)
	
	setScrollFactor('rate', 0, 0);
	setObjectCamera('rate', 'hud')

	--precaching bc there's a lot of shit going on

	addCharacterToList('Cass','bf');
	addCharacterToList('Casanova-BikeBad2','bf');
	precacheImage('tunnel/smokeHeart');
	precacheImage('newYork/black');
	precacheImage('tunnel/myWayOrTheHighway');
	precacheImage('tunnel/policeCars');
	precacheImage('tunnel/daLights');
	precacheImage('tunnel/daPopos');
	precacheImage('tunnel/heliLmao');
	precacheImage('tunnel/newBG');
	precacheImage('tunnel/drivelol');
	precacheImage('tunnel/parents');
	precacheImage('tunnel/movie bars');
	precacheImage('UI_text');
	precacheSound('gun');
	precacheSound('StephSFX');
	precacheSound('boom');

	
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
	  if getProperty('boyfriend.animation.curAnim.name') == 'LEFTshoot' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
	 if getProperty('boyfriend.animation.curAnim.name') == 'RIGHTshoot' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
	if getProperty('boyfriend.animation.curAnim.name') == 'UPshoot' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	   if getProperty('boyfriend.animation.curAnim.name') == 'DOWNshoot' then
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
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- self explanatory
    end
    
end


stepHitFuncs = {
	
	[25] = function() --removes black screen
		removeLuaSprite('dead', true);
		cameraFlash('camGame', 'FFFFFF', 1, false)
		doTweenZoom('come on', 'camGame', 0.9, 4, 'circInOut');
		playSound('woosh', 1);
	end,

	[40] = function() --UI shows
		if not lowQuality then
			doTweenX('move', 'ui', 10, 1, 'smootherStepOut')
			playSound('StephSFX', 0.3);
		end
	end,


	[80] = function() --UI leaves 
		if not lowQuality then
			doTweenX('move', 'ui', -400, 2, 'smootherStepOut')	
		end
	end,
	
	[85] = function() --UI leaves for milk
		if not lowQuality then
			removeSprite('ui',true)	
		end
	end,

	[352] = function() --helicopter helicopterr
		if not lowQuality then
			playSound('policeShout1', 2);
			doTweenZoom('come on', 'camGame', 0.7, 3, 'circOut');
			doTweenY('heliTweenY', 'police2', -200, 4, 'smootherStepOut');
			objectPlayAnimation('police2', 'Move', false);
		end
   	end,
	[416] = function() --focuses on parents and they appear
		playSound('carthump', 1);
		setProperty(camX,1050)
		addLuaSprite('parents',false)
		doTweenZoom('come on', 'camGame', 0.8, 1, 'circInOut');
   	end,
	[422] = function() --sets the camera back in position

		setProperty(camX,1420)
   	end,
	
	
	[435] = function() --parents drive animation, removed the fly in one
		
		removeLuaSprite('parents',true)
		addLuaSprite('parents2',false)
   	end,

	[482] = function() --nova jumps on his bike, switches the new cam follow pos
		
		doTweenZoom('come on', 'camGame', 0.8, 5, 'circOut');
		triggerEvent('Play Animation', 'jump', 'BF') 
		yy2 = 15
		xx2 = 1120
		xx = 950
		yy = 20
   	end,

	[493] = function() --shoves the camera up earlier to see the animation
		setProperty(camY, 0)
		setProperty(camX,1120)
		cameraShake('camGame', 0.02, 0.2)
		playSound('novathump', 1);
   	end,

	[496] = function()
		
		triggerEvent('Change Character', 'BF', 'Casanova-BikeBad2') 
   	end,

	[498] = function()
		
		triggerEvent('Play Animation', 'yeah', 'BF') 
		
   	end,
	
	[590] = function() --jasmine supports her papi
		if not lowQuality then
			doTweenX('heliTweenX', 'heli', 2000, 9, 'linear');
			objectPlayAnimation('heli', 'Move', false);
		end
   	end,

	[750] = function()-- the ending
		if rating > 0.95 then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'fucked',false)
			runTimer('daRating', 1.7, 1);
			playSound('driftRate', 1);
		end
		playSound('gun', 0.9);
		doTweenZoom('come on', 'camGame', 0.8, 0.3, 'circInOut');
		
	end,

	[751] = function()

		setProperty('health', 2)
	end,

	[755] = function()
		cameraFlash('camGame', 'FFFFFF', 8, false)
		if not lowQuality then
			addLuaSprite('smoke',false)
			objectPlayAnimation('smoke', 'byebye',false)
		end
		cameraShake('camGame', 0.02, 0.4)
		setProperty('dad.alpha', 0)
		playSound('boom', 0.9);
		
	end,
	[758] = function()
		setProperty('boyfriend.alpha', 0)
		
	end,

	[762] = function()
		
		cameraFade('camGame', '000000', 3, false)
		
	end
		

}

function onTweenCompleted(tag) 
	if tag == 'heliTweenX' then
		removeLuaSprite('heli'); --removing her to make the game run slightly better
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'daRating' then
		removeLuaSprite('rate'); --removing her to make the game run slightly better
	end
end

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end

end