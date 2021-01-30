#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game

extends Node

const SAVE_DIR = "user://Database/"

var save_path = SAVE_DIR + "save.dat"

func save():
	var data = {
		"waypoint" : Database2.waypoint,
		"SpeedBoostcap" : Database.SpeedBoostcap,
		"playerhp" : Database2.playerhp,
		"coinsave" : Database.coinsave,
		"Sound" : Database2.Sound,
	}
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE , "EtE34TR")
	if error == OK:
		file.store_var(data)
		file.close()

func Load():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ , "EtE34TR")
		if error == OK:
			var player_data = file.get_var()
			file.close()
			Database2.playerhp = player_data["playerhp"]
			Database2.waypoint = player_data["waypoint"]
			Database.SpeedBoostcap = player_data["SpeedBoostcap"]
			Database.coinsave = player_data["coinsave"]
			Database2.Sound = player_data["Sound"]
