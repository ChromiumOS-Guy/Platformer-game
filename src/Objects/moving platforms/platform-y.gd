#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends KinematicBody2D
var _velocity: = Vector2.ZERO
export var speed: = Vector2(400.0, 500.0)
export var makeplayephase = true
const FLOOR_NORMAL: = Vector2.UP
export var godownfirst = false
export var platformpausetime = 0.08
var x = 0
var y = 1
func _ready() -> void:
	print("moving platform spawnd success")
	if godownfirst == false:
		_velocity.y = -speed.y
	else:
		_velocity.y = +speed.y

func _physics_process(delta: float) -> void:
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#print("Platform Collided with: ", collision.collider.name)
		_velocity.y *= -1 if is_on_wall() and not collision.collider.name == "Player" else 1
		if collision.collider.name == "Player" and makeplayephase == true:
			set_collision_mask_bit(0, false)
		elif not collision.collider.name == "Player":
			x = x + (y * delta)
			if x > platformpausetime:
				set_collision_mask_bit(0, true)
				x = 0
				y = 1
		if collision.collider.name == "Player" and makeplayephase == false:
			x = x + (y * delta)
			if x > 3:
				_velocity.y *= -1 if is_on_wall() else 1
				x = 0
				y = 1
			
	#_velocity.y *= -1 if is_on_wall() else 1
	_velocity.x = move_and_slide(_velocity).x

# X = X + (Y * Delta)
