extends KinematicBody2D

const TYPE = "PLAYER"
const initialSpeed = 120
var moveDirection = Vector2(0, 0)
var velocity = Vector2(0, 0)
var gravity = .95
var previous = "none"
var previousAnimation = "right"
var playingAnimation = "idleright"
var died = false
var swingTimer = 30
var deathSoundPlayed = false

func _ready():
	$Sprite.visible = true
	died = false
	$Animation.play(playingAnimation)
	$BlinkAnimation.play("blink")

func _physics_process(delta):
	if !died:
		var left = Input.is_action_pressed("ui_left")
		var right = Input.is_action_pressed("ui_right")

		controls_loop(left, right)
		movement_loop(left, right)
		collision_loop()
	
		if Input.is_action_just_pressed("swipe") and swingTimer >= 30:
		# use_item(preload("res://items/Huff.tscn"))
			use_item(preload("res://player/Sword.tscn"), "right")
			use_item(preload("res://player/Sword.tscn"), "left")
			swingTimer = 0
			$SwingSound.playing = true
		
		if swingTimer < 30:
			swingTimer += 1
	


func use_item(item, side):
	var newItem = item.instance() # Argument is a direct path to that item scene
	newItem.add_to_group(str(newItem.get_name(), self))
	# newItem.add_to_group(str(item, self))
	newItem.side = side
	add_child(newItem)
	if get_tree().get_nodes_in_group(str(newItem.get_name(), self)).size() > newItem.maxAmount:
	# if get_tree().get_nodes_in_group(str(item, self)).size() > newItem.maxamount:
		newItem.queue_free()

func controls_loop(left, right):
	moveDirection.x = -int(left) + int(right)
	if left and !right and previousAnimation == "right":
		previousAnimation = "left"
		$Animation.play("idleleft")
	elif right and !left and previousAnimation == "left":
		previousAnimation = "right"
		$Animation.play("idleright")

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
	
	if !move_and_slide(velocity, Vector2(0, 0)):
		velocity = Vector2(0, 0) # Reinitialize if has collided

func collision_loop():
	if get_slide_collision(0):
		var collider = get_slide_collision(0).collider
		if collider.get("TYPE") == "ENEMY":
			player_death()
	elif get_slide_collision(1):
		var collider = get_slide_collision(0).collider
		if collider.get("TYPE") == "ENEMY":
			player_death()

func player_death():
	died = true
	if !deathSoundPlayed:
		$DeathSound.playing = true
		deathSoundPlayed = true
	$Animation.stop()
	$BlinkAnimation.stop()
	$DeathAnimation.play("death")
	set_collision_mask_bit(3, 3)