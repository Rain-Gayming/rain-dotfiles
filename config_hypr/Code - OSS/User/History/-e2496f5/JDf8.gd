extends Node

@export var is_paused : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.pause_game_signal.connect(pause)

func pause():
	is_paused = !is_paused

	if is_paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED