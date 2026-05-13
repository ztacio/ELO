extends Area2D


@onready var player = get_node("/root/Stage/player")  # adjust to your real path



func _physics_process(delta: float) -> void:
	if player:
		look_at(player.global_position)


func shoot():
	const BULLET = preload("res://scenes/tear_bullet.tscn") #makes bullet callable
	var new_bullet = BULLET.instantiate() #calls new bullet
	new_bullet.global_position = %BulletSpawn.global_position #spawns bullet from bullet spawn (end of barrel)
	new_bullet.global_rotation = %BulletSpawn.global_rotation #spawns bullet from bullet spawn (end of barrel)
	%BulletSpawn.add_child(new_bullet) # adds bullet as child of bulletspawn



func _on_timer_timeout() -> void:
	shoot()
