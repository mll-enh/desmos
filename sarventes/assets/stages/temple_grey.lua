function onCreate()
	-- background shit
	makeLuaSprite('temple_grey', 'stages/temple_grey', -400, -900);
	setLuaSpriteScrollFactor('temple_grey', 1, 1);
	
	addLuaSprite('temple_grey', false);
	scaleLuaSprite('temple_grey',1.2,1.2);

end

function onMoveCamera(focus)
    if focus == 'dad' then
        setProperty('camFollow.y', getProperty('camFollow.y') -150);
        setProperty('camFollow.x', getProperty('camFollow.x') +300);
    elseif focus == 'boyfriend' then
        setProperty('camFollow.y', getProperty('camFollow.y') -200);
        setProperty('camFollow.x', getProperty('camFollow.x') -300);
    end
end