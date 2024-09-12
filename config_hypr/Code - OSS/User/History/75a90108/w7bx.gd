class_name WeaponManager
extends Node

@export_group("references")
@export var weapon_item : WeaponItem

@export_group("attack info")
@export var current_cooldown : float

func attack():
	print("attacking")