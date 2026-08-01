extends CharacterBody2D

#TODO: implement movement, damage, dodging logic into state machine

@export var speed: float = 150
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_component = $HealthComponent

func take_damage(damage: int):
	health_component.curr_health -= damage

func die() -> void:
	SceneManager.change(SceneManager.GAME_OVER)

var last_direction := "down"

func _physics_process(_delta: float) -> void:
	var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_vector != Vector2.ZERO:
		velocity = input_vector * speed
		move_and_slide()

		# Choose animation by direction
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				anim.play("move_right")
				last_direction = "right"
			else:
				anim.play("move_left")
				last_direction = "left"
		else:
			if input_vector.y < 0:
				anim.play("move_up")
				last_direction = "up"
			else:
				anim.play("move_down")
				last_direction = "down"
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		anim.play("idle")
		# hello from Leena
		# llalapooopeee
		#peeepooo
		
		 
