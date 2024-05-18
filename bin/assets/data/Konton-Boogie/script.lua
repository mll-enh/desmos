
function onCreate()
    setProperty("scoreTxt.y", getProperty('scoreTxt.y') -50)
    setProperty('healthBar.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setTextFont('scoreTxt','pixel.otf')
    setTextSize('scoreTxt',18)
end