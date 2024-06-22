function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'nyan'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'nyanDeathSFX'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end