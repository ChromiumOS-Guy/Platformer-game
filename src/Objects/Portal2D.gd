#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game



tool
extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene

export var levelwaypoint = 0

func _on_body_entered(body: PhysicsBody2D):
	teleport()


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if not next_scene else ""

func waypointadd():
	if Database2.waypoint > levelwaypoint:
		return
	elif not Database2.waypoint > levelwaypoint and Database2.waypoint < levelwaypoint:
		Database2.waypoint = levelwaypoint


func teleport() -> void:
	waypointadd()
	if PlayerData.score > 0:
		Database.coin = PlayerData.score / 6
		Database.coinsave = Database.coin + Database.coinsave
		Database.SpeedBoost = 3500
	else:
		Database.coin = 0
	Database.savegame()
	Database.load_game()
	anim_player.play("fade_out")
	yield(anim_player, "animation_finished")
	PlayerData.score = 0
	Database.SpeedBoostnum = true
	get_tree().change_scene_to(next_scene)
	

# code for waypoint portal:


#Database2.playerhp = 2
#	if Database2.playerhp == 2:
#		print("All HP points successfully reloaded for player")
#	else:
#		print("erorr HP points unsuccessfully reloaded for player")
