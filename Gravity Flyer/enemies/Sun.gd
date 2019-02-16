extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var offset = Vector2(0, 0)
var impulse = Vector2(200, 200)
var startingPosition = Vector2(100, 0)

func _ready():
	$Animation.play("idle")
	apply_movement()
	position = startingPosition

func apply_movement():
	apply_impulse(offset, impulse)