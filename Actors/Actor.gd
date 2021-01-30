#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game

extends KinematicBody2D
class_name Actor


const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(400.0, 500.0)
export var gravity: = 3500.0

func _process(delta):
	gravity = Database.SpeedBoost

var _velocity: = Vector2.ZERO


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
