#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Actor


onready var stomp_area: Area2D = $StompArea2D
onready var die: AudioStreamPlayer = $die

export var score: = 100


func _ready() -> void:
	print("Enemy spawnd success")
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_velocity.x *= -1 if is_on_wall() else 1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	die()



func die() -> void:
	PlayerData.score += score
	Database2.die = true
	queue_free()
