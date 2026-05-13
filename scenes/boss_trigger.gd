extends Area2D

@export var boss_path: NodePath
@onready var boss = get_node(boss_path)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") and boss and not boss.active:
		boss.start_boss()
		# Optional: prevent retriggering
		monitoring = false
		set_deferred("monitorable", false)
		# Or just queue_free() if you never need it again
		# queue_free()
