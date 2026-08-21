extends Node2D

func _on_play_pressed() -> void:
	SceneManager.change(SceneManager.PLAYING)

func _on_main_menu_pressed() -> void:
	SceneManager.change(SceneManager.MAIN_MENU)
