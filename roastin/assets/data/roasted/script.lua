function onCreatePost()
        precacheImage('characters/roasted/Pink_steven_Roast')
end

function onBeatHit()
        if curBeat == 488 then
            noteTweenAlpha('fade1', 0, 0, 0.5, 'linear')
            noteTweenAlpha('fade2', 1, 0, 0.5, 'linear')
            noteTweenAlpha('fade3', 2, 0, 0.5, 'linear')
            noteTweenAlpha('fade4', 3, 0, 0.5, 'linear')
            noteTweenAlpha('fade5', 4, 0, 0.5, 'linear')
            noteTweenAlpha('fade6', 5, 0, 0.5, 'linear')
            noteTweenAlpha('fade7', 6, 0, 0.5, 'linear')
            noteTweenAlpha('fade8', 7, 0, 0.5, 'linear')
            doTweenAlpha('fade9', 'iconP1', 0, 0.5, 'linear')
            doTweenAlpha('fade10', 'iconP2', 0, 0.5, 'linear')
            doTweenAlpha('fade11', 'healthBarBG', 0, 0.5, 'linear')
            doTweenAlpha('fade12', 'healthBar', 0, 0.5, 'linear')
            doTweenAlpha('fade13', 'healthBarWN', 0, 0.5, 'linear')
            doTweenAlpha('fade14', 'healthStrips', 0, 0.5, 'linear')
            doTweenAlpha('fade15', 'healthBarHigh', 0, 0.5, 'linear')
            doTweenAlpha('fade16', 'scoreTxt', 0, 0.5, 'linear')
            doTweenAlpha('fade17', 'judgementCounter', 0, 0.5, 'linear')
        end

        if curBeat == 495 then
            noteTweenAlpha('out1', 4, 1, 0.5, 'linear')
            noteTweenAlpha('out2', 5, 1, 0.5, 'linear')
            noteTweenAlpha('out3', 6, 1, 0.5, 'linear')
            noteTweenAlpha('out4', 7, 1, 0.5, 'linear')
        end

        if curBeat == 498 then
            noteTweenAlpha('out5', 0, 1, 0.5, 'linear')
            noteTweenAlpha('out6', 1, 1, 0.5, 'linear')
            noteTweenAlpha('out7', 2, 1, 0.5, 'linear')
            noteTweenAlpha('out8', 3, 1, 0.5, 'linear')
            doTweenAlpha('out9', 'iconP1', 1, 0.5, 'linear')
            doTweenAlpha('out10', 'iconP2', 1, 0.5, 'linear')
            doTweenAlpha('out11', 'healthBarBG', 1, 0.5, 'linear')
            doTweenAlpha('out12', 'healthBar', 1, 0.5, 'linear')
            doTweenAlpha('out13', 'healthBarWN', 1, 0.5, 'linear')
            doTweenAlpha('out14', 'healthStrips', 1, 0.5, 'linear')
            doTweenAlpha('out15', 'healthBarHigh', 1, 0.5, 'linear')
            doTweenAlpha('out16', 'scoreTxt', 1, 0.5, 'linear')
            doTweenAlpha('out17', 'judgementCounter', 1, 0.5, 'linear')
        end
end