function opponentNoteHit(id, direction, noteType, isSustainNote)
	if difficulty == 2 then
		if curBeat < 592 then
			if curBeat > 528 then
				cameraShake('cam', '0.015', '0.1')
			end
		end
		if curBeat < 703 then
			if curBeat > 688 then
				cameraShake('cam', '0.015', '0.1')
			end
		end
	end
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.04);
        end
    end
end