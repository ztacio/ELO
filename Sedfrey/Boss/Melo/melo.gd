extends CharacterBody2D

signal start

@onready var health_component = $HealthComponent

func take_damage(damage: float) -> void:
	health_component.curr_health -= damage

func die() -> void:
	pass
