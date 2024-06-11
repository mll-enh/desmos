local blockCountdown = 2
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if blockCountdown > 0 and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		if blockCountdown == 1 then
			startVideo('laugh');
		else
			runTimer('startDialogue', 0.8);
		end
		blockCountdown = blockCountdown - 1;
		seenCutscene = false;
		return Function_Stop;
	end
	seenCutscene = true;
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'Crucify_Inst');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    characterPlayAnim('gf', 'sad', false);
    triggerEvent('Screen Shake', '0.05, 0.01', '0, 0');
end