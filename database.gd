#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Node

var dir = Directory
var coin = 0
var coinsave = 0
var havecoins = false
var reload = true
var SpeedBoost = 3500
var SpeedBoostcap = 0
var SpeedBoostnum = true
var shit = 0
var lol = false
func load_game():
	var file = File.new()
	var dir = Directory.new()
	
	if not dir.dir_exists("user://Database/jsons"):
		print("error game can't user Directory Database -> jsons")
		createsavedir()
		return
	
	elif not file.file_exists("user://Database/jsons/coins.json"):
		print("error coins.json can't be found please open the user Directory and make a json file with the name coins")
		createsave()
		return
	
	file.open("user://Database/jsons/coins.json" , file.READ)
	
	var text = file.get_as_text()
	
	coinsave = parse_json(text)
	
	file.close()
	
	print(text)
	
	Database2.load_game()
	


func savegame():
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/coins.json", File.WRITE)
	
	file.store_line(to_json(coinsave))
	
	file.close()
	
	Database2.savegame()

func createsave():
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/coins.json", File.WRITE)
	
	file.store_line(to_json(shit))
	
	file.close()
	
func createsavedir():
	var dir = Directory.new()
	dir.open("user://")
	dir.make_dir("Database")
	dir = Directory.new()
	dir.open("user://Database")
	dir.make_dir("jsons")
