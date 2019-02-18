extends Control

var resultText = "Try harder next time..."
var currentScore = Global.score

func _ready():
	$ScoreDisplay.text = "Your score: " + str(Global.score)
	
	if(Global.score > 20):
		resultText = "Good job, proud of you."
	if(Global.score > 60):
		resultText = "Wo dude. Good job."
	if(Global.score > 100):
		resultText = "That's amazing. You're incredible."
	if(Global.score > 200):
		resultText = "What!? Now that's a high score."
	if(Global.score > 500):
		resultText = "You're a legend. Tell all your friends!"
	
	$ResultDisplay.text = resultText
	
	save_this_high_score()
	
	$HighScoreDisplay.text = "High Score: " + str(Global.highScore)
	
	Global.score = 0

func _on_Replay_pressed():
	get_tree().change_scene("res://maps/Test.tscn")

func save_this_high_score():
	if currentScore > Global.highScore:
		Global.highScore = currentScore
		Global.save_high_score()
