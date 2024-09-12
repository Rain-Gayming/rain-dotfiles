extends Node

@export var item_held : ContainerItem
@export var is_being_looked_at : bool

func _process(delta: float) -> void:
    if is_being_looked_at:
        if Input.is_action_just_pressed("player_interact"):
            SignalManager.emit_add_to_player_signal(item_held)