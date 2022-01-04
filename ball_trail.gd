extends Line2D

var num_points: int = 64

func get_ball_pos() -> Vector2:
	return get_node("../../Ball").global_position

func init() -> void:
	clear_points()
	for i in range(num_points):
		add_point(get_ball_pos())

func _ready() -> void:
	init()

func _physics_process(delta: float) -> void:
	add_point(get_ball_pos(), 0)
	remove_point(num_points)
