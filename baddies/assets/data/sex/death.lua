function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'novaBed'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'jasmineDeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverlatina'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverlatinaEnd'); --put in mods/music/
end