local allowCountdown = false
local stops = 0
local resetHideHud = false
local comboGone = true
local dialogue = { 'ENOUGH.', 'whit', 'YOU THINK THIS IS FUCKING FUNNY? PUSHING ME TO MY ABSOLUTE GODDAMN LIMIT?!', 'whit', 'BEEP BOP. BIDOOP BA.', 'bf', 'I SEE HOW IT IS THEN.', 'whit', 'YOU\'RE NOTHING BUT A MONSTER.', 'whit', 'A COLD, LIFELESS SHITHEEL WITHOUT SYMPATHY OR MORALS.', 'whit', 'I\'LL TAKE YOU OUT RIGHT WHERE YOU STAND.', 'whit', 'SAY YOUR PRAYERS, ASSHOLE.', 'whit', '' }
local canAdvance = false
local textScale = 2.3
local textX = 1280 / 2 - ((1280/2 - 70) / textScale)
local textY = 720 * 0.8

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue

	if not allowCountdown and isStoryMode and not seenCutscene then
		
		triggerEvent('Change Character','bf','bf')
		triggerEvent('Change Character','dad','diet-whitty')
		setProperty('inCutscene', true);
		if stops == 0 then
			makeAnimatedLuaSprite('whit','hqr/cuttinDeezeBalls',-400,-100)
			addAnimationByPrefix('whit','crazy','Whitty Ballistic Cutscene',24,false)
			objectPlayAnimation('whit','crazy',true)
			addLuaSprite('whit',true)
			setProperty('dad.visible',false)
			setProperty('camGame.zoom',1.2)
			cameraShake('game',0.001,2)
			doTweenZoom('www','camGame',1.4,2,'linear')
			doTweenAngle('wwwrty','camGame',3,2,'linear')
			setProperty('camFollowPos.x',600)
			setProperty('camFollowPos.y',300)
			runTimer('kfin',10.1)
			runTimer('mthrow',87/24)
			runTimer('mslam',86/24)
			runTimer('yyy',80/24)
			runTimer('solja',128/24)
			runTimer('rumble',123/24)
			runTimer('stopfx',135/24)
			runTimer('23',155/24)
			runTimer('toe',158/24)
			runTimer('flashhh',2+(158/24))
			runTimer('mbreak',52/24)
			playSound('windLmao')
			objectPlayAnimation('stage','BallisticBackgroundStart',false);
		end
		if stops == 1 then
			setProperty('camGame._fxFadeAlpha', 0);
			cameraFlash('game','FFFFFF',0.8)
			objectPlayAnimation('stage','BallisticBackground',false);
			setProperty('dad.visible',true)
			setProperty('whit.visible',false)
			triggerEvent('Change Character','dad','whitbonkers-hqr')
			triggerEvent('Change Character','bf','bf-hqr')
			runTimer('startDialogue', 0.8);
			allowCountdown = true;
		end
		stops = stops + 1
		return Function_Stop;
	end
	soundFadeOut('rumb-hqr', 4);
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue

		-- all elements move 0.3 sec
		-- dont forget to delete when done!!!

		makeLuaSprite('gradP1', 'hqr/hmratings/gradblu', screenWidth, 0);
		setProperty('gradP1.antialiasing', false);
		setObjectCamera('gradP1', 'hud');
		addLuaSprite('gradP1', true);

		makeLuaSprite('gradP2', 'hqr/hmratings/gradylw', screenWidth, 0);
		setProperty('gradP2.antialiasing', false);
		setObjectCamera('gradP2', 'hud');
		addLuaSprite('gradP2', true);
		setBlendMode('gradP2', 'add');
		setProperty('gradP2.color', getColorFromHex('0xFFFFFF00'));

		makeLuaSprite('topbar', 'hqr/hmratings/dialbg', 0, -184.75);
		setProperty('topbar.antialiasing', false);
		setProperty('topbar.scale.x', screenWidth);
		setProperty('topbar.scale.y', 2.5);
		updateHitbox('topbar');
		doTweenY('topbarmove', 'topbar', -64.25, 0.3, 'linear');
		setObjectCamera('topbar', 'hud');
		addLuaSprite('topbar', true);

		makeLuaSprite('bottombar', 'hqr/hmratings/dialbg', 0, 716.625);
		setProperty('bottombar.antialiasing', false);
		setProperty('bottombar.scale.x', screenWidth);
		setProperty('bottombar.scale.y', 2.75);
		updateHitbox('bottombar');
		doTweenY('bottombarmove', 'bottombar', 535.625, 0.3, 'linear');
		setObjectCamera('bottombar', 'hud');
		addLuaSprite('bottombar', true);

		makeAnimatedLuaSprite('whitHeadShadow', 'dialogue/whittyALL', 888 + 488 + 5, 128 + 8);
		setProperty('whitHeadShadow.antialiasing', false);
		addAnimationByPrefix('whitHeadShadow', 'talk', 'talk', 20, true);
		objectPlayAnimation('whitHeadShadow', 'talk');
		setObjectCamera('whitHeadShadow', 'hud');
		scaleObject('whitHeadShadow', 6, 6);
		updateHitbox('whitHeadShadow');
		addLuaSprite('whitHeadShadow', true);
		setProperty('whitHeadShadow.color', getColorFromHex("0xff000000"));
		setProperty('whitHeadShadow.alpha', 0.5);

		makeAnimatedLuaSprite('whitHead', 'dialogue/whittyALL', 888 + 488, 128);
		setProperty('whitHead.antialiasing', false);
		addAnimationByPrefix('whitHead', 'talk', 'talk', 20, true);
		objectPlayAnimation('whitHead', 'talk');
		setObjectCamera('whitHead', 'hud');
		scaleObject('whitHead', 6, 6);
		updateHitbox('whitHead');
		addLuaSprite('whitHead', true);

		makeAnimatedLuaSprite('bfHeadShadow', 'dialogue/bfALL', 888 + 488 + 5, 128 + 8);
		setProperty('bfHeadShadow.antialiasing', false);
		addAnimationByPrefix('bfHeadShadow', 'talk', 'talk', 20, true);
		objectPlayAnimation('bfHeadShadow', 'talk');
		setObjectCamera('bfHeadShadow', 'hud');
		scaleObject('bfHeadShadow', 6, 6);
		updateHitbox('bfHeadShadow');
		addLuaSprite('bfHeadShadow', true);
		setProperty('bfHeadShadow.color', getColorFromHex("0xff000000"));
		setProperty('bfHeadShadow.alpha', 0.5);

		makeAnimatedLuaSprite('bfHead', 'dialogue/bfALL', 888 + 488, 128);
		setProperty('bfHead.antialiasing', false);
		addAnimationByPrefix('bfHead', 'talk', 'talk', 20, true);
		objectPlayAnimation('bfHead', 'talk');
		setObjectCamera('bfHead', 'hud');
		scaleObject('bfHead', 6, 6);
		updateHitbox('bfHead');
		addLuaSprite('bfHead', true);

		doTweenZoom('focusCamOut','camGame',0.75,1,'sineOut')

		makeLuaText('dialogueText', '', 495, textX, textY);
		addLuaText('dialogueText');
		setTextFont('dialogueText', 'lilliput-steps.ttf');
		setTextSize('dialogueText', 16);
		setTextColor('dialogueText', '0xFFff00ff');
		setTextBorder('dialogueText', 0, '0x00000000');
		setProperty('dialogueText.antialiasing', false);
		setProperty('dialogueText.scale.x', textScale);
		setProperty('dialogueText.scale.y', textScale);
		setTextAlignment('dialogueText', 'left');
		setProperty('dialogueText.visible', false);
		setScrollFactor('dialogueText', 1, 1);

		makeLuaText('dialogueTextUpper', '', 495, textX - 3, textY - 2.5);
		addLuaText('dialogueTextUpper');
		setTextFont('dialogueTextUpper', 'lilliput-steps.ttf');
		setTextSize('dialogueTextUpper', 16);
		setTextColor('dialogueTextUpper', '0xFF88ffff');
		setTextBorder('dialogueTextUpper', 0, '0x00000000');
		setProperty('dialogueTextUpper.antialiasing', false);
		setProperty('dialogueTextUpper.scale.x', textScale);
		setProperty('dialogueTextUpper.scale.y', textScale);
		setTextAlignment('dialogueTextUpper', 'left');
		setProperty('dialogueTextUpper.visible', false);
		setScrollFactor('dialogueTextUpper', 1, 1);

		runTimer('moveHead', 0.1);
	end
	if tag == 'moveHead' then
		onTweenCompleted('swapbfTowhit');
		setProperty('dialogueText.visible', false);
		setProperty('dialogueTextUpper.visible', false);
		setTextString('dialogueText', dialogue[1]);
		setProperty('dialogueText.y', calcTextY('dialogueText'));
		setTextString('dialogueTextUpper', dialogue[1]);
		setProperty('dialogueTextUpper.y', textY - 5);
		curDial = dialogue[2];
		table.remove(dialogue, 1);
		table.remove(dialogue, 1);
		runTimer('fakeDance', 0);
	end
	if tag == 'fakeDance' then
		characterDance('boyfriend');
		characterDance('dad');
		if getProperty('inCutscene') then
			runTimer('fakeDance', crochet / 1000);
		end
	end

	if tag == 'kfin' then
		startCountdown()
	end
	if tag == '22' then
	end
	if tag == '23' then
		doTweenZoom('www','camGame',1,0.1,'circIn')
		doTweenAngle('wwwrty','camGame',-3,0.1,'circIn')
	end
	if tag == 'mthrow' then
		playSound('micThrow-hqr')
	end
	if tag == 'mslam' then
		doTweenY('wwfwGG','camFollowPos',350,0.3,'circInOut')
		playSound('slammin')
	end
	if tag == 'mbreak' then
		playSound('micBreak')
		cameraShake('game',0.004,0.2)
		doTweenZoom('www','camGame',1.5,0.4,'circIn')
	end
	if tag == 'yyy' then
		doTweenAngle('wwwrgfgty','camGame',0,0.1,'circIn')
		doTweenY('wwwhGG','camFollowPos',250,0.3,'circInOut')
	end
	if tag == 'solja' then
    	objectPlayAnimation('stage','BallisticBackgroundGo',false);
		playSound('souljaboyCrank')
		cameraShake('game',0.01,0.2)
	end
	if tag == 'rumble' then
		doTweenY('wwwGG','camFollowPos',300,1.4,'circIn')
		playSound('rumb-hqr', 1, 'rumb-hqr')
	end
	if tag == 'toe' then
		playSound('ouchMyToe')
		cameraShake('game',0.05,3.5)
		doTweenZoom('wwwrr','camGame',0.9,3.5,'sineOut')
		doTweenAngle('wwwrgfgty','camGame',0,0.1,'circIn')
	end
	if tag == 'flashhh' then
		cameraFade('game','FFFFFF',1)
	end
