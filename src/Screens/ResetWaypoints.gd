#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Button



func _on_Button_pressed():
	Database2.waypoint = 0
	Database.savegame()
