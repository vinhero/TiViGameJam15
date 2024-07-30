class_name Alchemist
extends Node2D

var Healthpoints : int = 8
var Kombo : int = 0

@onready var top = get_tree().get_root()
const potion = preload("res://scenes/misc/Potion.tscn")
#const potion = preload("res://scripts/potion.gd")

signal has_died
signal current_hp_changed

func set_healtpoints(new_hp: int):
	Healthpoints = new_hp
	current_hp_changed.emit(new_hp)
	if (Healthpoints <= 0):
		has_died.emit()

func receive_damage():
	set_healtpoints(Healthpoints - 1)
	#$healthbar.destroy_heart()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_healtpoints(Healthpoints)
	#$healthbar.set_hearts(Healthpoints)
	pass

func _process(delta):
	# just testpurpose
	#if (Input.is_action_pressed("Kill Enemie")):
		#throw_potion_at(Enemie.new())
	pass

func throw_potion_at(target: Enemie):
	var thrown_potion = potion.instantiate() 
	thrown_potion.set_target(target)
	thrown_potion.position = $PotionThrower/CollisionShape2D.global_position
	get_parent().add_child(thrown_potion)
