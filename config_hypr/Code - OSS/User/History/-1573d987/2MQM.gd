extends Node

signal pause_game_signal()

func emit_pause_game():
	pause_game_signal.emit()
