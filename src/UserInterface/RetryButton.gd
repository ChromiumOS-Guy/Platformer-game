#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Button


func _on_button_up() -> void:
	PlayerData.score = 0
	Database.SpeedBoost = 3500
	Database.SpeedBoostnum = true
	Database.lol = false
	if Database2.Lives > 0 and Database2.is_boss_fite:
		Database2.Lives -= 1
	elif Database2.Lives == 0 and Database2.is_boss_fite:
		Database2.Bosshp = 100
		Database2.Lives = 12
	if Database2.playerhp == 0 or Database2.playerhp < 0:
			Database2.playerhp = 1
			if Database.coinsave > 100:
				Database.coinsave -= 100
			else:
				Database.coinsave = 0
	Database.savegame()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_RetryButton3_pressed():
	PlayerData.score = 0
	Database.SpeedBoost = 3500
	Database.SpeedBoostnum = true
	Database.lol = false
	Database2.playerhp = 1
	Database2.Qask = false
	if Database2.Lives > 0 and Database2.is_boss_fite:
		Database2.Lives -= 1
	elif Database2.Lives == 0 and Database2.is_boss_fite:
		Database2.Bosshp = 100
		Database2.Lives = 12
	if Database2.playerhp == 0 or Database2.playerhp < 0:
			Database2.playerhp = 1
			if Database.coinsave > 100:
				Database.coinsave -= 100
			else:
				Database.coinsave = 0
	Database.savegame()
	get_tree().paused = false
	get_tree().reload_current_scene()
