extends Node

var timer = 0

func _ready():
	var sun = preload("res://enemies/Sun.tscn")
	var sunInstance = sun.instance()
	sunInstance.add_to_group(str(sunInstance.get_name(), self))
	add_child(sunInstance)
