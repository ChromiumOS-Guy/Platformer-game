#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game


extends Node


onready var scene_tree: SceneTree = get_tree()
onready var score_label: Label = $Joystick/Score
onready var gravite_label: Label = $Joystick/gravite
onready var pause_overlay: ColorRect = $Control2/PauseOverlay
onready var title_label: Label = $Control2/PauseOverlay/Title
onready var unpauseButton = $Control2/PauseOverlay/PauseMenu/unPause
onready var Boss_Lives_label: Label = $lives/Lives
onready var game_music = $mainmenumusic
onready var Game_over_sound = $gameover
onready var lives_sound = $onelive
onready var Enemy_die = $Enemydie
onready var Health_bar = $HealthBar
#onready var main_screen_button: Button = $PauseOverlay/PauseMenu/MainScreenButton
onready var LoadingScreen = $LoadingScreen
onready var Qask = $Control2/Qask
export var loadprecent = 100
export(String, FILE) var Load_scene_path: = ""
export var is_boss_fite = false
var new_precent = 0
var hss = false
var nohp = false
const MESSAGE_DIED: = "You died"
var de125 = true
var paused: = false setget set_paused


func _ready() -> void:
	if Database2.playerhp > 0:
		Health_bar._on_health_updated()
		game_music.play()
	else:
		game_music.stop()
	if is_boss_fite:
		Boss_Lives_label.show()
		Database2.is_boss_fite = true
	if load(Load_scene_path):
		new_precent += loadprecent
		LoadingScreen.update_precent(new_precent)
	PlayerData.connect("updated", self, "update_interface")
	PlayerData.connect("died", self, "_on_Player_died")
	update_interface()
	update_interface2()

func _get_configuration_warning() -> String:
	return "The property LoadingScreen Loadlevel Level can't be empty" if Load_scene_path == "" else ""

func _on_Player_died() -> void:
	self.paused = true
	title_label.text = MESSAGE_DIED
	unpauseButton.hide()


func _unhandled_input(event: InputEvent) -> void:
	if not Database.lol == true:
		if event.is_action_pressed("hide") and title_label.text != MESSAGE_DIED:
			self.paused = not self.paused
	else:
		print("more options is open")
		pass


func update_interface() -> void:
	score_label.text = "Score: %s" % PlayerData.score
	gravite_label.text = "Low gravity Modes: %s" % Database.SpeedBoostcap
	Boss_Lives_label.text = "Lives Befor Boss Reset: %s" % Database2.Lives

func update_interface2() -> void:
	print("-1 HP point successfully taken from the player")


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

func _process(delta):
	if not is_boss_fite and Database2.playerhp < 0 or not is_boss_fite and Database2.playerhp == 0:
		Game_over_sound.play()
		if Database2.playerhp == 0:
			hss = true
			game_music.stop()
			Database2.playerhp = 1
			if Database.coinsave > 100 or Database.coinsave == 100:
				Database.coinsave = Database.coinsave - 100
			else:
				Database.coinsave = 0
	if is_boss_fite and Database2.playerhp < 0 or is_boss_fite and Database2.playerhp == 0:
		lives_sound.play()
		if Database2.playerhp == 0:
			hss = true
			game_music.stop()
			Database2.playerhp = 1
			if Database.coinsave > 100 or Database.coinsave == 100:
				Database.coinsave = Database.coinsave - 100
			else:
				Database.coinsave = 0
	if Database2.die == true:
		Database2.die = false
		Enemy_die.play()
	if Database2.reload == true:
		Database2.reload = false
		update_interface2()
	if Database2.Qask:
		self.paused = true
		pause_overlay.hide()
		Qask.show()
	
		
		


func _on_mainmenumusic_finished():
	if not hss:
		hss = false
		game_music.play()


func _on_MainMenuButton_pressed():
	Database2.Main = true
	self.paused = false


func _on_Button_pressed():
	self.paused = false


func _on_1_pressed():
	self.paused = true




func _on_TouchScreenButton_pressed():
	Database2.jump = true


func _on_TouchScreenButton_released():
	Database2.jump = false
