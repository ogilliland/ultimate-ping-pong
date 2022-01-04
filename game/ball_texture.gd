tool
extends Node2D

export(Color) var color setget set_color
export(Color) var highlight setget set_highlight

func set_color(new: Color) -> void:
	color = new
	update()

func set_highlight(new: Color) -> void:
	highlight = new
	update()

func _draw() -> void:
	draw_circle(Vector2(0, 0), 15, color)
	draw_circle(Vector2(0, -10), 2.5, highlight)
