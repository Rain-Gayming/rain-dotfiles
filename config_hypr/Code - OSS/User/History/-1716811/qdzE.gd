extends Node

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("game_pause"):
        SignalManager.emit_pause_game()