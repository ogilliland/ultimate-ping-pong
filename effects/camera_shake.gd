extends Camera2D

const MAX_ROT: float = 10.0
const MAX_DISP: float = 100.0

var shake_magnitude: float = 0.0

func _ready() -> void:
	get_node("../Game/GoalLeft").connect("goal_scored", self, "_on_goal")
	get_node("../Game/GoalRight").connect("goal_scored", self, "_on_goal")
	get_node("../Game/Ball").connect("collision", self, "_on_hit")

func _physics_process(_delta: float) -> void:
	shake_magnitude *= 0.95
	position = Vector2(
		rand_range(-MAX_DISP, MAX_DISP),
		rand_range(-MAX_DISP, MAX_DISP)
	) * shake_magnitude
	rotation_degrees = rand_range(-MAX_ROT, MAX_ROT) * shake_magnitude

func _on_hit(magnitude: float) -> void:
	shake_magnitude = magnitude

func _on_goal(_by: int, _against: int) -> void:
	var speed = get_node("../Game/Ball").speed
	shake_magnitude = clamp(speed / 2000.0, 0.0, 0.75) + 0.25
