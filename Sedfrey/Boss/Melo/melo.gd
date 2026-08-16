extends CharacterBody2D

signal start_fight
signal start_second_phase

@onready var health_component = $HealthComponent
var phase: int

func take_damage(damage: float) -> void:
	health_component.curr_health -= damage
	
	if health_component.curr_health <= health_component.max_health / 2:
		start_second_phase.emit()

func die() -> void:
	pass

func start() -> void:
	start_fight.emit()
