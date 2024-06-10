function onUpdate(elapsed)
	if (inGameOver) then return end
	
    songPos = getSongPosition()
    currentBeat = (songPos/5000)*(curBpm/60)

    doTweenY('gfFly', 'dad', getProperty('dad.y') - 240*math.sin((currentBeat+12*12)*math.pi), 2)
end