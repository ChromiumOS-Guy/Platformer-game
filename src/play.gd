#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



tool
extends Button


func _on_button_up() -> void:
	PlayerData.reset()
	Database.savegame()
	if Database2.waypoint == 0:
		get_tree().change_scene("res://src/Levels/Level00.tscn")
	if Database2.waypoint == 1:
		get_tree().change_scene("res://src/Levels/Level01.tscn")
	if Database2.waypoint == 2:
		get_tree().change_scene("res://src/Levels/Level02.tscn")
	if Database2.waypoint == 3:
		get_tree().change_scene("res://src/Levels/Level03.tscn")
	if Database2.waypoint == 4:
		get_tree().change_scene("res://src/Levels/Level04.tscn")
	if Database2.waypoint == 5:
		get_tree().change_scene("res://src/Levels/Level05.tscn")
	if Database2.waypoint == 6:
		get_tree().change_scene("res://src/Levels/Level06.tscn")
	if Database2.waypoint == 7:
		get_tree().change_scene("res://src/Levels/Level07.tscn")
	if Database2.waypoint == 8:
		get_tree().change_scene("res://src/Levels/Level08.tscn")
	if Database2.waypoint == 9:
		get_tree().change_scene("res://src/Levels/Level09.tscn")
