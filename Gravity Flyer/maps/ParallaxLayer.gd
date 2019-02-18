extends ParallaxLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var playerNode = get_node("../../Player")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if playerNode:
		if playerNode.get("died") == false:
			background_movement_standard()

func background_movement_standard():
	if position == Vector2(0, -800):
		position = Vector2(0, -2)
	else: position = Vector2(position.x, position.y - 2)