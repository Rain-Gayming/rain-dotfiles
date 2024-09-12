extends Node

@export var health_manager : HealthManager

func is_hit():
	health_manager.change_health(5, true)