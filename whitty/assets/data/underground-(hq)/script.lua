function onCreatePost()
	addCharacterToList('testis_swag', 'dad');
	addCharacterToList('testis_wacky_swag', 'dad');
	addCharacterToList('bf_cool', 'boyfriend');
	addCharacterToList('gf_JUICY_swag', 'gf');
end

function onEvent(n,v1,v2)
	if n == 'Change Character' and v2 == 'bf_cool' then
		setProperty('stagefront.visible',false)
		setProperty('stageback.visible',false)
		removeLuaScript('stages/better-hqr')
	end
	if n == 'Change Character' and v2 == 'bf'then
		setProperty('stagefront.visible',true)
		setProperty('stageback.visible',true)
	end
end
