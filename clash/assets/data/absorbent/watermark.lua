function onCreate()
makeLuaSprite('Nickoledon', 'Nickoledon', 1000, 625)
setObjectCamera('Nickoledon', 'other')
addLuaSprite('Nickoledon')
setObjectOrder('Nickoledon', 999999999)
end
function onCreatePost()
setProperty('Nickoledon.alpha', 0.42069)
setProperty('Nickoledon.scale.x', 1.5)
setProperty('Nickoledon.scale.y', 1.5)
end