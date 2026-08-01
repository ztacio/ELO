extends Node2D

@onready var melo = $Melo

func _on_boss_trigger_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		melo.start.emit()
