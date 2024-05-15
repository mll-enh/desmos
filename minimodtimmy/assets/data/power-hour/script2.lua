function onUpdate(elapsed)

  if curStep >= 0 then

    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/120)
    doTweenY('dadfly', 'dad', 140-50*math.sin((currentBeat*0.25)*math.pi),0.001)
    doTweenY('gffly', 'gf', 240-50*math.sin((currentBeat*0.25)*math.pi),0.001)
end
end

