function onEvent(n,v1,v2)


	if n == 'LessFlashy' then

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
		setProperty('flash.alpha',0.6)
		setObjectCamera('flash', 'camGame')
		doTweenAlpha('flTw','flash',0,0.7,'linear')
	end



end