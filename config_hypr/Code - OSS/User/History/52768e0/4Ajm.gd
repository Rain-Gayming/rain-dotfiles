class_name ItemSlot
extends Control

@export_group("UI")
@export var icon_rect : TextureRect
@export var amount_text : Label

@export_group("inventory")
@export var container_item : ContainerItem

func _process(delta: float) -> void:
    pass


func update_slot_ui():
    if container_item != null:
        icon_rect.visible = true
        icon_rect.texture = container_item.held_item.item_icon