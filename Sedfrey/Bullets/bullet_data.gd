class_name BulletData extends Resource

@export var speed: float
@export var direction: Vector2
@export var damage: float
@export var kill_time: float
@export var target: TargetType

enum TargetType { ENVIRONMENT, INTERACTABLE, PLAYER, BOSS }
