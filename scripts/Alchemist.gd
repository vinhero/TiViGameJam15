class_name Alchemist
extends Node2D

var Healthpoints : int = 3
var Kombo : int = 0

@onready var top = get_tree().get_root()

signal hasDied

func set_healtpoints(new_hp: int):
	Healthpoints = new_hp
	if (Healthpoints <= 0):
		hasDied.emit()

func receive_damage():
	set_healtpoints(Healthpoints - 1)
	$healthbar.destroy_heart()

# Called when the node enters the scene tree for the first time.
func _ready():
	$healthbar.set_hearts(Healthpoints)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
