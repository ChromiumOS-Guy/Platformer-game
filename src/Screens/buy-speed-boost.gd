#author Alon Arvatz
#Github https://github.com/alonarvatz/Platformer-game



extends Button
var shit = -10000
var lock = false
export var next_scene: PackedScene
export var next_scene2: PackedScene

func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if not next_scene else ""
	return "The property Next Level can't be empty" if not next_scene2 else ""

func _process(delta):
	if lock == false:
		if Database.coinsave < 10000:
			Database.havecoins = false
		elif Database.coinsave > 10000 or Database.coinsave == 10000:
			Database.havecoins = true

func _on_meme_pressed():
	if Database.havecoins == true:
		Database.coinsave = Database.coinsave + shit
		Database.havecoins = false
		if Database.SpeedBoostcap == 0:
			Database.SpeedBoostcap = Database.SpeedBoostcap + 1
		elif Database.SpeedBoostcap > 0 and Database.SpeedBoostcap < 8:
			Database.SpeedBoostcap = Database.SpeedBoostcap + 1
		elif Database.SpeedBoostcap == 8:
			Database.coinsave = Database.coinsave + 10000
			Database.havecoins = false
			lock = true
		print(Database.coinsave)
		Database.savegame()
		get_tree().reload_current_scene()
	elif Database.havecoins == false:
		get_tree().change_scene_to(next_scene2)
		print(Database.coinsave)
		print(Database.coinsave)
		Database.savegame()
		
	elif lock == true:
		get_tree().change_scene_to(next_scene)
		print(Database.coinsave)
		print(Database.coinsave)
		Database.savegame()



