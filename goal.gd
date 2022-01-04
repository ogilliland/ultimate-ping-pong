extends Area2D

signal goal_scored(by, against)

export(int, 1, 2) var this_player = 1
export(int, 1, 2) var other_player = 2

func _on_body_entered(body: Node):
	if body.is_in_group("ball"):
		emit_signal("goal_scored", other_player, this_player)
