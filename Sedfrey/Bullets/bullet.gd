extends Area2D

signal on_spawn(speed: float, direction: Vector2, kill_time: float)

@onready var kill_timer = $KillTimer

var speed: float
var direction: Vector2
var damage: float
var kill_time: float

func _ready() -> void:
	on_spawn.connect(set_properties)

func _physics_process(delta: float) -> void:
	translate(speed * direction.normalized() * delta)

func set_properties(bullet_data: Resource, _global_position: Vector2) -> void:
	speed = bullet_data.speed
	
	global_position = _global_position
	direction = bullet_data.direction
	rotation = direction.angle()
	
	set_collision_mask_value(bullet_data.target + 1, true)
	
	damage = bullet_data.damage
	
	kill_timer.wait_time = bullet_data.kill_time
	kill_timer.start()

func _on_kill_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	
	queue_free()
