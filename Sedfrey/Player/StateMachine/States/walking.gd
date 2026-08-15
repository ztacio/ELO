extends State

@onready var player = $"../.."
@onready var anim: AnimatedSprite2D = $"../../AnimatedSprite2D"

@export var idle: State

@export var speed: float
var curr_dir: Vector2

func physics_update(_delta: float) -> void:
	player.velocity = player.direction * speed
	
	player.move_and_slide()
	
	if player.direction == Vector2.ZERO:
		switch_state.emit(idle)
	if player.direction == Vector2.RIGHT:
		anim.play("move_right")
	elif player.direction == Vector2.LEFT:
		anim.play("move_left")
	elif player.direction == Vector2.UP:
		anim.play("move_up")
	elif player.direction == Vector2.DOWN:
		anim.play("move_down")
