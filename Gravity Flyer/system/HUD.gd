extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()

func show_game_over():
	show_message("Game Over")
	$MessageLabel.text = "Wo Dude"
	$MessageLabel.show()
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)