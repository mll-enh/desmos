function onCreate()
  addCharacterToList('danfront', 'dad')
  addCharacterToList('trayfront', 'boyfriend')

  precacheSound('intro')
end

function onCreatePost()

  makeLuaSprite('dlab', 'destroyedlab', 0, 0)
  setProperty('dlab.antialiasing', false)
  addLuaSprite('dlab', false)
  setProperty('dlab.visible', false)

  makeAnimatedLuaSprite('cutscene', 'danCutscene', 0, 0)
  addAnimationByPrefix('cutscene', 'playcut', 'video', 33, false)
  addLuaSprite('cutscene', true)
  setObjectCamera('cutscene', 'camHUD')
  scaleObject('cutscene', 2.14, 2.14)
  screenCenter('cutscene')

  addLuaSprite('box', true)

  setProperty('cutscene.visible', false)
end

function onCountdownTick(counter)
    if counter == 0 then
      playSound('intro')

      --precache anis
      objectPlayAnimation('cutscene', 'playcut', true)
    end
end

function onSongStart()
  objectPlayAnimation('cutscene', 'playcut', true)
  setProperty('cutscene.visible', true)
end

function onBeatHit()
  if curBeat == 16 then
    removeLuaSprite('box')
    removeLuaSprite('cutscene')
    cameraFlash('camHUD', 'FFFFFF', 1, false)
  end

  if not middlescroll then
    if curBeat == 332 then
      frontnotemoves()
    end
  end
  
  if curBeat == 332 then
    doTweenZoom('super', 'camGame', 3.4, 1.4, 'circIn')
  end

  if curBeat == 336 then
    cameraFlash('camHUD', 'FFFFFF', 2, false)
    setProperty('frontlab.visible', true)

    setProperty('showComboNum', false)
    setProperty('showRating', false)
  elseif curBeat == 400 then
    cameraFlash('camHUD', 'FFFFFF', 2, false)
    removeLuaSprite('frontlab')

    setProperty('showComboNum', true)
    setProperty('showRating', true)

    if not middlescroll then
      frontnoteback()
    end
  end
end

function onEndSong() --so the explosion looks cooler..
    removeLuaSprite('lab')
    removeLuaSprite('frontlab')

    setProperty('dlab.visible', true)
    setProperty('dad.visible', false)
end

-- the front note move thingys simpleifieidd intoroopo
function frontnotemoves()
  noteTweenX('player0go', 4, 412, 2, 'cubeInOut')
  noteTweenX('player1go', 5, 524, 2, 'cubeInOut')
  noteTweenX('player2go', 6, 636, 2, 'cubeInOut')
  noteTweenX('player3go', 7, 749, 2, 'cubeInOut')

  noteTweenX('opp0go', 0, 82, 2, 'cubeInOut')
  noteTweenX('opp1go', 1, 194, 2, 'cubeInOut')
  noteTweenX('opp2go', 2, 971, 2, 'cubeInOut')
  noteTweenX('opp3go', 3, 1083, 2, 'cubeInOut')
  noteTweenAlpha('oppfadeout0', 0, 0.35, 2, 'cubeInOut')
  noteTweenAlpha('oppfadeout1', 1, 0.35, 2, 'cubeInOut')
  noteTweenAlpha('oppfadeout2', 2, 0.35, 2, 'cubeInOut')
  noteTweenAlpha('oppfadeout3', 3, 0.35, 2, 'cubeInOut')
end

function frontnoteback()
  noteTweenX('player0back', 4, defaultPlayerStrumX0, 1, 'cubeOut')
  noteTweenX('player1back', 5, defaultPlayerStrumX1, 1, 'cubeOut')
  noteTweenX('player2back', 6, defaultPlayerStrumX2, 1, 'cubeOut')
  noteTweenX('player3back', 7, defaultPlayerStrumX3, 1, 'cubeOut')

  noteTweenX('opp0back', 0, defaultOpponentStrumX0, 1, 'cubeOut')
  noteTweenX('opp1back', 1, defaultOpponentStrumX1, 1, 'cubeOut')
  noteTweenX('opp2back', 2, defaultOpponentStrumX2, 1, 'cubeOut')
  noteTweenX('opp3back', 3, defaultOpponentStrumX3, 1, 'cubeOut')
  noteTweenAlpha('oppfadein0', 0, 1, 1, 'cubeOut')
  noteTweenAlpha('oppfadein1', 1, 1, 1, 'cubeOut')
  noteTweenAlpha('oppfadein2', 2, 1, 1, 'cubeOut')
  noteTweenAlpha('oppfadein3', 3, 1, 1, 'cubeOut')
end