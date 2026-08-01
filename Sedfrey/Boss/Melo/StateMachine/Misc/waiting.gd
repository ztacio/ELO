extends State

@export var first_phase: Node

func update(_delta: float) -> void:
	await $"../../..".start
	switch_state.emit(first_phase)
