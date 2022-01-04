tool
extends Sprite

export(Color) var color: Color setget set_color
var length_scale: float = 1.0
var width_scale: float = 1.0

func set_color(new: Color) -> void:
	color = new
	update()

func _physics_process(delta: float) -> void:
	var parent = get_parent()
	var ratio = (1.0 - parent.age/parent.lifetime)
	length_scale = clamp(ratio, 0, 1)
	width_scale = clamp(ratio, 0, 1)
	update()

func _draw() -> void:
	var points = PoolVector2Array()
	var colors = PoolColorArray([color])
	
	points.push_back(Vector2(-20, 0) * length_scale)
	points.push_back(Vector2(0, 5) * width_scale)
	points.push_back(Vector2(10, 0) * length_scale)
	points.push_back(Vector2(0, -5) * width_scale)
	
	draw_polygon(points, colors)
