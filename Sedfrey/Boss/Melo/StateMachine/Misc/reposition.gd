extends State

@onready var melo = $"../../.."

var target_position: Vector2
var speed: float

func enter_state() -> void:
	target_position = Vector2(randi_range(-500, 500), randf_range(-1500, -1000))

func physics_update(delta: float) -> void:
	melo.global_position = melo.global_position.lerp(target_position, 1.0 - exp(-speed * delta))
	
	if melo.global_position.distance_to(target_position) < 1.0:
		melo.global_position = target_position
