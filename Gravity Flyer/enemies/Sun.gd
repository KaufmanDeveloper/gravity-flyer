extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const TYPE = "ENEMY"
var offset = Vector2(0, 0)
var impulseXArray = [-250, -200, -150, 150, 200, 250]
var impulseYArray = [175, 200, 250]
var impulseX = impulseXArray[randi() % impulseXArray.size()]
var impulseY = impulseYArray[randi() % impulseYArray.size()]
var impulse = Vector2(impulseX, impulseY)

func _ready():
	randomize()
	var viewportWidth = get_viewport().get_visible_rect().size.x
	var startingPositionArray = [viewportWidth / 4, viewportWidth / 2, viewportWidth / 1.5]
	var startingPosition = startingPositionArray[randi() % startingPositionArray.size()]
	
	$Animation.play("idle")
	
	apply_movement()
	
	position = Vector2(startingPosition, 0)

func apply_movement():
	apply_impulse(offset, impulse)