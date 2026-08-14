extends Node2D

@onready var melo = $Melo
@onready var boss_trigger = $BossTrigger

func _on_boss_trigger_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		melo.start()
		boss_trigger.queue_free()
