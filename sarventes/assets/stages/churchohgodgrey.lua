function onCreate()
	-- background shit
	makeAnimatedLuaSprite('churchohgod', 'stages/churchohgodgrey', -600, -600);
	setLuaSpriteScrollFactor('churchohgod', 1, 1);
	
	addLuaSprite('churchohgod', false);
	scaleLuaSprite('churchohgod',1.5,1.5);

	luaSpriteAddAnimationByPrefix('churchohgod','portal','churchdeath',24,true);

	luaSpritePlayAnimation('portal','churchohgod','true');


end


function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('camFollow.y', getProperty('camFollow.y') -100);
        setProperty('camFollow.x', getProperty('camFollow.x') +200);
    elseif focus == 'boyfriend' then
        setProperty('camFollow.y', getProperty('camFollow.y') -200);
        setProperty('camFollow.x', getProperty('camFollow.x') -450);
    end
end