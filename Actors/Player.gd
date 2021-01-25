#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Actor
class_name player

signal grounded_updated(is_grounded)

export var stomp_impulse: = 1560
onready var player_anim = $AnimatedSprite/AnimationPlayer
onready var AudioStreamPlayerJump = $Jump
onready var coinplayer = $coin
export (NodePath) var joystickLeftPath
onready var joystickLeft : Joystick = get_node(joystickLeftPath)
onready var AudioStreamPlayerhp = $"-hp"
var jumpsound = true
var hitecombo = true
var y = 0
var x = 0
var plat = false
var coinfinshid = true
var left = false
var is_grounded
func _ready():
	coinplayer.volume_db = Database2.Sound
	AudioStreamPlayerJump.volume_db = Database2.Sound
	AudioStreamPlayerhp.volume_db = Database2.Sound
	print("player spawnd success")

func _on_StompDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)


func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Enemy"):
		Database2.reload = true
		die()

func _on_spikeDetector_body_entered(body):
	if body.is_in_group("spike"):
		if Database2.playerhp != 0:
			Database2.playerhp -= 1
			Database2.playerdamage = true
			Database2.playerdamagefromEnemy = true


func _on_BossDetector_body_entered(body):
	if body.is_in_group("Boss"):
		Database2.reload = true
		if Database2.playerhp > 1 and hitecombo:
			Database2.playerhp -= 2
			Database2.playerdamage = true
			Database2.playerdamagefromEnemy = true
			hitecombo = false
		elif Database2.playerhp > 1 and not hitecombo:
			Database2.playerhp -= 1
			Database2.playerdamage = true
			Database2.playerdamagefromEnemy = true
			hitecombo = true
		elif Database2.playerhp == 1 or Database2.playerhp < 0:
			Database2.playerhp = 0
			Database2.playerdamage = true
			Database2.playerdamagefromEnemy = true


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	var was_grounded = is_grounded
	is_grounded = is_on_floor()
	
	if was_grounded == null || is_grounded != was_grounded:
		emit_signal("grounded_updated", is_grounded)
	if plat:
		if not Input.is_action_just_pressed("jump") or not Database2.jump:
			_velocity.x += (get_floor_velocity().x * delta * 0.01)
			gravity = 0
		else:
			gravity = 3500
	_velocity = move_and_slide_with_snap(
		_velocity, snap, FLOOR_NORMAL, true
	)
	if Database2.playerhp < 0 or Database2.playerhp == 0:
		die()
	x = x + (1 * delta)
	y = y + (1 * delta)
	if Database2.jump and jumpsound and y > 1:
		jumpsound = false
		y = 0
		AudioStreamPlayerJump.play()
	if joystickLeft.output.x > 0 and joystickLeft.is_working and is_on_floor():
		player_anim.play("run")
		left = false
	if joystickLeft.output.x < 0 and joystickLeft.is_working and is_on_floor():
		player_anim.play("run2")
		left = true
	if Database2.jump and joystickLeft.output.x > 0:
		player_anim.play("jump")
	if Database2.jump and joystickLeft.output.x < 0:
		player_anim.play("jump2")
	if Database2.coinfound == true:
		Database2.coinfound = false
		player_anim.play("findcoin")
	if not joystickLeft.is_working and left == false and not Database2.jump and is_on_floor() and x > 0.5:
		x = 0
		player_anim.play("idle")
	if not joystickLeft.is_working and left == true and not Database2.jump and is_on_floor() and x > 0.5:
		x = 0
		player_anim.play("idle2")
	if Database2.win == true:
		player_anim.play("Win")
		Database2.win = false
	if Database2.Main == true:
		Database2.Main = false
		Database2.Sound = Database2.soundonplayer
		get_tree().change_scene("res://src/Screens/MainScreen.tscn")
	if Database2.pickedistrue:
		Database2.pickedistrue = false
		if coinfinshid:
			coinplayer.play()
			coinfinshid = false
	

#Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
#-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
#joystickLeft.output.x
#-1 if is_on_floor() and Database2.jump else 0.0

func get_direction() -> Vector2:
	return Vector2(
		joystickLeft.output.x,
		-1 if is_on_floor() and Database2.jump else 0.0
	)
	
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		#velocity.y = 0.0
		pass
	return velocity


func calculate_stomp_velocity(linear_velocity: Vector2, stomp_impulse: float) -> Vector2:
	var stomp_jump: = -speed.y if Input.is_action_pressed("jump") else -stomp_impulse
	return Vector2(linear_velocity.x, stomp_jump)


func die() -> void:
	if Database2.playerhp == 0 or Database2.playerhp < 0:
		PlayerData.deaths += 1
		hide()
	else:
		Database2.playerdamage = true
		Database2.playerdamagefromEnemy = true
		if Database2.playerhp > 0:
			Database2.playerhp = Database2.playerhp - 1
			AudioStreamPlayerhp.play()
		else:
			Database2.playerhp = 1
			AudioStreamPlayerhp.play()
		



func _on_Jump_finished():
	jumpsound = true


func _on_PlatformDetector_body_entered(body):
	if body.is_in_group("Platforms"):
		plat = true


func _on_PlatformDetector_body_exited(body):
	if body.is_in_group("Platforms"):
		plat = false


func _on_coin_finished():
	coinfinshid = true
