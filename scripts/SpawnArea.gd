class_name SpawnArea
extends Area2D

var arrEnemies = []
var EnemieName = "slime"
var EnemieCounter : int = 0
var EnemiePath = "res://scenes/enemies/%s.tscn"
var Enemy = load(EnemiePath % EnemieName)
@onready var top = get_tree().get_root()

func setCryptonite():
	pass
	
func spawn():
	EnemieCounter += 1
	var spawnedEnemy = Enemy.instantiate()
	arrEnemies.append(spawnedEnemy)
	top.add_child.call_deferred(spawnedEnemy)
	spawnedEnemy.position = $".".position

func _on_spawn_intervall_timeout():
	spawn()
