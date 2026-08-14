extends PhaseState

func enter_state() -> void:
	start_first_phase()

func start_first_phase() -> void:
	root.phase = 1
	switch_state.emit(attacking)
