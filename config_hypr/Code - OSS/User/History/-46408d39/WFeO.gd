extends Node

@export var health_manager : HealthManager

func is_hit(hit_by : Area3D):
	health_manager.change_health(hit_by.get_parent().damage, true)

func _on_area_entered(area:Area3D) -> void:
	is_hit(area)
	area.get_parent().queue_free()
