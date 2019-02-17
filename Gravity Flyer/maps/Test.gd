extends Node

var score = 0
var timer = 0
var gameOver = false

func _ready():
	randomize()

func _process(delta):
	if timer >= 120 and !gameOver:
		score += 1
		timer = 0
	else:
		timer += 1

func game_over():
	gameOver = true

func new_game():
	score = 0
	timer = 0