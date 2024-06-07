local xx = 550;
local yy = 435;
local xx2 = 980;
local yy2 = 555;
local ofs = 25;
local ofs2 = 40;

function onCreate()
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverTails'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEndTails'); --put in mods/music/
end

