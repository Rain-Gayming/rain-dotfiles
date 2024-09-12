class_name WeaponManager
extends Node

@export_group("references")
@export var weapon_item : WeaponItem

@export_group("attack info")
@export var current_cooldown : float

func _process(delta):
	if current_cooldown > 0:
		current_cooldown -= delta

func attack():
	if current_cooldown <= 0:
		print("attacking")
		current_cooldown = weapon_item.attack_speed