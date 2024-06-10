function onCreate()
	makeLuaSprite('apartmentSky','apartment/apartmentSky',-1270,160)
	addLuaSprite('apartmentSky',false)
	scaleObject('apartmentSky',4.6,4.6)

	makeLuaSprite('apartmentInterior','apartment/apartmentInterior',-1500,0)
	scaleObject('apartmentInterior', 4.0, 4.0);
	addLuaSprite('apartmentInterior',false)
end