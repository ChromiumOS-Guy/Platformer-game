#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Button

func _on_ShopButton_pressed() -> void:
	PlayerData.reset()
	get_tree().change_scene("res://src/Screens/ShopScreen.tscn")
	Database.load_game()
	Database.savegame()
	Database2.Shopfack = true
	

