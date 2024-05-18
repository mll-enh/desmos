function onUpdate()
setTextString("botplayTxt", "Poo")
end

function onCreate()

	makeLuaSprite('background', 'back', -500, -500);
	addLuaSprite('background', false);
	scaleObject('background', 1, 1);

	makeAnimatedLuaSprite('clap', 'pico', 550, -500)
	addLuaSprite('clap',false)
    	addAnimationByPrefix('clap','spin','pico clap',24,true)
 	setProperty('clap.antialiasing', false)
	setProperty('clap.alpha', 0)
	scaleObject('clap', 0.4, 0.4);

	makeAnimatedLuaSprite('clap2', 'pico', 250, -500)
	addLuaSprite('clap2',false)
    	addAnimationByPrefix('clap2','spin','pico clap',24,true)
 	setProperty('clap2.antialiasing', false)
	setProperty('clap2.alpha', 0)
	scaleObject('clap2', 0.4, 0.4);

	makeAnimatedLuaSprite('clap3', 'pico', -150, -500)
	addLuaSprite('clap3',false)
    	addAnimationByPrefix('clap3','spin','pico clap',24,true)
 	setProperty('clap3.antialiasing', false)
	setProperty('clap3.alpha', 0)
	scaleObject('clap3', 0.4, 0.4);

	makeAnimatedLuaSprite('clap4', 'pico', -450, -500)
	addLuaSprite('clap4',false)
    	addAnimationByPrefix('clap4','spin','pico clap',24,true)
 	setProperty('clap4.antialiasing', false)
	setProperty('clap4.alpha', 0)
	scaleObject('clap4', 0.4, 0.4);

	makeAnimatedLuaSprite('clap5', 'pico', -750, -500)
	addLuaSprite('clap5',false)
    	addAnimationByPrefix('clap5','spin','pico clap',24,true)
 	setProperty('clap5.antialiasing', false)
	setProperty('clap5.alpha', 0)
	scaleObject('clap5', 0.4, 0.4);

	makeAnimatedLuaSprite('clap6', 'pico', 550, -200)
	addLuaSprite('clap6',false)
    	addAnimationByPrefix('clap6','spin','pico clap',24,true)
 	setProperty('clap6.antialiasing', false)
	setProperty('clap6.alpha', 0)
	scaleObject('clap6', 0.4, 0.4);

	makeAnimatedLuaSprite('clap7', 'pico', 250, -200)
	addLuaSprite('clap7',false)
    	addAnimationByPrefix('clap7','spin','pico clap',24,true)
 	setProperty('clap7.antialiasing', false)
	setProperty('clap7.alpha', 0)
	scaleObject('clap7', 0.4, 0.4);

	makeAnimatedLuaSprite('clap8', 'pico', -150, -200)
	addLuaSprite('clap8',false)
    	addAnimationByPrefix('clap8','spin','pico clap',24,true)
 	setProperty('clap8.antialiasing', false)
	setProperty('clap8.alpha', 0)
	scaleObject('clap8', 0.4, 0.4);

	makeAnimatedLuaSprite('clap9', 'pico', -750, -200)
	addLuaSprite('clap9',false)
    	addAnimationByPrefix('clap9','spin','pico clap',24,true)
 	setProperty('clap9.antialiasing', false)
	setProperty('clap9.alpha', 0)
	scaleObject('clap9', 0.4, 0.4);

	makeAnimatedLuaSprite('clap10', 'pico', -750, -200)
	addLuaSprite('clap10',false)
    	addAnimationByPrefix('clap10','spin','pico clap',24,true)
 	setProperty('clap10.antialiasing', false)
	setProperty('clap10.alpha', 0)
	scaleObject('clap10', 0.4, 0.4);

	makeAnimatedLuaSprite('clap11', 'pico', 550, 100)
	addLuaSprite('clap11',false)
    	addAnimationByPrefix('clap11','spin','pico clap',24,true)
 	setProperty('clap11.antialiasing', false)
	setProperty('clap11.alpha', 0)
	scaleObject('clap11', 0.4, 0.4);

	makeAnimatedLuaSprite('clap12', 'pico', 250, 100)
	addLuaSprite('clap12',false)
    	addAnimationByPrefix('clap12','spin','pico clap',24,true)
 	setProperty('clap12.antialiasing', false)
	setProperty('clap12.alpha', 0)
	scaleObject('clap12', 0.4, 0.4);

	makeAnimatedLuaSprite('clap13', 'pico', -150, 100)
	addLuaSprite('clap13',false)
    	addAnimationByPrefix('clap13','spin','pico clap',24,true)
 	setProperty('clap13.antialiasing', false)
	setProperty('clap13.alpha', 0)
	scaleObject('clap13', 0.4, 0.4);

	makeAnimatedLuaSprite('clap14', 'pico', -450, 100)
	addLuaSprite('clap14',false)
    	addAnimationByPrefix('clap14','spin','pico clap',24,true)
 	setProperty('clap14.antialiasing', false)
	setProperty('clap14.alpha', 0)
	scaleObject('clap14', 0.4, 0.4);

	makeAnimatedLuaSprite('clap15', 'pico', -750, 100)
	addLuaSprite('clap15',false)
    	addAnimationByPrefix('clap15','spin','pico clap',24,true)
 	setProperty('clap15.antialiasing', false)
	setProperty('clap15.alpha', 0)
	scaleObject('clap15', 0.4, 0.4);

	makeLuaSprite('background2', 'back2', -500, -500)
	addLuaSprite('background2',false)
	setProperty('background2.antialiasing', false)
	setProperty('background2.alpha', 0)
	scaleObject('background', 1, 1);

	makeAnimatedLuaSprite('logo', 'logo', 230, 150)
	addLuaSprite('logo',false)
    	addAnimationByPrefix('logo','spin','logo',24,true)
 	setProperty('logo.antialiasing', false)
	setProperty('logo.alpha', 0)
	setProperty('logo.scale.x',1.7)
	setProperty('logo.scale.y',1.7)

	makeAnimatedLuaSprite('pico', 'pico2', 0, 0)
	addLuaSprite('pico',false)
    	addAnimationByPrefix('pico','spin','pico2 clap',24,true)
 	setProperty('pico.antialiasing', false)
	setProperty('pico.alpha', 0)
	scaleObject('pico', 0.25, 0.25);

	makeAnimatedLuaSprite('pico2', 'pico2', 440, 0)
	addLuaSprite('pico2',false)
    	addAnimationByPrefix('pico2','spin','pico2 clap',24,true)
 	setProperty('pico2.antialiasing', false)
	setProperty('pico2.alpha', 0)
	scaleObject('pico2', 0.25, 0.25);
	setProperty('pico2.flipX', true)

	makeAnimatedLuaSprite('dad', 'cat', -390, -130)
	addLuaSprite('dad',false)
    	addAnimationByPrefix('dad','spin','cat dad',24,true)
 	setProperty('dad.antialiasing', false)
	setProperty('dad.alpha', 0)
	scaleObject('dad', 0.33, 0.33);

	makeAnimatedLuaSprite('mom', 'cat', 510, -130)
	addLuaSprite('mom',false)
    	addAnimationByPrefix('mom','spin','cat mom',24,true)
 	setProperty('mom.antialiasing', false)
	setProperty('mom.alpha', 0)
	scaleObject('mom', 0.33, 0.33);

	makeAnimatedLuaSprite('yeah', 'gf', -225, 0)
	addLuaSprite('yeah',false)
    	addAnimationByPrefix('yeah','spin','gf yeah',24,true)
 	setProperty('yeah.antialiasing', false)
	setProperty('yeah.alpha', 0)
	scaleObject('yeah', 0.4, 0.4);

	makeAnimatedLuaSprite('yeah2', 'gf', 50, 0)
	addLuaSprite('yeah2',false)
    	addAnimationByPrefix('yeah2','spin','gf yeah',24,true)
 	setProperty('yeah2.antialiasing', false)
	setProperty('yeah2.alpha', 0)
	scaleObject('yeah2', 0.4, 0.4);
	setProperty('yeah2.flipX', true)

	makeAnimatedLuaSprite('bone', 'bone', -200, -90)
	addLuaSprite('bone',false)
    	addAnimationByPrefix('bone','spin','bone spooky',24,true)
 	setObjectOrder('bone', getObjectOrder('boyfriendGroup') + 1);
 	setProperty('bone.antialiasing', false)
	setProperty('bone.alpha', 0)
	scaleObject('bone', 0.45, 0.45);

	makeAnimatedLuaSprite('pumpkin', 'pumpkin', -200, -90)
	addLuaSprite('pumpkin',false)
    	addAnimationByPrefix('pumpkin','spin','pumpkin spooky',24,true)
 	setObjectOrder('pumpkin', getObjectOrder('boyfriendGroup') + 1);
 	setProperty('pumpkin.antialiasing', false)
	setProperty('pumpkin.alpha', 0)
	scaleObject('pumpkin', 0.45, 0.45);
end
