extends "res://game/paddle.gd"

func _physics_process(_delta: float) -> void:
	target_height = get_node("../Ball").position.y
