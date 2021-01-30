#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Label


var a = str(Database.SpeedBoostcap)
func _process(_delta):
	set_text("Low gravity Modes: %s" % a)
	if Database2.Shopfack == true:
		Database2.Shopfack = false
		get_tree().reload_current_scene()
