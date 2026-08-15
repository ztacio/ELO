extends State

@onready var player = $"../.."
@onready var health_component = $"../../HealthComponent"

@export var idle: State
@export var i_frames: int

func _ready() -> void:
	player.take_hit.connect(take_damage)

func take_damage(damage: float) -> void:
	switch_state.emit(self)
	health_component.curr_health -= damage
	switch_state.emit(idle)
