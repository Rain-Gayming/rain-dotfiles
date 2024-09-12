extends Node

@export var health_manager : HealthManager

func is_hit():
	health_manager.change_health(5, true)

func _on_area_entered(area:Area3D) -> void:
	is_hit()
