class_name HealthManager
extends Node

@export_group("health info")
@export var max_health : float
@export var current_health : float

func _ready() -> void:
	current_health = max_health


func change_health(amount : float, is_damage : bool):
	if is_damage:
		print("getting damaged")
		current_health -= amount
	else:
		current_health += amount
	
	current_health.clampf(current_health, 0, max_health)