extends ProgressBar

signal health_changed(curr_health: float)

@onready var health_component = $".."

func _ready() -> void:
	health_changed.connect(update_health_bar)

func update_health_bar(curr_health: float):
	ratio = curr_health / health_component.max_health
