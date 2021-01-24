#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game


extends Control

onready var LoadingScreen = $LoadingScreen
onready var slide = $Control2/GridContainer/VSlider
export var loadprecent = 17
var screen_size : Vector2 = Vector2()
#LoadingScreen.update_precent(new_precent)
var new_precent = 0

func _ready():
	slide.value = Database2.Sound2
	if load("res://src/Screens/ShopScreen.tscn"):
		new_precent += loadprecent
		LoadingScreen.update_precent(new_precent)
	if load("res://src/Screens/Waypoints.tscn"):
		new_precent += loadprecent
		LoadingScreen.update_precent(new_precent)
	if load("res://src/Screens/EndScreen.tscn"):
		new_precent += loadprecent
		LoadingScreen.update_precent(new_precent)
	if load("res://src/UserInterface/UI Player Health Bar.tscn"):
		new_precent += loadprecent
		LoadingScreen.update_precent(new_precent)
	if load("res://src/UserInterface/UserInterface.tscn"):
		new_precent += loadprecent
		LoadingScreen.update_precent(new_precent)
	if load("res://src/Screens/mainstory.tscn"):
		new_precent += loadprecent
		LoadingScreen.update_precent(new_precent)
	screen_size = OS.get_screen_size()


func _on_VSlider_value_changed(value):
	Database2.Sound = value

# Gets the screen size to test in futur if its change since their

func _process(delta) -> void:
	if OS.get_screen_size() != screen_size: #Tests if your screen changed in size, e.g a different monitor
		screen_size = OS.get_screen_size()
		OS.set_window_size(screen_size)# Sets your window to your screen size

