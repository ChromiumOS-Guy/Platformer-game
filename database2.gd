#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Node

var shit = 0 
var Shopfack = false
var playerhp = 1
var Bosshp = 80
var playerhp2 = 4
var reload = false
var waypoint = 0
var maxplayerhp = 4
var maxBosshp = 80
var playerdamage = false
var Bossdamage = false
var MainMenu = false
var playerdamagefromEnemy = false
var BossdamagefromPlayer = false
var Qask = false
var vulnerable = false
var Lives = 5
var is_boss_fite = false
var coinfound = false
var win = false
var die = false
var Main = false
var openpause = false
var jump = false


func load_game():
	var file = File.new()
	
	if not file.file_exists("user://Database/jsons/gravitymodecap.json"):
		print("error gravitymodecap.json can't be found please open the user Directory and make a json file with the name gravitymodecap")
		createsave()
		return
	
	file.open("user://Database/jsons/gravitymodecap.json" , file.READ)
	
	var text = file.get_as_text()
	
	Database.SpeedBoostcap = parse_json(text)
	
	file.close()
	
	print(text)
	load_game2()
	

func load_game2():
	var file = File.new()
	
	if not file.file_exists("user://Database/jsons/PlayerHP.json"):
		print("error PlayerHP.json can't be found please open the user Directory and make a json file with the name PlayerHP")
		createsave2()
		return
	
	file.open("user://Database/jsons/PlayerHP.json" , file.READ)
	
	var text = file.get_as_text()
	
	playerhp = parse_json(text)
	
	file.close()
	
	print(text)
	load_game3()

func load_game3():
	var file = File.new()
	
	if not file.file_exists("user://Database/jsons/Waypointunlock.json"):
		print("error Waypointunlock.json can't be found please open the user Directory and make a json file with the name PlayerHP")
		createsave3()
		return
	
	file.open("user://Database/jsons/Waypointunlock.json" , file.READ)
	
	var text = file.get_as_text()
	
	waypoint = parse_json(text)
	
	file.close()
	
	print(text)


func savegame():
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/gravitymodecap.json", File.WRITE)
	
	file.store_line(to_json(Database.SpeedBoostcap))
	
	file.close()
	savegame2()

func savegame2():
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/PlayerHP.json", File.WRITE)
	
	file.store_line(to_json(playerhp))
	
	file.close()
	savegame3()


func savegame3():
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/Waypointunlock.json", File.WRITE)
	
	file.store_line(to_json(waypoint))
	
	file.close()

func createsave():
	
	
	
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/gravitymodecap.json", File.WRITE)
	
	file.store_line(to_json(shit))
	
	file.close()
	

func createsave2():
	
	
	
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/PlayerHP.json", File.WRITE)
	
	file.store_line(to_json(playerhp2))
	
	file.close()

func createsave3():
	
	
	
	var file
	
	file = File.new()
	
	file.open("user://Database/jsons/Waypointunlock.json", File.WRITE)
	
	file.store_line(to_json(waypoint))
	
	file.close()
	

