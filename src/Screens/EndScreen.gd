#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game



extends Control


onready var result: Label = $Control/Result
onready var win_sound: AudioStreamPlayer = $Winsound

func _ready() -> void:
	result.text = result.text % [Database.coin , PlayerData.deaths]
	win_sound.play()
