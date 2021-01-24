#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game


extends Button



func _on_Button_pressed():
	Database.coinsave = Database.coinsave + 10000
	get_tree().change_scene("res://src/Screens/ShopScreen.tscn")
