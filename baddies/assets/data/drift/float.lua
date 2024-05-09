function onUpdate(elapsed)

  if curStep >= 0 then

    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/151)

    doTweenY(dadTweenY, 'dad', -125+30*math.sin((currentBeat*0.25)*math.pi),0.005)
  end

end
