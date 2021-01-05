#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends KinematicBody2D
var _velocity: = Vector2.ZERO
export var speed: = Vector2(400.0, 500.0)
const FLOOR_NORMAL: = Vector2.UP
export var platformpausetime = 0.08
export var makeplayephase = false
var shit = true
export var godownfirst = false
var x = 0
var y = 1
func _ready() -> void:
	print("moving platform spawnd success")
	if godownfirst == false:
		_velocity.x = -speed.x
	else:
		_velocity.x = +speed.x


func _physics_process(delta: float) -> void:
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#print("Platform Collided with: ", collision.collider.name)
		_velocity.x *= -1 if is_on_wall() and not collision.collider.name == "Player" else 1
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
				_velocity.x *= -1 if is_on_wall() else 1
				x = 0
				y = 1
	
	_velocity.y = move_and_slide(_velocity).y
#set_collision_mask(int mask)  
#set_layer_mask(int mask) 
