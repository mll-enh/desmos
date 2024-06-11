local n = false
function onEvent(t, v1, v2) -- fill in only value1
if t == 'deez' then --event name
if v1 == "true"
then n = true
else
n = false
end
setProperty('camHUD.angle', 0)
end
end
function onUpdate() -- scream at me if it doesnt work
if n == true then
setProperty('camHUD.angle', math.sin(curDecBeat)*2)
end
end 
