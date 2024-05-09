
stepHitFuncs = {

	[526] = function()
		doTweenZoom('come on', 'camGame', 1, 1, 'quartInOut');
   		
	end
	
}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
	
end
	
