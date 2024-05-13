local chromFreq = 0
local chromAmount = 0

function onEvent(n,v1,v2)
	if n == 'setChrom' then
		chromAmount = tonumber(v1)
		chromFreq = tonumber(v2)
		if v1 == '0' and v2 == '0' then		
		end
		runHaxeCode([[
			var guhTween:FlxTween;

			if (guhTween != null) guhTween.cancel();
			guhTween = FlxTween.num(getVar('lastChromAmount'), ]]..chromAmount..[[, ]]..chromFreq..[[, {ease: FlxEase.sineOut}, function(num) { chroma.setFloat('amount',num); setVar('lastChromAmount',num); });
		]])
	end
end