end

local curDial = 'whit'
function calcTextY(tag)
	local th = getProperty(tag .. '.textField.textHeight');
	textY = screenHeight * 0.8 + (th + 4) / 2;
	return textY;
end

function proceedDialogue()
	-- lua arrays start at 1!
	setProperty('dialogueText.visible', false);
	setProperty('dialogueTextUpper.visible', false);
	if dialogue[1] ~= '' then 
		setTextString('dialogueText', dialogue[1]);
		setProperty('dialogueText.y', calcTextY('dialogueText'));
		setTextString('dialogueTextUpper', dialogue[1]);
		setProperty('dialogueTextUpper.y', textY - 5);
		if dialogue[2] ~= curDial then
			local newDial = dialogue[2];
			doTweenX('gradP1move', 'gradP1', screenWidth, 0.3, 'linear');
			doTweenX('gradP2move', 'gradP2', screenWidth, 0.3, 'linear');
			doTweenX('swap' .. curDial .. 'ShadowTo' .. newDial, curDial .. 'HeadShadow', 888 + 488 + 5, 0.3, 'linear');
			doTweenX('swap' .. curDial .. 'To' .. newDial, curDial .. 'Head', 888 + 488, 0.3, 'linear');
			curDial = newDial;
			if curDial == 'whit' then
				doTweenX('focusCamX', 'camFollowPos', 600, 1.5, 'expoOut');
				doTweenY('focusCamY', 'camFollowPos', 300, 1.5, 'expoOut');
			else
				doTweenX('focusCamX', 'camFollowPos', 1200, 1.5, 'expoOut');
				doTweenY('focusCamY', 'camFollowPos', 600, 1.5, 'expoOut');
			end
		else
			setProperty('dialogueText.visible', true);
			setProperty('dialogueTextUpper.visible', true);
			setProperty('dialogueText.alpha', 0);
			setProperty('dialogueTextUpper.alpha', 0);
			doTweenAlpha('dialogueTextFade', 'dialogueText', 1, 10 / 60, 'linear');
			doTweenAlpha('dialogueTextUFade', 'dialogueTextUpper', 1, 10 / 60, 'linear');
			canAdvance = true;
		end
		table.remove(dialogue, 1);
		table.remove(dialogue, 1);
	else
		doTweenX('gradP1move', 'gradP1', screenWidth, 0.3, 'linear');
		doTweenX('gradP2move', 'gradP2', screenWidth, 0.3, 'linear');
		doTweenX('endDial', curDial .. 'Head', 888 + 488, 0.3, 'linear');
		doTweenX('endDialShadow', curDial .. 'HeadShadow', 888 + 488 + 5, 0.3, 'linear');
		doTweenY('topbarmove', 'topbar', -184.75, 0.3, 'linear');
		doTweenY('bottombarmove', 'bottombar', 716.625, 0.3, 'linear');
		-- fuck off !!!!
	end
