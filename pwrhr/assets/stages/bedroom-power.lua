function onCreatePost()
setObjectOrder('table',8);
setObjectOrder('gfGroup',7);

end
function onCreate()


	setProperty('gf.visible',false);

	-- background shit
	makeLuaSprite('room', 'bedroom/bedroom_backdrop', -567, -152);
	setLuaSpriteScrollFactor('room', 1.0, 1.0);	

	makeLuaSprite('bed', 'bedroom/bed', 27, 570);
	setLuaSpriteScrollFactor('bed', 1.0, 1.0);

   	makeAnimatedLuaSprite('table','bedroom/bedside_table', 1120, 460)
    	addAnimationByPrefix('table','bedroom/bedside_table','bedside table',24,true);
    	objectPlayAnimation('table','bedside table',false);
	setLuaSpriteScrollFactor('table', 1.2, 1.1);

	makeLuaSprite('lamp', 'bedroom/lamp', -106, -162);
	setLuaSpriteScrollFactor('lamp', 1.1, 1.2);
        setObjectOrder('lamp', 2);

   	makeAnimatedLuaSprite('stars','bedroom/the_cool_star_thing', 950, 250)
    	addAnimationByPrefix('stars','stars','stars',24,false);
    	objectPlayAnimation('stars','stars',false);
	setLuaSpriteScrollFactor('stars', 1.0, 1.0);


	addLuaSprite('room', false);

	addLuaSprite('bed',false);

	addLuaSprite('stars',false);

	addLuaSprite('lamp',false);
	
	addLuaSprite('table',false);


end

function onBeatHit()
	
	objectPlayAnimation('stars','stars' ,true);

end