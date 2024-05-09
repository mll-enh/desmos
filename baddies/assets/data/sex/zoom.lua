local turn = 10
local turn2 = 20
local y = 100;
local x = 0;
local canBob = true
local Strums = 'opponentStrums'
function onCreate()
    math.randomseed(os.clock() * 1000);
    
   
end
function onUpdate(elapsed)
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.9)
        else
           
            setProperty('defaultCamZoom',0.85)
        end
end

