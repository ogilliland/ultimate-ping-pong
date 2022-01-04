extends Node2D

var last_height: float
var target_height: float

func _ready() -> void:
	last_height = position.y
	target_height = position.y

func _physics_process(delta: float) -> void:
	# prevent paddle from going off screen
	target_height = clamp(target_height, 60, 660)
	
	var diff = position.y - last_height
	last_height = position.y
	get_node("Transform").rotation_degrees = clamp(0.2 * diff, -15, 15)
	
	if abs(position.y - target_height) > 0.1:
		position.y = lerp(position.y, target_height, 20.0 * delta)
