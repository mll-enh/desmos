
local xx = 360;
local yy = 470;
local xx2 = 920;
local yy2 = 500;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;


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
	[256] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.4 then
        			setProperty('health', health- 0.015);
   			 end
		end
	end,
	[290] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.1 then
        			setProperty('health', health- 0);
   			 end
		end
	end,
	[578] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.3 then
        			setProperty('health', health- 0.025);
   			 end
		end
	end,
	[618] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.1 then
        			setProperty('health', health- 0);
   			 end
		end
	end,
	[704] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.2 then
        			setProperty('health', health- 0.035);
   			 end
		end
	end,
	[757] = function()
		function opponentNoteHit()
			health = getProperty('health')
    			if getProperty('health') > 0.1 then
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
	
