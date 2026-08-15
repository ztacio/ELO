extends AttackState

@export var num_mines: int

func enter_state() -> void:
	set_attack_timer(attack_timer)
	spawn_muzzles()

func spawn_muzzles() -> void:
	pass