end

function onTweenCompleted(tag)
	if tag == 'ctt' then
		setTextString('comboText', combo .. 'x');
	elseif tag == 'swapwhitTobf' then
		doTweenX('gradP1move', 'gradP1', screenWidth - 488, 0.3, 'linear');
		doTweenX('gradP2move', 'gradP2', screenWidth - 488, 0.3, 'linear');
		doTweenX('bfHeadShadowmove', 'bfHeadShadow', 888 + 5, 0.3, 'linear');
		doTweenX('bfHeadmove', 'bfHead', 888, 0.3, 'linear');
		canAdvance = true;
		setProperty('dialogueText.visible', true);
		setProperty('dialogueTextUpper.visible', true);
	elseif tag == 'swapbfTowhit' then
		doTweenX('gradP1move', 'gradP1', screenWidth - 488, 0.3, 'linear');
		doTweenX('gradP2move', 'gradP2', screenWidth - 488, 0.3, 'linear');
		doTweenX('whitHeadShadowmove', 'whitHeadShadow', 888 + 5, 0.3, 'linear');
		doTweenX('whitHeadmove', 'whitHead', 888, 0.3, 'linear');
		canAdvance = true;
		setProperty('dialogueText.visible', true);
		setProperty('dialogueTextUpper.visible', true);
	elseif tag == 'endDial' then
		-- DELETE SHIT HERE!!!!
		removeLuaSprite('gradP1', true);
		removeLuaSprite('gradP2', true);
		removeLuaSprite('topbar', true);
		removeLuaSprite('bottombar', true);
		removeLuaSprite('whitHeadShadow', true);
		removeLuaSprite('whitHead', true);
		removeLuaSprite('bfHeadShadow', true);
		removeLuaSprite('bfHead', true);
		removeLuaText('dialogueText', true);
		removeLuaText('dialogueTextUpper', true);
		-- just in case
		cancelTween('swapwhitTobf');
		cancelTween('swapwhitShadowTobf');
		cancelTween('swapbfTowhit');
		cancelTween('swapbfShadowTowhit');
		cancelTween('gradP1move');
		cancelTween('gradP2move');
		cancelTween('whitHeadShadowmove');
		cancelTween('whitHeadmove');
		cancelTween('bfHeadShadowmove');
		cancelTween('bfHeadmove');
		cancelTween('bottombarmove');
		cancelTween('topbarmove');
		cancelTimer('fakeDance');
		startCountdown();
	elseif tag == 'bottombarmove' and dialogue[1] ~= '' then
		setProperty('dialogueText.visible', true);
		setProperty('dialogueTextUpper.visible', true);
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	-- miamin ratings!!!
	if not isSustainNote and resetHideHud then
		strumTime = getPropertyFromGroup('notes', id, 'strumTime');
		local rating = getRating(strumTime - getSongPosition() + getPropertyFromClass('ClientPrefs','ratingOffset'));
		objectPlayAnimation('ratingText', rating, true);
		-- BRING BACK THE COMBO COUNTER LOL!!!!
		local combo = getProperty('combo');
		if combo >= 2 then
			if comboGone then
				doTweenX('ctt', 'comboText', 130, stepCrochet / 1000, 'linear');
				doTweenX('cbt', 'comboBG', 0, stepCrochet / 1000, 'linear');
				comboGone = false;
			end
			setTextString('comboText', combo .. 'x');
		end
	end
