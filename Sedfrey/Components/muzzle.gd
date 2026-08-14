class_name Muzzle extends Node2D

signal clear_bullets

@export var bullet_scene: PackedScene

@export var bullet_data: Resource

func spawn() -> Area2D:
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.on_spawn.emit(bullet_data, global_position)
	clear_bullets.connect(bullet.kill_bullet)
	return bullet

func clear_all_bullets() -> void:
	clear_bullets.emit()
