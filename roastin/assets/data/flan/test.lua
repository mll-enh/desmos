function onCreate()
makeAnimatedLuaSprite('flan_dance', 'flan_dance', -800, 300)
luaSpriteAddAnimationByPrefix('flan_dance', 'flan_dance', 'flan_dance', 24, true);  
makeAnimatedLuaSprite('flan_dance2', 'flan_dance2', -800, 300)
luaSpriteAddAnimationByPrefix('flan_dance2', 'flan_dance2', 'flan_dance2', 24, true);  
makeAnimatedLuaSprite('flan_dance3', 'flan_dance3', 2600, 300)
luaSpriteAddAnimationByPrefix('flan_dance3', 'flan_dance3', 'flan_dance3', 24, true);  
makeAnimatedLuaSprite('flan_dance4', 'flan_dance4', 2600, 300)
luaSpriteAddAnimationByPrefix('flan_dance4', 'flan_dance4', 'flan_dance4', 24, true);  
	
    addLuaSprite("flan_dance")    ;
    addLuaSprite("flan_dance2")    ;
    addLuaSprite("flan_dance3")    ;
    addLuaSprite("flan_dance4")    ;
	
	
end


function onStepHit()
	if curStep == 55 then
	
	setProperty('flan_dance.alpha',1);
	
	setProperty('flan_dance3.alpha',1);
	
	setProperty('flan_dance2.alpha',1);
	
	setProperty('flan_dance4.alpha',1);
	end
	if curStep == 60 then
	doTweenX('flan_danceX', 'flan_dance', 0, 1, 'expoIn')
	
	doTweenX('flan_dance2X', 'flan_dance2', 400, 1, 'expoIn')
	doTweenX('flan_dance3x', 'flan_dance3', 800, 1, 'expoIn')
	doTweenX('flan_dance4X', 'flan_dance4', 1200, 1, 'expoIn')

		end

end
