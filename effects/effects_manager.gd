extends Node2D

var explosion = preload("res://effects/explosion.tscn")

func explode(pos: Vector2, normal: Vector2, magnitude: float) -> void:
	var effect = explosion.instance()
	effect.position = pos
	effect.rotation_degrees = rad2deg(atan2(normal.y, normal.x))
	effect.magnitude = magnitude
	add_child(effect)
	effect.begin()
