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
var tranformx = 0.000
var dis = false
var vel = 0.00
func load_game():
	GameSaver.Load()
	print("loaded game")
	


func savegame():
	GameSaver.save()
	print("saved game")
