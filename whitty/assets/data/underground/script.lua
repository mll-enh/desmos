endstops = 0
function onEvent(n,v1,v2)
if n == 'Change Character' and v2 == 'bf_cool' then

	setProperty('stagefront.visible',false)
	setProperty('stageback.visible',false)
	removeLuaScript('stages/better')

end
if n == 'Change Character' and v2 == 'bf'then

	setProperty('stagefront.visible',true)
	setProperty('stageback.visible',true)

end


end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'endshit' then
            setProperty('camHUD._fxFadeAlpha', 0);
            cameraFlash('hud','000000',1)
			makeLuaSprite('endcock','gallery/the')
            addLuaSprite('endcock',true)
            setObjectCamera('endcock','camHUD')
	end

end

function onEndSong()

        endstops = endstops + 1
        if isStoryMode then
            if endstops == 1 then
                
                
			     runTimer('endshit',1)
			    cameraFade('hud','000000',1)
                
                return Function_Stop;
                
            end
        end
         return Function_Continue;

end
function onUpdatePost()
    
   
    if endstops == 1 and getProperty('endingSong') then
       
      if keyJustPressed('accept') then endSong() end
        
    end
    
    
end