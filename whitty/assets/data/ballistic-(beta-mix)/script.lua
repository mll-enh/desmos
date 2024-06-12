local resetHideHud = false

function onCreatePost()
	if not lowQuality then
		addLuaScript('epicScripts/infishake')
		addLuaScript('epicScripts/cam')
	end

	addCharacterToList('bf-jam-car', 'boyfriend');

	-- this is probably really bad practice but oh well

	resetHideHud = not hideHud;
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', true);

		-- disable debug keys SORRY ;(
		-- exiting with these will fuck up your hide HUD setting
		-- if you wanna use em enable hide hud first!!!!

		setProperty('debugKeysChart', null);
		setProperty('debugKeysCharacter', null);
	end

	precacheImage('hqr/slamratings/shit');
	precacheImage('hqr/slamratings/bad');
	precacheImage('hqr/slamratings/good');
	precacheImage('hqr/slamratings/sick');
	precacheImage('hqr/slamratings/go');

	-- TODO: replace "go" graphic (how???)
	-- TODO: replace ratings (how ?????????)
end	

function onCountdownTick(swagCounter)
	if swagCounter == 3 then
		makeLuaSprite('slamGo', 'hqr/slamratings/go', screenWidth / 2 - 279, screenHeight / 2 - 215);
		setObjectCamera('slamGo','hud');
		doTweenAlpha('slamGoAlpha', 'slamGo', 0, crochet / 1000, 'cubeInOut');
		setProperty('countdownGo.visible', false);
		addLuaSprite('slamGo', true);
	end
end

function onTweenCompleted(tag)
	if tag == 'slamGoAlpha' then
		removeLuaSprite('slamGo', true);
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	-- slammin ratings!!!
	if not isSustainNote and resetHideHud then
		--structure
		strumTime = getPropertyFromGroup('notes', id, 'strumTime');
		local rating = getRating(strumTime - getSongPosition() + getPropertyFromClass('ClientPrefs','ratingOffset'));
		
		-- sorry no comboOffset!!
		-- only gonna have one at a time cuz fuck managing multiple instances
		local middlescrolloffset = 0;
		if middlescroll then
			middlescrolloffset = 250;
		end
		makeLuaSprite('lastRating', 'hqr/slamratings/' .. rating, screenWidth * 0.35 - 75 - middlescrolloffset, screenHeight / 2 - 60);
		setObjectCamera('lastRating','hud');

		setProperty('lastRating.velocity.y', math.random(-140, -175));
		setProperty('lastRating.velocity.x', math.random(-10));
		setProperty('lastRating.acceleration.y', 550);
		runTimer('lastRatingTimer', crochet / 1000);

		setScrollFactor('lastRating', 1, 1);
		scaleObject('lastRating', 0.7, 0.7);
		updateHitbox('lastRating');

		addLuaSprite('lastRating', true);
		-- BRING BACK THE COMBO COUNTER LOL!!!!
		local combo = getProperty('combo');
		if combo >= 10 then
			for i=2,0,-1 do
				local tag = 'combodigit' .. i;
				makeLuaSprite(tag, 'num' .. math.floor(combo / 10 ^ i % 10), screenWidth * 0.35 - 60 - middlescrolloffset - i * 43, screenHeight / 2 + 80);
				setObjectCamera(tag,'hud');

				setProperty(tag .. '.velocity.y', math.random(-140, -160));
				setProperty(tag .. '.velocity.x', math.random(-5, 5));
				setProperty(tag .. '.acceleration.y', math.random(200, 300));
				runTimer(tag .. 'Timer', crochet / 500);

				setScrollFactor(tag, 1, 1);
				scaleObject(tag, 0.5, 0.5);
				updateHitbox(tag);

				addLuaSprite(tag, true);
			end
		end
	end
end

function getRating(diff)
	diff = math.abs(diff);
	if diff <= getPropertyFromClass('ClientPrefs', 'badWindow') then
		if diff <= getPropertyFromClass('ClientPrefs', 'goodWindow') then
			if diff <= getPropertyFromClass('ClientPrefs', 'sickWindow') then
				return 'sick';
			end
			return 'good';
		end
		return 'bad';
	end
	return 'shit';
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'lastRatingTimer' then
		doTweenAlpha('lastRatingAlpha', 'lastRating', 0, 0.2);
	elseif tag == 'combodigit0Timer' then
		doTweenAlpha('combodigit0Alpha', 'combodigit0', 0, 0.2);
	elseif tag == 'combodigit1Timer' then
		doTweenAlpha('combodigit1Alpha', 'combodigit1', 0, 0.2);
	elseif tag == 'combodigit2Timer' then
		doTweenAlpha('combodigit2Alpha', 'combodigit2', 0, 0.2);
	end
end

-- there is no hook for playstate closing so i have to cover all exiting options!!!
-- closing the game dont matter cuz this doesnt save the pref to save data anyway
-- the ONLY WAY this fucks up to my knowledge is if u use chart/character debug key
-- to exit playstate so those are disabled now. if u wanna use em, enable hide hud!

function onGameOver()
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onEndSong()
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onPause()
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onResume() -- lol put it back on
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', true);
	end
end
