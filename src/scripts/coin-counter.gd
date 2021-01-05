#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Label
var a = str(Database.coinsave)
func _process(_delta):
	set_text(a)
