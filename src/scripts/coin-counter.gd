#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Label
var a = str(Database.coinsave)
func _process(_delta):
	set_text(a)
