extends Node

@export_group("references")
@export var current_weapon : WeaponManager

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("combat_attack"):
		current_weapon.attack()