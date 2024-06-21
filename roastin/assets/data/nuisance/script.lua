function onCreatePost()
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)

    setProperty('timeTxt.x', getProperty('healthBar.x') + 626)
    setProperty('timeTxt.y', getProperty('healthBar.y') - 33)

    makeLuaSprite('orangeTimer', 'misc/orange', getProperty('timeTxt.x') - 13, getProperty('timeTxt.y') - 37);
    setObjectCamera('orangeTimer', 'hud')
    scaleObject('orangeTimer', 0.7, 0.7)
    addLuaSprite('orangeTimer', false)
end