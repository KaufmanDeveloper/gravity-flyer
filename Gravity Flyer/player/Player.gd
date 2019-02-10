extends KinematicBody2D

const SPEED = 120

var moveDirection = Vector2(0, 0)

func _physics_process(delta):
	controls_loop()
	movement_loop()

func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	
	moveDirection.x = -int(LEFT) + int(RIGHT)

func movement_loop():
	var motion = moveDirection.normalized() * SPEED
	move_and_slide(motion, Vector2(0, 0))