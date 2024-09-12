class_name ItemObject
extends  Resource

@export_group("basic information")
@export var item_name : String
@export_multiline var item_description : String
@export var item_icon : Texture2D

@export_group("stacking information")
@export var can_stack : bool
