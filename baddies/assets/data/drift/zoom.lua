local turn = 10
local turn2 = 20
local y = 0;
local x = 0;
local canBob = true
local Strums = 'opponentStrums'
function onCreate()
    math.randomseed(os.clock() * 1000);
    
 
end
function onUpdate(elapsed)
        if mustHitSection == false then
	setProperty('defaultCamZoom',1.05)
        else
         
           setProperty('defaultCamZoom',1)
        end
end

stepHitFuncs = {

	[80] = function()
		if difficulty == 2 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.2 then
        				setProperty('health', health- 0.065);
   				 end
			end
		elseif difficulty == 1 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.3 then
        				setProperty('health', health- 0.025);
   				 end
			end
		end
	end,
	
	[352] = function()
		if difficulty == 2 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.2 then
        				setProperty('health', health- 0.075);
   				 end
			end
		elseif difficulty == 1 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.3 then
        				setProperty('health', health- 0.035);
   				 end
			end
		end
		
	end,

	[480] = function()
		if difficulty == 2 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.2 then
        				setProperty('health', health- 0.050);
   				 end
			end
		elseif difficulty == 1 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.3 then
        				setProperty('health', health- 0.040);
   				 end
			end
		end
	end,
	[704] = function()
		if difficulty == 2 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.2 then
        				setProperty('health', health- 0.055);
   			 	end
			end
		elseif difficulty == 1 then
			function opponentNoteHit()
				health = getProperty('health')
    				if getProperty('health') > 0.3 then
        				setProperty('health', health- 0.045);
   				 end
			end
		end
	end
	
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
	
end