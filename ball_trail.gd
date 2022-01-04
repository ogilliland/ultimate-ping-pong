extends Line2D

const MAX_POINTS: int = 64

var num_points: int

func get_ball_pos() -> Vector2:
	return get_node("../../Ball").global_position

func get_speed() -> float:
	return get_node("../../Ball").vel_speed

func init() -> void:
	clear_points()
#	for i in range(MIN_POINTS):
#		add_point(get_ball_pos())

func _ready() -> void:
	init()

func _physics_process(delta: float) -> void:
	num_points = MAX_POINTS * clamp(get_speed() * 0.001, 0, 1)
	
	add_point(get_ball_pos(), 0)
	while(get_point_count() > num_points):
		remove_point(num_points)
