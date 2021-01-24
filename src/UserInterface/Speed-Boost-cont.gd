#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Label
var a = str(Database.SpeedBoostcap)
func _ready() -> void:
	set_text("Speed-Boosts: %s" % a)
