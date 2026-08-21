extends State

@export var first_phase: State

func _ready() -> void:
	var root = $"../../.."
	root.start_fight.connect(start_first_phase)

func start_first_phase() -> void:
	switch_state.emit(first_phase)
