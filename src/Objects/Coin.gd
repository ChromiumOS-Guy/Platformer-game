#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var sound_coin = $coinpicked

export var score: = 100


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		picked()


func picked() -> void:
	PlayerData.score += score
	Database2.coinfound = true
	sound_coin.play()
	anim_player.play("picked")
