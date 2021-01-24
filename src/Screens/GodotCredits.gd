#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Node2D

const section_time := 2.0
const line_time := 0.3
const base_speed := 100
const speed_up_multiplier := 5.0
const title_color := Color.yellowgreen

var scroll_speed := base_speed
var speed_up := false
var speed_up2 := false

onready var line := $CreditsContainer/Line
var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"A game by Alon-Arvatz"
	],[
		"Programming:",
		"",
		"Alon-Arvatz"
	],[
		"Art:",
		"",
		"Alon-Arvatz"
	],[
		"Music:",
		"",
		"Alon-Arvatz"
	],[
		"Sound Effects:",
		"",
		"Alon-Arvatz"
	],[
		"Testers:",
		"",
		"Alon-Arvatz"
	],[
		"Tools used:",
		"",
		"Developed with Godot Engine",
		"",
		"https://godotengine.org/license",
		"",
		"",
		"Art created with pixlr E",
		"",
		"https://pixlr.com/e/"
	],[
		"Special thanks",
		"",
		"My friends",
		"",
		"And Family"
	]
]


func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		get_tree().change_scene("res://src/Screens/MainScreen.tscn")

func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_color_override("font_color", title_color)
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true

func _unhandled_input(event):
	if Input.get_action_strength("hide"):
		finish()
	if event.is_action_pressed("fast") and !event.is_echo():
		speed_up = true
	if event.is_action_released("fast") and !event.is_echo():
		speed_up = false


func _on_Button_pressed():
	finish()
