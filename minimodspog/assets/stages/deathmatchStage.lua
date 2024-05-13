
function onCreate()

	makeAnimatedLuaSprite('kitchen','kitchen',0,0)
	addAnimationByPrefix('kitchen','kitchen','kitchen idle',12,true)
	objectPlayAnimation('kitchen','kitchen',false)
	addLuaSprite('kitchen',false)

	makeLuaSprite('Nowbacktotankmenonlyonnick', 'Nowbacktotankmenonlyonnick', 895, 385);
	addLuaSprite('Nowbacktotankmenonlyonnick', true);
        scaleObject('Nowbacktotankmenonlyonnick', 0.2, 0.2)
	setObjectCamera('Nowbacktotankmenonlyonnick', 'hud')
end