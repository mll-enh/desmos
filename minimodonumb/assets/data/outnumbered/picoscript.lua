

idleoffsets = [0, 0]
leftoffsets = [52, 3]
downoffsets = [190, -80]
upoffsets = [-29, 39]
rightoffsets = [-82, -11]

idle_xml_name = 'Pico Idle Dance0';
right_xml_name = 'Pico NOTE LEFT0';
down_xml_name = 'Pico Down Note0';
up_xml_name = 'pico Up note0';
left_xml_name = 'Pico Note Right0';

x_position = 100;
y_position = -500;

xScale = 1;
yScale = 1;

invisible = false;

foreground = true;
playablecharacter = true;


name_of_character_xml = 'pico-regular';
name_of_character = 'pico-regular';
name_of_notetype = 'pico';
name_of_notetype2 = 'spookyandbfandpico';
name_of_notetype3 = 'spookyandpico';
name_of_notetype4 = 'spookybfpicomom';
name_of_notetype5 = 'picoandbf';



doIdle = true;
function onCreate();
	makeAnimatedLuaSprite(name_of_character, 'characters/'  +  name_of_character_xml, x_position, y_position);
	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, true);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);
	if(playablecharacter == true){
		setPropertyLuaSprite(name_of_character, 'flipX', true);
	}else{
		setPropertyLuaSprite(name_of_character, 'flipX', false);
	}
	scaleObject(name_of_character, xScale, yScale);
	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, foreground);
	if(invisible == true){
		setPropertyLuaSprite(name_of_character, 'alpha', 0);
	}
}
local singAnimations = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote);
	if(noteType == name_of_notetype || noteType == name_of_notetype2 || noteType == name_of_notetype3 || noteType == name_of_notetype4 || noteType == name_of_notetype5){
		doIdle = false;
		objectPlayAnimation(name_of_character, singAnimations[direction], true);
		if(direction == 0){
			setProperty(name_of_character  +  '.offset.x', leftoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', leftoffsets[1]);
			if(isSustainNote){
				objectPlayAnimation(name_of_character, singAnimations[direction], true);
			}
		}else if(direction == 1){
			setProperty(name_of_character  +  '.offset.x', downoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', downoffsets[0]);
			if(isSustainNote){
				objectPlayAnimation(name_of_character, singAnimations[direction], true);
			}
		}else if(direction == 2){
			setProperty(name_of_character  +  '.offset.x', upoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', upoffsets[0]);
			if(isSustainNote){
				objectPlayAnimation(name_of_character, singAnimations[direction], true);
			}
		}else if(direction == 3){
			setProperty(name_of_character  +  '.offset.x', rightoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', rightoffsets[0]);
			if(isSustainNote){
				objectPlayAnimation(name_of_character, singAnimations[direction], true);
			}
		}
	}
}
local singAnimations = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote);
	if(noteType == name_of_notetype || noteType == name_of_notetype2 || noteType == name_of_notetype3 || noteType == name_of_notetype4 || noteType == name_of_notetype5){
		doIdle = false;
		objectPlayAnimation(name_of_character, singAnimations[direction], true);
		if(direction == 0){
			setProperty(name_of_character  +  '.offset.x', leftoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', leftoffsets[1]);
		}else if(direction == 1){
			setProperty(name_of_character  +  '.offset.x', downoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', downoffsets[1]);
		}else if(direction == 2){
			setProperty(name_of_character  +  '.offset.x', upoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', upoffsets[1]);
		}else if(direction == 3){
			setProperty(name_of_character  +  '.offset.x', rightoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', rightoffsets[1]);
		}
	}
}
function onBeatHit();
	
	if(curBeat % 2 == 0  && doIdle){
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character  +  '.offset.x', idleoffsets[0]);
		setProperty(name_of_character  +  '.offset.y', idleoffsets[1]);
	}
	doIdle = true;
}
