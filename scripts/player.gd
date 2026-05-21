extends CharacterBody2D

@export var speed: float = 150
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var health = 3 

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()

var last_direction := "down"

func _physics_process(delta: float) -> void:
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




#ragebait
#123
