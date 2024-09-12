extends Node

signal pause_signal()
signal stop_game()
signal add_item(item, container)

signal open_container_signal(container)

func emit_pause_signal():
	pause_signal.emit()

func emit_stop_game_signal():
	stop_game.emit()

func emit_add_item(item : ContainerItem, container : ItemContainer):
	add_item.emit(item, container)

func emit_open_container_signal(container : ItemContainer):
	open_container_signal.emit(container)
	