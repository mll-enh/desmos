

idleoffsets = [0, 0] 
leftoffsets = [-9, 10]
downoffsets = [7, -3]
upoffsets = [-6, 50]
rightoffsets = [0, 20]

idle_xml_name = 'Dad idle dance Default';
right_xml_name = 'Dad Sing NOTE RIGHT Default';
down_xml_name = 'Dad Sing Note DOWN Default';
up_xml_name = 'Dad Sing NOTE UP Default';
left_xml_name = 'Dad Sing Note LEFT Default';

x_position = 150;
y_position = 100;

xScale = 1;
yScale = 1;

invisible = false;

name_of_character_xml = 'dad-1';
name_of_character = 'dad-1';
name_of_notetype = 'dad';
name_of_notetype2 = 'momanddad';
name_of_notetype3 = 'spookyanddad';

playablecharacter = false;
foreground = true;


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
	if(noteType == name_of_notetype || noteType == name_of_notetype2 || noteType == name_of_notetype3){
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
			setProperty(name_of_character  +  '.offset.y', downoffsets[1]);
			if(isSustainNote){
				objectPlayAnimation(name_of_character, singAnimations[direction], true);
			}
		}else if(direction == 2){
			setProperty(name_of_character  +  '.offset.x', upoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', upoffsets[1]);
			if(isSustainNote){
				objectPlayAnimation(name_of_character, singAnimations[direction], true);
			}
		}else if(direction == 3){
			setProperty(name_of_character  +  '.offset.x', rightoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', rightoffsets[1]);
			if(isSustainNote){
				objectPlayAnimation(name_of_character, singAnimations[direction], true);
			}
		}
	}
}
local singAnimations = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote);
	if(noteType == name_of_notetype || noteType == name_of_notetype2 || noteType == name_of_notetype3){
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
function onCountdownTick(counter);
	
	
	
	
	
	if(counter % 2 == 0){
		if(doIdle == true){
			objectPlayAnimation(name_of_character, 'idle');
			setProperty(name_of_character  +  '.offset.x', idleoffsets[0]);
			setProperty(name_of_character  +  '.offset.y', idleoffsets[1]);
		}
	}
}