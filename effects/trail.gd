extends Line2D

const MAX_POINTS: int = 64

export(NodePath) var target: NodePath

var num_points: int

func get_target_pos() -> Vector2:
	return get_node(target).global_position

func get_speed() -> float:
	if get_node(target).get("speed") != null:
		return get_node(target).speed
	return 0.0

func init() -> void:
	clear_points()
#	for i in range(MIN_POINTS):
#		add_point(get_ball_pos())

func _ready() -> void:
	init()

func _physics_process(delta: float) -> void:
	num_points = MAX_POINTS * clamp(get_speed() * 0.001, 0, 1)
	
	add_point(get_target_pos(), 0)
	while(get_point_count() > num_points):
		remove_point(num_points)
