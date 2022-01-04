extends KinematicBody2D

signal collision(magnitude)

const MAX_NORMAL: float = 100.0
const MAX_TANGENT: float = 1000.0
const DEFAULT_SPEED: float = 400.0

var explosion = preload("res://effects/explosion.tscn")

var vel_dir: Vector2
var speed: float
var spin: float

var default_pos: Vector2

func init() -> void:
	position = default_pos
	vel_dir = Vector2(-1, rand_range(-1, 1)).normalized()
	speed = DEFAULT_SPEED
	spin = 0.0
	get_node("Sprite").rotation_degrees = 0.0

func _ready() -> void:
	default_pos = position
	init()

func _physics_process(delta: float) -> void:
	var a = spin * 0.0001
	get_node("Sprite").rotation_degrees += spin
	vel_dir = vel_dir.rotated(a)
	
	var collision = move_and_collide(vel_dir * speed * delta)
	if collision:
		var collider_speed = 0
		var bonus_speed = 0
		if collision.collider.is_in_group("paddle"):
			collider_speed = collision.collider.get_node("../../").speed
			bonus_speed = 25.0
		
		var speed_normal = Vector2(0, collider_speed).dot(collision.normal)
		speed_normal = clamp(speed_normal, -MAX_NORMAL, MAX_NORMAL)
		var speed_tangent = Vector2(-collider_speed, 0).dot(collision.normal)
		speed_tangent = clamp(speed_tangent, -MAX_TANGENT, MAX_TANGENT)
		
		spin += speed_tangent * 0.025
		
		var speed_scale = (speed + speed_normal + bonus_speed) / speed
		speed += speed_normal + bonus_speed
		
		var n = collision.normal
		var d = collision.remainder
		var d_n = d.dot(n)
		var r = d + sign(d_n) * 2 * d_n * n
		position += r * speed_scale
		
		vel_dir = r.normalized()
		
		# add collision effect
		var magnitude = clamp((speed - 500.0)/1000.0, 0.0, 1.0)
		get_node("../Effects").explode(collision.position, collision.normal, magnitude)
		
		emit_signal("collision", clamp((speed - 500.0)/4000.0, 0.0, 0.25))
	
	# TO DO - raycast if ball is moving fast enough to skip through colliders
#	var space_state = get_world_2d().direct_space_state
#	var result = space_state.intersect_ray(position, new_position, [self], 2147483647, true, true)
#	if result:
#		print(result.normal)
#		print(result.position)
