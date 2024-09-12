class_name ContainerUI
extends Node

@export_group("container")
@export var items_held : Array[ContainerItem]

func add_item(item_to_add : ContainerItem):
    for item in items_held:
        if item.held_item == item_to_add.held_item:
            add_existing_item(item_to_add)
            return

    add_new_item(item_to_add)

func add_new_item(item_to_add : ContainerItem):
    pass


func add_existing_item(item_to_add : ContainerItem):
    pass

func remove_item(item_to_remove : ContainerItem):
    pass