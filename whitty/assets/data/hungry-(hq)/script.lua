function onEvent(n,v1,v2)
	if n == 'Play Animation' then
		if v2 == 'bf' then
			setProperty('boyfriend.heyTimer', 10);
		elseif v2 == 'Dad' then
			setProperty('dad.heyTimer', 20);
		end
	end
end
