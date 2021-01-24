#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Button


func _on_button_up() -> void:
	Database.savegame()
	if Database2.playerhp == 0:
			Database2.playerhp = 1
			if Database.coinsave > 100 or Database.coinsave == 100:
				Database.coinsave = Database.coinsave - 100
			else:
				Database.coinsave = 0
	get_tree().quit()

func _on_QuitButton2_pressed() -> void:
	Database.savegame()
	get_tree().quit()
