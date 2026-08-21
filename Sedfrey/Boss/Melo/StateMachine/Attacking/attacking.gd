class_name AttackState extends State

@export var attacking: State
@onready var normal_attack = $NormalAttack
@onready var spin_attack = $SpinAttack
@onready var mines_attack = $MinesAttack
@onready var spawn_minions = $SpawnMinions
@export var phase_state: State
@export var muzzle: Node2D
@export var melo: CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Player")

var attack_timer: float = 1.0
var shooting_speed: float
var last_shoot_time: float
var is_active: bool
var bullet_count: int

func enter_state() -> void:
	choose_attack()

func choose_attack() -> void:
	print("choosing attack")
	var rand_num = randi_range(0,7)
	if rand_num <= 3:
		switch_state.emit(normal_attack)
	elif rand_num <= 7:
		switch_state.emit(spin_attack)
	else:
		pass
	if melo.phase == 1:
		melo.take_damage(1.0)
	if melo.phase == 2:
		melo.take_damage(0.1)

func set_attack_timer(time: float) -> void:
	if Stage.is_active:
		await get_tree().create_timer(time).timeout
		is_active = false