end

function noteMiss()
	if not comboGone then yeetCombo() end
end
function noteMissPress()
	if not comboGone then yeetCombo() end
end

function yeetCombo()
	doTweenX('ctt', 'comboText', -170, stepCrochet / 1000, 'linear');
	doTweenX('cbt', 'comboBG', -300, stepCrochet / 1000, 'linear');
	comboGone = true;
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


function onCreatePost()
	-- this is probably really bad practice but oh well

	resetHideHud = not hideHud;

	if not lowQuality then
		addLuaScript('epicScripts/infishake')
		addLuaScript('epicScripts/cam')
	else
		-- dont do the crazy hud shit on low quality for now
		resetHideHud = false;
	end

	-- lil precaching for dialogue !!
	if isStoryMode and not seenCutscene then
		precacheImage('hqr/hmratings/dialbg');
		precacheImage('hqr/hmratings/gradblu');
		precacheImage('hqr/hmratings/gradylw');
		precacheImage('dialogue/whittyALL');
		precacheImage('dialogue/bfALL');
	end

	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', true);

		-- disable debug keys SORRY ;(
		-- exiting with these will fuck up your hide HUD setting
		-- if you wanna use em enable hide hud first!!!!

		setProperty('debugKeysChart', null);
		setProperty('debugKeysCharacter', null);

		-- make rating texts

		makeAnimatedLuaSprite('ratingText', 'hqr/hmratings/hmratings', screenWidth * 0.35 - 75, screenHeight / 2 - 40);
		setObjectCamera('ratingText', 'hud');
		addLuaSprite('ratingText', true);
		addAnimationByPrefix('ratingText', 'shit', 'shit', 60, false);
		addAnimationByPrefix('ratingText', 'bad', 'bad', 60, false);
		addAnimationByPrefix('ratingText', 'good', 'good', 60, false);
		addAnimationByPrefix('ratingText', 'sick', 'sick', 60, false);
		addAnimationByPrefix('ratingText', 'hide', 'bad_00039', 60, false);
		objectPlayAnimation('ratingText', 'hide');
		setProperty('ratingText.antialiasing', false);
		scaleObject('ratingText', 5, 5);
		setScrollFactor('ratingText', 1, 1);
		if middlescroll then
			setProperty('ratingText.x', screenWidth * 0.35 - 375);
		end

		makeLuaSprite('comboBG', 'hqr/hmratings/backthing', -300, screenHeight * 0.7);
		if downscroll then
			setProperty('comboBG.y', 40);
		end
		setBlendMode('comboBG', 'multiply');
		setObjectCamera('comboBG', 'hud');
		addLuaSprite('comboBG');

		makeLuaText('comboText', '', -170, 160, getProperty('comboBG.y') + 30);
		addLuaText('comboText');
		setTextFont('comboText', 'bulletinyourhead.ttf');
		setTextSize('comboText', 43);
		setTextColor('comboText', '0xFFff00aa');
		setTextBorder('comboText', 1, '0xFF000000');
		setTextAlignment('comboText', 'left');
		setProperty('comboText.scale.x', 3);
		setProperty('comboText.scale.y', 3);
	end
end

function onUpdatePost(elapsed)
	if not lowQuality then
		if getProperty('inCutscene') and stops > 0 then
			-- VERY silly
			local tix = getPropertyFromClass('flixel.FlxG', 'game.ticks');
			local gwave = math.sin((tix) / 750 * math.pi / 4);
			local hexClr = string.format('0xFF%02X%02X00', math.floor(120 * gwave + 135), math.floor(120 * -gwave + 135));
			setProperty('gradP2.color', getColorFromHex(hexClr));
			setTextColor('dialogueText', string.format('0xFF%02X%02X%02X', math.floor(111 * gwave + 143), math.floor(64 * -gwave + 64), math.floor(64 * gwave + 191)));
			setTextColor('dialogueTextUpper', string.format('0xFF%02XFFFF', math.floor(64 * -gwave + 191)));
			local hwave = math.sin((tix) / 500 * math.pi / 4);
			setProperty('whitHeadShadow.angle', hwave * 5);
			setProperty('whitHead.angle', hwave * 5);
			setProperty('bfHeadShadow.angle', hwave * 5);
			setProperty('bfHead.angle', hwave * 5);
			local tpwave = math.sin((tix) / 200 * math.pi / 4);
			setProperty('dialogueTextUpper.x', textX - tpwave * 1.5 - 4.5);
			setProperty('dialogueTextUpper.y', textY - tpwave * 1.25 - 3.75);
		else
			local wave = math.sin((getSongPosition()) / crochet * math.pi / 4);
			setTextColor('comboText', string.format('0xFFFF00%02X', math.floor(85 * wave + 85)));
		end
	end
	-- maybe change to flxg any key?
	if canAdvance and keyJustPressed('accept') then
		canAdvance = false;
		playSound('dialogueClose');
		proceedDialogue();
	end
end

-- there is no hook for playstate closing so i have to cover all exiting options!!!
-- closing the game dont matter cuz this doesnt save the pref to save data anyway

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
