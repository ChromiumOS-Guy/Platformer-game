#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game

extends Control

signal pulse()

const FLASH_RATE = 0.05
const N_FLASHES = 4

onready var health_bar = $HealthBar
onready var health_under = $HealthUnder
onready var update_tween = $UpdateTween
onready var flash_tween = $FlashTween

export (Color) var healthy_color = Color.green
export (Color) var caution_color = Color.yellow
export (Color) var danger_color = Color.red
export (Color) var flash_color = Color.orangered
export (float, 0, 1, 0.05) var caution_zone = 0.75
export (float, 0, 1, 0.05) var danger_zone = 0.2
export (bool) var will_pulse = false


func _ready():
	_on_health_updated()
	_on_max_health_updated()
	

func _process(_delta):
	if Database2.Bossdamage == true:
		Database2.Bossdamage = false
		_on_health_updated()
		print("updated Boss HealthBar")
func _on_health_updated():
	health_bar.value = Database2.Bosshp
	update_tween.interpolate_property(health_under, "value", health_under.value, Database2.Bosshp, 0.7, Tween.TRANS_SINE, Tween.EASE_OUT)
	update_tween.start()
	_assign_color()
	if Database2.BossdamagefromPlayer == true:
		Database2.BossdamagefromPlayer = false
		_flash_damage()
		

func _assign_color():
	if Database2.Bosshp < health_bar.max_value * danger_zone:
		health_bar.tint_progress = danger_color

	elif Database2.Bosshp < health_bar.max_value * caution_zone:
		health_bar.tint_progress = caution_color
	else:
		health_bar.tint_progress = healthy_color

func _flash_damage():
	for i in range(N_FLASHES * 2):
		var color = health_bar.tint_progress if i % 2 == 1 else flash_color
		var time = FLASH_RATE * i + FLASH_RATE
		flash_tween.interpolate_callback(health_bar, time, "set", "tint_progress", color)
		flash_tween.start()

func _on_max_health_updated():
	health_bar.max_value = Database2.maxBosshp
	health_under.max_value = Database2.maxBosshp
