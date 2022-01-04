extends KinematicBody2D

var vel_dir: Vector2 = Vector2(-1, 0)
var vel_speed: float = 200.0
var spin: float = 0.0

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(vel_dir * vel_speed * delta)
	if collision:
		var n = collision.normal
		var d = collision.remainder
		var r = d - 2 * d.dot(n) * n
		position += r
		vel_dir = r.normalized()
	
	# TO DO - raycast if ball is moving fast enough to skip through colliders
#	var space_state = get_world_2d().direct_space_state
#	var result = space_state.intersect_ray(position, new_position, [self], 2147483647, true, true)
#	if result:
#		print(result.normal)
#		print(result.position)
