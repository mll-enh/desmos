function onCreate()
	-- background shit
	makeLuaSprite('backwall', 'mashedtails/wall', -200, -200);
	setScrollFactor('backwall', 0.9, 0.9);
	scaleObject('backwall', 0.8, 0.8);
	
	makeLuaSprite('desk', 'mashedtails/desk', -170, -100);
	setScrollFactor('desk', 0.9, 0.9);
	scaleObject('desk', 0.7, 0.7);

	makeLuaSprite('robot', 'mashedtails/robo', -170, -100);
	setScrollFactor('robot', 0.9, 0.9);
	scaleObject('robot', 0.7, 0.7);

	makeLuaSprite('box', 'mashedtails/box', -170, -100);
	setScrollFactor('box', 0.9, 0.9);
	scaleObject('box', 0.7, 0.7);

	makeLuaSprite('crate', 'mashedtails/crate', -170, -100);
	setScrollFactor('crate', 0.9, 0.9);
	scaleObject('crate', 0.7, 0.7);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
		setScrollFactor('stagelight_left', 0.9, 0.9);
		scaleObject('stagelight_left', 1.1, 1.1);
		
		makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
		setScrollFactor('stagelight_right', 0.9, 0.9);
		scaleObject('stagelight_right', 1.1, 1.1);
		setProperty('stagelight_right.flipX', true); --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
		setScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
	end

	addLuaSprite('backwall', false);
	addLuaSprite('box', false);
	addLuaSprite('robot', false);
	addLuaSprite('desk', false);
	addLuaSprite('crate', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end