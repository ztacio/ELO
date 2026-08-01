class_name AttackState extends State

@onready var muzzle = $"../../../Muzzle"
@onready var root = $"../../.."
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var attacking = $"."

@export var fire_rate: float
@export var attack_timer: float

@export var normal_attack: Node
@export var spin_attack: Node
@export var spawn_minions: Node

func enter_state() -> void:
	switch_state.emit(normal_attack)
