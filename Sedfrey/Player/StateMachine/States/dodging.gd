extends State

@onready var player = $"../.."

@export var idle: State

@export var dodge_distance: float
var curr_dist
@export var speed: float
var direction: Vector2

func enter_state() -> void:
	curr_dist = 0
	player.velocity = player.direction * speed

func physics_update(delta: float) -> void:
	while curr_dist <= dodge_distance:
		curr_dist += speed * delta
		player.move_and_slide()
	switch_state.emit(idle)
