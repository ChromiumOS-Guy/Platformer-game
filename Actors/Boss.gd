#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Actor

onready var Health = $HealthBar
onready var stomp_area: Area2D = $StompArea2D
onready var vulnerable = $vulnerable
onready var Anim = $AnimationPlayer
onready var bossout = $bossout
export var makeplayephase = false
export var score: = 10000
var x = 0
var y = 1

func _ready() -> void:
	bossout.volume_db = Database2.Sound
	print("Enemy spawnd success")
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	#print("Platform Collided with: ", collision.collider.name)
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	x = x + (y * delta)
	stomp_area.set_collision_mask_bit(0, false)
	vulnerable.hide()
	if x > 3:
		stomp_area.set_collision_mask_bit(0, true)
		vulnerable.show()
		Database2.vulnerable = true
	if x > 5.56:
		stomp_area.set_collision_mask_bit(0, false)
		vulnerable.hide()
		Database2.vulnerable = false
		x = 0
		y = 1

#	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	Database.dis = true
	die()


func die() -> void:
	Database.bossdamage = true
	if Database2.Bosshp > 1:
		Database2.Bosshp -= 2
		Database2.Bossdamage = true
		Database2.BossdamagefromPlayer = true
		bossout.play()
	if Database2.Bosshp == 1 or Database2.Bosshp < 1:
		Database2.Bosshp = 0
		Database2.Bossdamage = true
		Database2.BossdamagefromPlayer = true
		Database.coinsave += 2500
		Database2.win = true
		Anim.play("WIN")
		yield(Anim, "animation_finished")
		get_tree().change_scene("res://src/Screens/EndScreenlose.tscn")
