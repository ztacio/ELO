extends State

@onready var player = $"../.."
@onready var anim = $"../../AnimatedSprite2D"

@export var walking: State
@export var dodging: State
@export var take_damage: State

func update(_delta: float) -> void:
	anim.play("idle")
	if player.direction != Vector2.ZERO:
		switch_state.emit(walking)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dodge"):
		switch_state.emit(dodging)
