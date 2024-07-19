extends Area2D

@onready var top = get_tree().get_root()
const potion = preload("res://scenes/Top/Alchemist/potion.tscn")

func throw():
	var thrown_potion = potion.instantiate()
	thrown_potion.spawnPosition = $".".global_position
	top.add_child.call_deferred(thrown_potion)
