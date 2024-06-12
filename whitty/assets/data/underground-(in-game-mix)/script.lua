function onCreatePost()
	addCharacterToList('testis_swag', 'dad');
	addCharacterToList('testis_wacky_swag-hqr', 'dad');
	addCharacterToList('testis_wacky-hqr', 'dad');
	addCharacterToList('bf_cool', 'boyfriend');
	addCharacterToList('gf_JUICY_swag', 'gf');
end

function onEvent(n,v1,v2)
	if n == 'Change Character' and v2 == 'bf_cool' then
		setProperty('stagefront.visible',false)
		setProperty('stageback.visible',false)
		objectPlayAnimation('lawl','stylechange',true);
		setProperty('lawl.x', 1120 - 10);
		setProperty('lawl.y', 800 - 58/2);
		removeLuaScript('stages/better-hqr2')
	end
	if n == 'Change Character' and v2 == 'bf'then
		setProperty('stagefront.visible',true)
		setProperty('stageback.visible',true)
		objectPlayAnimation('lawl','idle',true);
		setProperty('lawl.x', 1120);
		setProperty('lawl.y', 800);
	end
end

--function onUpdatePost(elapsed)
	--if(getPropertyFromClass('flixel.FlxG', 'keys.justPressed.K')) then
		--triggerEvent('Change Character','bf','bf')
	--end
	--if(getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L')) then
		--triggerEvent('Change Character','bf','bf_cool')
	--end
--end