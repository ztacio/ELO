extends PhaseState

func _ready() -> void:
	root.start_second_phase.connect(start_second_phase)

func start_second_phase() -> void:
	root.phase = 2
