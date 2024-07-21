class_name Alchemist
extends Node2D

var Healthpoints : int = 3
var Kombo : int = 0

signal hasDied

func set_healtpoints(new_hp: int):
	Healthpoints = new_hp
	print(Healthpoints)
	if (Healthpoints <= 0):
		hasDied.emit()

func receive_damage():
	set_healtpoints(Healthpoints - 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
