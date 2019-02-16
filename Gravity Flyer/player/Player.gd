extends KinematicBody2D

const initialSpeed = 120
var moveDirection = Vector2(0, 0)
var velocity = Vector2(0, 0)
var gravity = .90
var previous = "none"


func _physics_process(delta):
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")

	controls_loop(left, right)
	movement_loop(left, right)

func controls_loop(left, right):
	moveDirection.x = -int(left) + int(right)

func movement_loop(left, right):
	if left:
		if previous == "left":
			if velocity.x < 0:
				velocity.x = velocity.x / gravity
			else:
				velocity.x -= initialSpeed
		
		if !velocity.x < -initialSpeed: # Subtracting from other side
			velocity.x -= initialSpeed
		
		previous = "left"
	
	if right:
		if previous == "right":
			if velocity.x > 0:
				velocity.x = velocity.x / gravity
			else:
				velocity.x += initialSpeed
		if !velocity.x > initialSpeed: # Adding from other side
			velocity.x += initialSpeed
		
		previous = "right"
	
	if !left and !right:
		velocity.x *= gravity
		previous = "none"
	
	print(velocity.x)
	
	if !move_and_slide(velocity, Vector2(0, 0)):
		velocity = Vector2(0, 0) # Reinitialize if has collided