extends Button



func _on_donate_pressed():
	OS.shell_open("https://www.paypal.com/donate?hosted_button_id=C2P7CADJFMRGC")
	get_tree().quit()


func _on_github_pressed():
	OS.shell_open("https://github.com/ChromiumOS-Guy/Platformer-game")
	get_tree().quit()
