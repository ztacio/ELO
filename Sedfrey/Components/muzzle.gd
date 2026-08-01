class_name Muzzle extends Node2D

@export var bullet_scene: PackedScene

@export var bullet_data: Resource

func spawn() -> Area2D:
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.on_spawn.emit(bullet_data, global_position)
	return bullet
