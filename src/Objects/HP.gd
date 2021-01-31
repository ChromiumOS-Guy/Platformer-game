#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Area2D
export var Respawntime = 7
var x = 0
var y = 1
onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var HP_sound: AudioStreamPlayer = $HPpicked
func ready():
	HP_sound.volume_db = Database2.Sound
func _on_HP_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		picked()


func picked() -> void:
	HP_sound.volume_db = Database2.Sound
	if Database2.playerhp == 4:
		print("players HP is full")
	elif Database2.playerhp < 4:
		Database2.playerdamage = true
		Database2.playerhp += 1
		print("Added 1 HP point to player successfully")
		Database2.reload = true
		Database2.coinfound = true
		HP_sound.play()
		anim_player.play("picked")
		set_collision_mask_bit(0, false)
