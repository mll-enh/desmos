function onEvent(n,v1,v2)


	if n == 'Flash BlackCam' then

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'000000')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
		setProperty('flash.alpha',0.8)
		setObjectCamera('flash', 'other')
		doTweenAlpha('flTw','flash',0,1,'linear')
	end



end