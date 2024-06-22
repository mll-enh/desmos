function onCreate()

	makeAnimatedLuaSprite('move', 'icons/jasminehorn', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('move', 'idle', 'horn', 24, false)
	setObjectCamera('move', 'hud')
	addLuaSprite('move', true)

	makeAnimatedLuaSprite('move2', 'icons/novaBed2', getProperty('iconP1.x'), getProperty('iconP1.y'))
	addAnimationByPrefix('move2', 'idle', 'oof', 24, false)
	setObjectCamera('move2', 'hud')
	addLuaSprite('move2', true)

end

function onUpdate(elapsed)



    setProperty('move2.flipX', true)
    setProperty('move2.visible', true)
    setProperty('move2.x', getProperty('iconP1.x') - 20)
    setProperty('move2.angle', getProperty('iconP1.angle'))
    setProperty('move2.y', getProperty('iconP1.y') - -20)
    setProperty('move2.x', getProperty('iconP1.scale.x') - -920)
    setProperty('move2.scale.y', getProperty('iconP1.scale.y'))
    setProperty('move2.antialiasing',true)

 
	setObjectOrder('move2', getObjectOrder('iconP1') + 1)
    setObjectOrder('move', getObjectOrder('iconP2') + 1)

    setProperty('move.flipX', false)
    setProperty('move.visible', true)
    setProperty('move.x', getProperty('iconP2.x') - 30)
    setProperty('move.angle', getProperty('iconP2.angle'))
    setProperty('move.y', getProperty('iconP2.y') - -20)
    setProperty('move.x', getProperty('iconP2.scale.x') - -220)
    setProperty('move.scale.y', getProperty('iconP2.scale.y') - 0)
    setProperty('move.antialiasing',true)

    setProperty('iconP2.alpha', 0) 
	objectPlayAnimation('move2','idle');
        objectPlayAnimation('move','idle');

end