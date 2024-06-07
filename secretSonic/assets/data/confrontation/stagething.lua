

function onCreate()
	makeLuaSprite('knbg', 'kn_bg', -200, -200);
	setLuaSpriteScrollFactor('knbg', 1.0, 1.0);
    scaleObject('knbg', '0.8', '0.8')
end

function onEvent(n,v,b)

	if n == 'Change Character' then
		if b == 'knuckles' then
            cameraFlash('camOther', '000000', '5')
			addLuaSprite('knbg',false)
		else
			removeLuaSprite('knbg')
            cameraFlash('camOther', '000000', '3')
            makeLuaSprite('knbg', 'kn_bg', -200, -200);
            setLuaSpriteScrollFactor('knbg', 1.0, 1.0);
            scaleObject('knbg', '0.8', '0.8')
		end
	end

end