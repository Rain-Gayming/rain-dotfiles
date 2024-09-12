extends Node

@export var ground_item : Node3D
@export var is_being_looked_at : bool

func _process(delta: float) -> void:
    if is_being_looked_at:
        if Input.is_action_just_pressed("player_interact"):
            ground_item.add_item()