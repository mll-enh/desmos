function onCreate()
    makeLuaSprite('labBG', 'labBG', -700,-275)
    addLuaSprite('labBG', 0, 0)


    makeAnimatedLuaSprite('KO_BGBOP', 'KO_BGBOP', 400,430)
    addAnimationByPrefix('KO_BGBOP', 'KO_BGBOP', 'ko bop', 24, false)
    addLuaSprite('KO_BGBOP', 0, 0)
    scaleObject('KO_BGBOP', 0.9, 0.9)


end

function onCreatePost()
    setProperty('gf.alpha', 1)
end

function onBeatHit()
    if curBeat % 2 == 0 then
    objectPlayAnimation('KO_BGBOP', 'KO_BGBOP', false)
    end
end