local xx = 550;
local yy = 435;
local xx2 = 980;
local yy2 = 455;
local ofs = 35;
local ofs2 = 40;


function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bf');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverTails'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEndTails'); --put in mods/music/
end
