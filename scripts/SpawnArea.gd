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

func kill_nearest(queue: Array[int]):
	if (arrEnemies.size() > 0):
		var dieEnemies = arrEnemies.filter(func(e): return (e.get_children()[0] as Slime).arrCryptonite == queue)
		if (dieEnemies.size() > 0):
			kill_enemies([dieEnemies[0]])

func kill_enemies(enemiesToKill: Array[Node2D]):
	for enemie in enemiesToKill:
		arrEnemies.erase(enemie)
		(enemie.get_child(0) as Slime).kill()
