#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Button



func _on_Button_pressed():
	Database2.waypoint = 0
	Database.savegame()
