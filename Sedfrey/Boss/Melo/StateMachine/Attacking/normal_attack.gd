extends AttackState

func enter_state() -> void:
	set_attack_properties()
	set_attack_timer(attack_timer)
	is_active = true

func set_attack_properties() -> void:
	match melo.phase:
		1:
			attack_timer = 5.0
			shooting_speed = 0.5
			muzzle.bullet_data.speed = 100.0
			muzzle.bullet_data.damage = 1.0
			muzzle.bullet_data.kill_time = 2.0
		2:
			attack_timer = 3.0
			shooting_speed = 0.3
			muzzle.bullet_data.speed = 300.0
			muzzle.bullet_data.damage = 2.0
			muzzle.bullet_data.kill_time = 5.0

func physics_update(_delta: float) -> void:
	shoot()

func shoot() -> void:
	var direction = player.global_position - muzzle.global_position
	muzzle.bullet_data.direction = direction
	
	if Time.get_unix_time_from_system() - last_shoot_time >= shooting_speed and is_active:
		last_shoot_time = Time.get_unix_time_from_system()
		var bullet = muzzle.spawn()
		bullet_count += 1
		bullet.tree_exited.connect(update_bullet_count)

func update_bullet_count() -> void:
	print("bullet gone")
	print(bullet_count)
	bullet_count -= 1
	if bullet_count == 0:
		switch_state.emit(attacking)
