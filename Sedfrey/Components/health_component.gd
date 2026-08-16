extends Node

@onready var root = get_parent()
@onready var health_bar = $ProgressBar
@export var health_bar_offset: Vector2

@export var max_health: float
var curr_health: float:
	set(value):
		curr_health = clamp(value, 0, max_health)
		
		if curr_health == 0:
			root.die()
		
		health_bar.health_changed.emit(value)

func _ready() -> void:
	curr_health = max_health

func _process(_delta: float) -> void:
	health_bar.global_position = root.global_position + health_bar_offset
