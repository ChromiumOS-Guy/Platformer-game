#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Area2D
var pickedistrue = false
onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var sound_coin = $coinpicked
var x = 0
export var score: = 100


func ready():
	sound_coin.volume_db = Database2.Sound

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		picked()


func picked() -> void:
	PlayerData.score += score
	Database2.coinfound = true
	Database2.pickedistrue = true
	anim_player.play("picked")
