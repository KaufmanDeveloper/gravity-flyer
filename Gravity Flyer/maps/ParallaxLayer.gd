extends ParallaxLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if position == Vector2(0, -800):
		position = Vector2(0, -2)
	else: position = Vector2(position.x, position.y - 2)