extends Node

signal swiped(direction)
signal swiped_canceled(start_position)
signal side_held(side)

export(float, 1.0, 1.5) var MAX_DIAGONAL_SLOPE = 1.3

onready var timer = $Timer
var swipe_start_position = Vector2()

func _unhandled_input(event): # Callback for every time input is detected
	if not event is InputEventScreenTouch and not event is InputEventMouseButton:
		return
	if event.pressed:
		_start_detection(event.position)
		_detect_side(event.position)
	if !event.pressed:
		emit_signal('side_held', "released")
	elif not timer.is_stopped():
		_end_detection(event.position)

func _start_detection(position):
	swipe_start_position = position
	timer.start()

func _end_detection(position):
	timer.stop()
	var direction = (position - swipe_start_position).normalized()
	if abs(direction.x) + abs(direction.y) >= MAX_DIAGONAL_SLOPE:
		return
	
	if abs(direction.x) > abs(direction.y):
		emit_signal('swiped', Vector2(-sign(direction.x), 0.0))
	else:
		emit_signal('swiped', Vector2(-sign(direction.y), 0.0))

func _detect_side(position):
	if position.x <= (get_viewport().get_visible_rect().size.x / 2):
		emit_signal('side_held', "left")
	else:
		emit_signal('side_held', "right")

func _ready():
	pass


func _on_Timer_timeout():
	emit_signal('swiped_canceled', swipe_start_position)
