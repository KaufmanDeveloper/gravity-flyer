extends Node

var timer = 0

func _ready():
	pass

func _process(delta):
	if (timer == 0):
		spawn_sun()
		timer = 360
	timer -= 1


func spawn_sun():
	var sun = preload("res://enemies/Sun.tscn")
	var sunInstance = sun.instance()
	sunInstance.add_to_group(str(sunInstance.get_name(), self))
	add_child(sunInstance)