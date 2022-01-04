extends Node2D

var speed: float
var age: float
var lifetime: float = 1.0

func _ready() -> void:
	age = 0.0

func _physics_process(delta: float) -> void:
	age += delta
	
	if age >= lifetime:
		queue_free()
	else:
		position += Vector2(speed, 0).rotated(deg2rad(rotation_degrees)) * (1.0 - age/lifetime) * delta
