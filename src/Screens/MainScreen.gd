#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game


extends Control

onready var LoadingScreen = $LoadingScreen
export var loadprecent = 17
#LoadingScreen.update_precent(new_precent)
var new_precent = 0

func _ready():
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
