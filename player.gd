extends "res://paddle.gd"

func _input(event):
	if event is InputEventMouseMotion:
		target_height = event.position.y
