#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Area2D
export var Respawntime = 7
var x = 0
var y = 1
onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var HP_sound: AudioStreamPlayer = $HPpicked
var h = false

func _on_HP_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		picked()


func picked() -> void:
	if Database2.playerhp == Database2.maxplayerhp:
		print("players HP is full")
	elif Database2.playerhp < Database2.maxplayerhp:
		Database2.playerdamage = true
		Database2.playerhp += 1
		print("Added 1 HP point to player successfully")
		Database2.reload = true
		h = true
		Database2.coinfound = true
		HP_sound.play()
		anim_player.play("picked")
		set_collision_mask_bit(0, false)

func _process(delta):
	x = x + (y * delta)
	if x > Respawntime and h == true:
		anim_player.play("Respawn")
		set_collision_mask_bit(0, true)
		x = 0
		y = 1
		h = false
