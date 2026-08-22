extends Node

const SCENES = {
	"melo": preload("res://scenes/stage.tscn")
}

var curr_scene: Node2D

func _ready() -> void:
	change("melo")

func change(scene_key: String) -> void:
	if !SCENES.has(scene_key):
		push_error("Scene key not found: " + scene_key)
		return
		
	if is_instance_valid(curr_scene):
		curr_scene.queue_free()
	
	curr_scene = SCENES[scene_key].instantiate()
	
	add_child(curr_scene)
