function onCreate()
	-- background shit
	makeAnimatedLuaSprite('temple_portal', 'stages/temple_portal', -400, -900);
	setLuaSpriteScrollFactor('temple_portal', 1, 1);
	
	addLuaSprite('temple_portal', false);
	scaleLuaSprite('temple_portal',1.2,1.2);

	luaSpriteAddAnimationByPrefix('temple_portal','portal','churchdeath',12,true);

	luaSpritePlayAnimation('portal','temple_portal','true');

end

function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('camFollow.y', getProperty('camFollow.y') +50);
        setProperty('camFollow.x', getProperty('camFollow.x') +400);
    elseif focus == 'boyfriend' then
        setProperty('camFollow.y', getProperty('camFollow.y') -200);
        setProperty('camFollow.x', getProperty('camFollow.x') -300);
    end
end