extends Node

const FILEPATH = "user://highscore.save"

var highScore = 0 setget set_high_score
var score = 0

func _ready():
	load_high_score()

func load_high_score():
	var file = File.new()
	
	if not file.file_exists(FILEPATH): return
	
	file.open(FILEPATH, File.READ)
	highScore = file.get_var()
	file.close()

func save_high_score():
	var file = File.new()
	file.open(FILEPATH, File.WRITE)
	file.store_var(highScore)
	file.close()

func set_high_score(newScore):
	highScore = newScore
	save_high_score()