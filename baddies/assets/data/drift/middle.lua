local keepScroll = false
function onCreate()
--setProperty('notes.cameras',true)
--setProperty('strumLineNotes.cameras',true)
setProperty('gf.alpha', 0)
setProperty('doof.cameras',true)

--tObjectOrder('move2', getObjectOrder('iconP1') + 1)

	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		keepScroll = true;
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end
end


function onDestroy()
	if keepScroll == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif keepScroll == true then
		keepScroll = false;
	end
end
