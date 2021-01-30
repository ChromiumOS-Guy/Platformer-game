#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game


extends Camera2D


const LOOK_AHEAD_FACTOR = 0.1
const SHIFT_TRANS = Tween.TRANS_SINE
const SHIFT_EASE = Tween.EASE_OUT
const SHIFT_DURATION = 1.0

var facing = 0
onready var prev_camera_pos = get_camera_position()
onready var tween = $ShiftTween
onready var ScreenShake = $ScreenShake

func _process(delta):
	_check_facing()
	prev_camera_pos = get_camera_position()
	if Database2.is_boss_fite == true:
		if Database.bossdamage == true:
			ScreenShake.start(0.2, 15, 100 ,0)
			Database.bossdamage = false

func _check_facing():
	var new_facing = sign(get_camera_position().x - prev_camera_pos.x)
	if new_facing != 0 && facing != new_facing:
		facing = new_facing
		var traget_offset = get_viewport_rect().size.x * LOOK_AHEAD_FACTOR * facing
		tween.interpolate_property(self , "position:x", position.x , traget_offset, SHIFT_DURATION, SHIFT_TRANS, SHIFT_EASE)
		tween.start()

func _on_Player_grounded_updated(is_grounded):
	drag_margin_v_enabled = !is_grounded
