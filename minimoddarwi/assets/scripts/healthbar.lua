function onCreate()
	makeLuaSprite('healthBarOver', 'healthBarOver', 0, 0)
	setObjectCamera('healthBarOver', 'hud')
	setScrollFactor('healthBarOver', 0.9, 0.9)
	addLuaSprite('healthBarOver', true)
end

function onCreatePost()
    setProperty('healthBarOver.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    setProperty('healthBarOver.x', getProperty('healthBar.x') - 4)
    setProperty('healthBarOver.angle', getProperty('healthBar.angle'))
    setProperty('healthBarOver.y', getProperty('healthBar.y') - 4)
    setProperty('healthBarOver.scale.x', getProperty('healthBar.scale.x'))
    setProperty('healthBarOver.scale.y', getProperty('healthBar.scale.y'))
    setObjectOrder('healthBarOver', 4)
	setObjectOrder('healthBar', 3)
	setObjectOrder('healthBarBG', 2)
end