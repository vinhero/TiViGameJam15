class_name GameMaster
extends Node2D

var SlimeCounter : int = 0
const Enemy_Slime = preload("res://scenes/Top/Enemies/slime.tscn")
const Potion = preload("res://scenes/Top/Alchemist/potion.tscn")
# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func spawn_Slime():
	SlimeCounter += 1
	var Slime = Enemy_Slime.instantiate()
	add_child(Slime)
	Slime.position = $EnemieSpawner.position
	if (SlimeCounter % 2 == 0):
		Slime.modulate = Color("yellow")

func _on_timer_timeout():
	spawn_Slime()
	
