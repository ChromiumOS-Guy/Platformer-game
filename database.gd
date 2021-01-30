#author ChromiumOS-Guy
#Github https://github.com/ChromiumOS-Guy/Platformer-game

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
var bossdamage = false
func load_game():
	GameSaver.Load()
	print("loaded game")
	


func savegame():
	GameSaver.save()
	print("saved game")
