#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Label
var a = str(Database.SpeedBoostcap)
func _ready() -> void:
	set_text("Speed-Boosts: %s" % a)
