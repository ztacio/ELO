extends CharacterBody2D

signal take_hit(damage: float)

@export var speed: float = 150
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var health = 3
var direction := Vector2.ZERO
var last_direction := "down"

func take_damage():
	health -= 1
	print(health)
	if health == 0:
		queue_free()

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)
