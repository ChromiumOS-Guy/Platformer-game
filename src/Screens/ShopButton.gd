#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Button

func _on_ShopButton_pressed() -> void:
	PlayerData.reset()
	get_tree().change_scene("res://src/Screens/ShopScreen.tscn")
	Database.load_game()
	Database.savegame()
	Database2.Shopfack = true
	

