extends Camera2D

func _ready():
	set_process(true)

func _process(delta):
	position = Vector2(position.x, position.y + 5)