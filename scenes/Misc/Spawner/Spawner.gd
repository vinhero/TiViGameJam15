class_name Spawner
extends Area2D

var EnemieName = "slime"
var EnemieCounter : int = 0
var EnemiePath = "res://scenes/Top/Enemies/%s.tscn"
var Enemy = load(EnemiePath % EnemieName)

func setCryptonite():
	pass
	
func spawn():
	EnemieCounter += 1
	var spawnedEnemy = Enemy.instantiate()
	add_child(spawnedEnemy)
	spawnedEnemy.position = $".".position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_intervall_timeout():
	spawn()
	
