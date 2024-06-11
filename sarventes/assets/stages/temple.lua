function onCreate()
	-- background shit
	makeLuaSprite('temple', 'stages/temple', -400, -900);
	setLuaSpriteScrollFactor('temple', 1, 1);
	
	addLuaSprite('temple', false);
	scaleLuaSprite('temple',1.2,1.2);

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