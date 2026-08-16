extends Area2D

signal on_spawn(bullet_data: Resource, _global_position: Vector2)

@onready var screen_notifier = $VisibleOnScreenNotifier2D
@onready var kill_timer = $KillTimer

var speed: float
var direction: Vector2
var damage: float
var kill_time: float
var knock_back: float

func _ready() -> void:
	on_spawn.connect(set_properties)
	screen_notifier.screen_exited.connect(kill_bullet)

func _physics_process(delta: float) -> void:
	translate(speed * direction.normalized() * delta)

func set_properties(bullet_data: Resource, _global_position: Vector2) -> void:
	global_position = _global_position
	
	speed = bullet_data.speed
	direction = bullet_data.direction
	rotation = direction.angle()
	
	set_collision_mask_value(bullet_data.target + 1, true)
	
	damage = bullet_data.damage
	
	kill_timer.wait_time = bullet_data.kill_time
	kill_timer.start()
	
	knock_back = bullet_data.knockback

func _on_kill_timer_timeout() -> void:
	kill_bullet()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	if body.has_meta("take_knockback"):
		body.take_knockback(direction, knock_back)
	queue_free()

func kill_bullet() -> void:
	queue_free()
