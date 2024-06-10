function onCreate()
	precacheImage('characters/demon')
	addCharacterToList('demon','boyfriend')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'demon'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', ''); --Put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', ''); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', ''); --put in mods/music/
end