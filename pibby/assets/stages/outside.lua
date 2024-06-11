function onCreate()



  
  makeLuaSprite("outside","outside",-1430,-920)
  scaleObject('outside', 1.8,1.8)
  addLuaSprite("outside")
  
          makeLuaSprite('bg','darwiBG',-1130,-450)
		  scaleObject('bg', 1.2,1.2)
  addLuaSprite('bg', false)
  
      makeLuaSprite('int', 'thefish', 0, 0)
    setObjectCamera('int', 'other')
	addLuaSprite('int', true);
   setProperty('int.alpha',0)
   
     makeLuaSprite('darklight','darklight',-350,-250)
	 scaleObject('darklight', 0.6,0.8)
  addLuaSprite('darklight', true)
  
       makeLuaSprite('light','light',-350,-250)
	 scaleObject('light', 0.6,0.8)
  addLuaSprite('light', true)
  
  setProperty('light.alpha', 0)
    setProperty('darklight.alpha', 0)
      setProperty('bg.alpha', 0)

addCharacterToList('darwi-kids', 'dad')
addCharacterToList('darwi-old', 'dad')
addCharacterToList('bf-darwi2', 'boyfriend')

runHaxeCode([[
      game.initLuaShader('chromabber');
      chroma = game.createRuntimeShader('chromabber');
      game.camGame.setFilters([new ShaderFilter(chroma)]); 
      ]])



end

function onUpdate(e,elapsed)

end