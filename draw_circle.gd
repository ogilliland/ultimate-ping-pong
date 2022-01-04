tool
extends Node2D

export(Color) var color setget set_color

func set_color(new: Color) -> void:
	color = new
	update()

func _draw() -> void:
	draw_circle(Vector2(0, 0), 15, color)
