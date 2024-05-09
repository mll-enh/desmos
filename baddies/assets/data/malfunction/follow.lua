


local health = 0;
local xx = 420.95;
local yy = 570;
local xx2 = 932.9;
local yy2 = 590;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

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

stepHitFuncs = {
	[447] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.2 then
        			setProperty('health', health- 0.03);
   			 end
		end
		setProperty('health', 0.5)
	end,
	[576] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.2 then
        			setProperty('health', health- 0.01);
   			 end
		end
	end, 
	[640] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.2 then
        			setProperty('health', health- 0.005);
   			 end
		end
	end,
	[688] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.2 then
        			setProperty('health', health- 0);
   			 end
		end
	end
	
	
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
	
end
	
