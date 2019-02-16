extends Node2D

var maxAmount = 1 # How many of this item can be active at once
var side = "right"

func _ready():
	$Animation.connect("animation_finished", self, "destroy")
	$Animation.play(str("swing") + side)

func destroy(animation):
#	if get_parent().has_method("state_swing"):
#		get_parent().state = "default"
	queue_free() # Delete itself