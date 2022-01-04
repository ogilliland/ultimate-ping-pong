extends "res://paddle.gd"

func _physics_process(delta: float) -> void:
	target_height = get_node("../Ball").position.y
