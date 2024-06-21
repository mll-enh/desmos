function onCreatePost()
    precacheImage('misc/line')
    precacheImage('misc/johnnyImgs/johnny1')
    precacheImage('misc/johnnyImgs/johnny2')
    precacheImage('misc/johnnyImgs/johnny3')
    precacheImage('misc/johnnyImgs/johnny4')
    precacheImage('misc/johnnyImgs/johnny5')
    precacheImage('misc/johnnyImgs/johnny6')
    precacheImage('stages/johnatan/boom')

    doTweenAlpha('hudalpha', 'camHUD', 0.001, 0.01, 'linear');
    setProperty("camFollowPos.x", 500);
    setProperty("camFollowPos.y", 640);
    triggerEvent('Camera Follow Pos', '500', '770')

    noteTweenX('mid1', 0, 414, 0.01, 'linear')
    noteTweenX('mid2', 1, 527, 0.01, 'linear')
    noteTweenX('mid3', 2, 637, 0.01, 'linear')
    noteTweenX('mid4', 3, 750, 0.01, 'linear')
    noteTweenX('middletime1', 4, 414, 0.01, 'linear')
    noteTweenX('middletime2', 5, 527, 0.01, 'linear')
    noteTweenX('middletime3', 6, 637, 0.01, 'linear')
    noteTweenX('middletime4', 7, 750, 0.01, 'linear')
end
