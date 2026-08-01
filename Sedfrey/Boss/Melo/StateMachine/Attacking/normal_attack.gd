extends AttackState

#TODO: Create shooting logic

func enter_state() -> void:
	pass

func physics_update(_delta: float) -> void:
	var timer = get_tree().create_timer(attack_timer)
	
	while timer.time_left > 0:
		muzzle.bullet_data.direction = muzzle.global_position - player.global_position
		muzzle.spawn()
		
		await get_tree().create_timer(fire_rate).timeout
	
	switch_state.emit(attacking)
