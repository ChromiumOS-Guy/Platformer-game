#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Control


onready var LoadTween = $LoadTween
onready var LoadScreenAnim = $LoadScreenAnim
onready var LoadingBar = $LoadingBar


func update_precent(new_precent):
	LoadTween.interpolate_property(LoadingBar, "value", LoadingBar.value, new_precent, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	LoadTween.start()
	
	yield(LoadTween, "tween_completed")
	
	if new_precent == LoadingBar.max_value or new_precent > LoadingBar.max_value:
		LoadScreenAnim.play("HideLoadScreen")
		hide()
