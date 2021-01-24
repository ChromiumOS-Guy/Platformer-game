#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends ColorRect

func _process(delta):
	if Input.is_action_just_pressed("hide"):
		Database.lol = false
		hide()
	if Database.lol == true:
		show()


func _on_Button2_pressed():
	Database.lol = false
	hide()
