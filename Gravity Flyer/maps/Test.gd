extends Node

var timer = 0
var deathTimer = 120

func _ready():
	randomize()

func _process(delta):
	if timer >= 120 and !$Player.died:
		Global.score += 1
		timer = 0
		$ScoreLabel.text = str(Global.score)
	else:
		timer += 1
	
	if $Player.died:
		game_over()

func game_over():
	if deathTimer <= 0:
		print(str(deathTimer))
		get_tree().change_scene("res://system/GameOverMenu.tscn")
	deathTimer -= 1

func new_game():
	Global.score = 0
	timer = 0