extends Node

var score = 0
var timer = 0

func _ready():
	randomize()

func _process(delta):
	if timer >= 120 and !$Player.died:
		score += 1
		timer = 0
		$ScoreLabel.text = str(score)
	else:
		timer += 1

func game_over():
	pass

func new_game():
	score = 0
	timer = 0