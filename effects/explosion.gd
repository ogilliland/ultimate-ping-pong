extends Node2D

var MIN_SPEED = 200.0
var MAX_SPEED = 400.0
var MIN_LIFETIME = 0.5
var MAX_LIFETIME = 1.0

var fragment = preload("res://effects/explosion_fragment.tscn")

var splat: Node
var fragments: Node

var magnitude: float # typical range 0 - 1

var frame: int = 0

func _ready() -> void:
#	begin()
	splat = get_node("Splat")
	fragments = get_node("Fragments")

func begin() -> void:
	frame = 0
	update_splat()
	
	for child in fragments.get_children():
		child.queue_free()
	
	var num_fragments = 3 + 7 * magnitude
	for i in range(num_fragments):
		var instance = fragment.instance()
		instance.speed = rand_range(MIN_SPEED * (0.5 + 0.5 * magnitude), MAX_SPEED * (0.5 + 0.5 * magnitude))
		instance.lifetime = rand_range(MIN_LIFETIME * (0.5 + 0.5 * magnitude), MAX_LIFETIME * (0.5 + 0.5 * magnitude))
		instance.rotation_degrees = rand_range(-90, 90)
		fragments.add_child(instance)

func _physics_process(delta: float) -> void:
	update_splat()
	frame += 1

func update_splat() -> void:
	if frame < 8:
		splat.scale = Vector2(1, clamp(1 + magnitude, 1, 2)) * (1 + magnitude) * frame / 4.0
	elif frame < 24:
		splat.scale = Vector2(1, clamp(1 + magnitude, 1, 2)) * (1 + magnitude) * (24 - frame) / 8.0
	else:
		splat.scale = Vector2(0, 0)
