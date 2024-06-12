function onCreate()
	-- siiva gameover sound
	-- lmao moment if this doesn't reset for other stuff lol!
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-hqr');

	-- Whitback
   	makeAnimatedLuaSprite('stage','hqr/BallisticBackground', -470, -160)
    	addAnimationByPrefix('stage','BallisticBackgroundGo','Background Whitty Startup',24,false);
    	addAnimationByPrefix('stage','BallisticBackgroundStart','Background Whitty Start0',24,true);
    	addAnimationByPrefix('stage','BallisticBackground','Background Whitty Moving',24,true);
    	objectPlayAnimation('stage','BallisticBackground',false);

	addLuaSprite('stage', false);



   	makeLuaSprite('eff','thefunnyeffect', 0, 0)
	setGraphicSize('eff',1280,720)
	setObjectCamera('eff','camHud')
	updateHitbox('eff')
	setBlendMode('eff','multiply')
	addLuaSprite('eff', false);
	
end

function onUpdatePost()

	if flashingLights then
		setProperty('eff.alpha',getProperty('health')/1.5)
	end

end
