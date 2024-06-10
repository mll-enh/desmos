-- entire script made by fyrid

cardimage = 'spongeCard' -- your image name
duration = 1 -- time it appears for
stayTime = 2 -- time it stays for
ease = 'circIn' -- tween ease for when it leaves
textfont = 'vcr.ttf' -- song card text font
composername = 'Ezzy' -- song creator goes here
composerCards = false

function onCreate()
    makeLuaSprite('songCardSprite', cardimage, 0, 150)
    addLuaSprite('songCardSprite', true)

    makeLuaText('songNameTxt', songName, 0, 0, 138)
    setTextFont('songNameTxt', textfont)
    setTextSize('songNameTxt', 76)
    addLuaText('songNameTxt')

    makeLuaText('composerNameTxt', 'Composers - ' .. composername, 0, 0, 215)
    setTextFont('composerNameTxt', textfont)
    setTextSize('composerNameTxt', 24)
    addLuaText('composerNameTxt')

    setObjectCamera('songCardSprite', 'other')
    setObjectCamera('songNameTxt', 'other')
    setObjectCamera('composerNameTxt', 'other')

    runTimer('cardTimer', stayTime, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'cardTimer' then
        songCardLeave()
    end
end

function songCardLeave()
    doTweenX('cardTween', 'songCardSprite', -1000, duration, ease)
    doTweenX('cardTween2', 'songNameTxt', -1000, duration, ease)
    doTweenX('cardTween3', 'composerNameTxt', -1000, duration, ease)
end