extends KinematicBody2D

const MAX_NORMAL = 100.0
const MAX_TANGENT = 1000.0
const INIT_SPEED = 200.0

var vel_dir: Vector2 = Vector2(-1, 0)
var vel_speed: float = INIT_SPEED
var spin: float = 0.0

func _physics_process(delta: float) -> void:
	var a = spin * 0.0001
	get_node("Sprite").rotation_degrees += spin
	vel_dir = Vector2(
		vel_dir.x * cos(a) - vel_dir.y * sin(a),
		vel_dir.x * sin(a) + vel_dir.y * cos(a)
	)
	
	var collision = move_and_collide(vel_dir * vel_speed * delta)
	if collision:
		var speed = 0
		if collision.collider.is_in_group("paddle"):
			speed = collision.collider.get_node("../../").speed
		
		var speed_normal = Vector2(0, speed).dot(collision.normal)
		speed_normal = clamp(speed_normal, -MAX_NORMAL, MAX_NORMAL)
		var speed_tangent = Vector2(-speed, 0).dot(collision.normal)
		speed_tangent = clamp(speed_tangent, -MAX_TANGENT, MAX_TANGENT)
		
		spin += speed_tangent * 0.025
		
		var speed_scale = (vel_speed + speed_normal) / vel_speed
		vel_speed += speed_normal
		
		var n = collision.normal
		var d = collision.remainder
		var d_n = d.dot(n)
		var r = d + sign(d_n) * 2 * d_n * n
		position += r * speed_scale
		
		vel_dir = r.normalized()
	
	# TO DO - raycast if ball is moving fast enough to skip through colliders
#	var space_state = get_world_2d().direct_space_state
#	var result = space_state.intersect_ray(position, new_position, [self], 2147483647, true, true)
#	if result:
#		print(result.normal)
#		print(result.position)
