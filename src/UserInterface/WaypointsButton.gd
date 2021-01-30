#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game

tool
extends Button

export(String, FILE) var next_scene_path: = ""

export var level = 0

var yes = false
func _ready():
	if Database2.waypoint == level or Database2.waypoint > level:
		yes = true
		show()
	elif Database2.waypoint < level:
		yes = false
		hide()
		



func _on_Button_pressed() -> void:
	PlayerData.reset()
	get_tree().change_scene(next_scene_path)
	Database.load_game()


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_scene_path == "" else ""
