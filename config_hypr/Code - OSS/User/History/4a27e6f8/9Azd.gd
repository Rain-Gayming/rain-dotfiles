class_name CombatManager
extends Node

@export_group("references")
@export var current_weapon : WeaponManager

@export_group("pausing")
@export var is_paused : bool
@export var game_stopped : bool

func _ready() -> void:
	SignalManager.pause_signal.connect(pause)
	SignalManager.stop_game.connect(stop_game)

func stop_game():
	game_stopped = !game_stopped
	is_paused = false

func pause():
	is_paused = !is_paused
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("combat_mouse_1"):
		if not is_paused:
			if not game_stopped:
				if current_weapon: 
					current_weapon.attack()
