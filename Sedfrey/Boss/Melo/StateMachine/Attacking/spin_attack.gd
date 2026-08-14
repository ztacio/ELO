extends AttackState

@export var spin_speed: float

func enter_state() -> void:
	set_attack_properties()
	set_attack_timer(attack_timer)
	is_active = true

func set_attack_properties() -> void:
	match melo.phase:
		1:
			attack_timer = 3.0
			shooting_speed = 0.5
			spin_speed = 20.0
			muzzle.bullet_data.speed = 100.0
			muzzle.bullet_data.damage = 1.0
			muzzle.bullet_data.kill_time = 2.0
		2:
			attack_timer = 7.0
			shooting_speed = 0.3
			spin_speed = 40.0
			muzzle.bullet_data.speed = 300.0
			muzzle.bullet_data.damage = 2.0
			muzzle.bullet_data.kill_time = 5.0

func physics_update(delta: float) -> void:
	shoot(delta)

func shoot(delta: float) -> void:
	muzzle.rotation_degrees += spin_speed * delta
	muzzle.bullet_data.direction = Vector2.from_angle(muzzle.rotation)
	
	if Time.get_unix_time_from_system() - last_shoot_time > shooting_speed and is_active:
		last_shoot_time = Time.get_unix_time_from_system()
		var bullet = muzzle.spawn()
		bullet_count += 1
		bullet.tree_exited.connect(update_bullet_count)

func update_bullet_count() -> void:
	bullet_count -= 1
	if bullet_count == 0:
		switch_state.emit(attacking)

func exit_state() -> void:
	muzzle.rotation_degrees = 0
