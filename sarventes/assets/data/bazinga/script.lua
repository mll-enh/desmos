local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('jumpscare');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    characterPlayAnim('gf', 'scared', false);
end