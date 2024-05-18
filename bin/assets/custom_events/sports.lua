function onCreate()
	   makeLuaSprite('black', 'black', 0, 0);
	      addLuaSprite('black', true);
	      setLuaSpriteScrollFactor('black',0,0)
	      setProperty('black.scale.x',2)
	      setProperty('black.scale.y',2)
		setProperty('black.alpha',0)
	   makeLuaSprite('spotbf', 'spotlight', 450, 0);
	      addLuaSprite('spotbf', true);
	      setProperty('spotbf.scale.x',1)
	      setProperty('spotbf.scale.y',1)
		setProperty('spotbf.alpha',0)
	   makeLuaSprite('spotdad', 'spotlight', 0, 0);
	      addLuaSprite('spotdad', true);
	      setProperty('spotdad.scale.x',1)
	      setProperty('spotdad.scale.y',1)
		setProperty('spotdad.alpha',0)
end

function onEvent(name, value1, value2)
if value1 == 'dad' then
	setProperty('spotdad.alpha',0.5)
	setProperty('spotbf.alpha',0)
	doTweenAlpha('cesar','black',0.5, 0.1, linear)
end
if value1 == 'bf' then
	setProperty('spotbf.alpha',0.5)
	setProperty('spotdad.alpha',0)
	doTweenAlpha('cesar','black',0.5, 0.1, linear)
end
if value1 == 'off' then
	setProperty('spotdad.alpha',0)
	setProperty('spotbf.alpha',0)
	doTweenAlpha('cesar','black',0, 0.1, linear)
end
end
