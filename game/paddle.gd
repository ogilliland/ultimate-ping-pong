extends Node2D

var last_height: float
var target_height: float
var speed: float

var default_pos: Vector2

func init() -> void:
	position = default_pos

func _ready() -> void:
	last_height = position.y
	target_height = position.y
	default_pos = position

func _physics_process(delta: float) -> void:
	var diff = position.y - last_height
	speed = diff / delta
	get_node("Transform").rotation_degrees = clamp(0.2 * diff, -15, 15)
	last_height = position.y
	
	# prevent paddle from going off screen
	target_height = clamp(target_height, 80, 640)
	
	# only update pos when paddle is actually moving
	if abs(position.y - target_height) > 0.1:
		position.y = lerp(position.y, target_height, 20.0 * delta)
