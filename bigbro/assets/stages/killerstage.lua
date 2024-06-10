function onCreate()
	makeLuaSprite('Fallen_down_bg','Fallen_down_bg',-285,-440)
	scaleObject('Fallen_down_bg', 4.0, 4.0);
	addLuaSprite('Fallen_down_bg',false)
	setProperty('dadGroup.visible',false)
end
function onUpdate(elapsed)
	noteTweenAlpha('no0',0,0,0.0000001,'linear')
	noteTweenAlpha('no1',1,0,0.0000001,'linear')
	noteTweenAlpha('no2',2,0,0.0000001,'linear')
	noteTweenAlpha('no3',3,0,0.0000001,'linear')
end