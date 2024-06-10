function onCreate()
	makeLuaSprite('apartmentSky','apartment/apartmentSky',-1270,160)
	addLuaSprite('apartmentSky',false)
	scaleObject('apartmentSky',4.6,4.6)

	makeLuaSprite('apartmentInterior','apartment/apartmentInterior',-1500,0)
	scaleObject('apartmentInterior', 4.0, 4.0);
	addLuaSprite('apartmentInterior',false)

	makeLuaSprite('lights_off','apartment/lights_off',-1500,0)
	addLuaSprite('lights_off',false)
	scaleObject('lights_off', 4.0, 4.0);
	setProperty('lights_off.visible',false)

	makeAnimatedLuaSprite('ghosts','apartment/ghosts',-1350,50)
	addLuaSprite('ghosts',false)
	scaleObject('ghosts',1.8,1.8)
	addAnimationByPrefix('ghosts','idle','ghosts ghosts bop animation',24,false)
	setProperty('ghosts.alpha',0.6)
	setProperty('ghosts.visible',false)
	setProperty('dadGroup.visible',false)

	setObjectOrder('boyfriendGroup',3)
	setObjectOrder('dadGroup',3)
end
function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('ghosts','idle',true)
	end
end