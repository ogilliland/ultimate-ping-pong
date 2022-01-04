extends Area2D

signal goal_scored(by, against)

export(int, 1, 2) var this_player: int = 1
export(int, 1, 2) var other_player: int = 2
export(Vector2) var normal: Vector2 = Vector2(1, 0)

func _on_body_entered(body: Node):
	if body.is_in_group("ball"):
		get_node("../Effects").explode(body.position - 20 * normal, normal, 2.0)
		emit_signal("goal_scored", other_player, this_player)
