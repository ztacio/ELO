extends Node

var curr_scene: int

enum { MAIN_MENU, PLAYING, PAUSED, GAME_OVER }

func _ready() -> void:
	change(MAIN_MENU)

func change(scene: int) -> void:
	if get_tree().paused == true:
		get_tree().paused = false
	match scene:
		0:
			Stage.game_off()
			get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
			curr_scene = MAIN_MENU
		1:
			Stage.game_on()
			get_tree().change_scene_to_file("res://Menus/main.tscn")
			curr_scene = PLAYING
		2:
			Stage.game_off()
			get_tree().change_scene_to_file("res://Menus/paused.tscn")
			curr_scene = PAUSED
			get_tree().paused = true
		3:
			Stage.game_off()
			get_tree().change_scene_to_file("res://Menus/game_over.tscn")
			curr_scene = GAME_OVER
