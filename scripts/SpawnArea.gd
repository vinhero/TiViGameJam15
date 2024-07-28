class_name SpawnArea
extends Area2D

var arrEnemies = []
var EnemieName = "slime"
var EnemieCounter : int = 0
var EnemiePath = "res://scenes/enemies/%s.tscn"
var Enemy = load(EnemiePath % EnemieName)
@onready var top = get_tree().get_root()

signal alchemist_hit
signal enemie_spawned

func setCryptonite():
	pass
	
func spawn():
	EnemieCounter += 1
	var spawnedEnemy = Enemy.instantiate()
	arrEnemies.append(spawnedEnemy)
	spawnedEnemy.position = $".".position
	var enemieClass = (spawnedEnemy.get_child(0) as Enemie)
	enemieClass.attacked_alchemist.connect(on_alchemist_hit)
	enemieClass.has_died.connect(on_enemie_died)
	enemieClass.spawned.connect(_on_enemie_rdy)
	top.add_child.call_deferred(spawnedEnemy)

func _on_enemie_rdy(enemie: Enemie):
	enemie_spawned.emit(enemie)

func _on_spawn_intervall_timeout():
	spawn()


func kill_nearest(queue: Array[int]):
	if (arrEnemies.size() > 0):
		var dieEnemies = arrEnemies.filter(func(e): return (e.get_children()[0] as Enemie).arrCryptonite == queue)
		if (dieEnemies.size() > 0):
			kill_enemies([dieEnemies[0]])

func kill_enemies(enemiesToKill: Array[Node2D]):
	for enemie in enemiesToKill:
		(enemie.get_child(0) as Enemie).kill()

func on_enemie_died(enemie: Enemie):
	var parent = enemie.get_parent()
	arrEnemies.erase(parent)
	parent.queue_free()

func on_alchemist_hit():
	alchemist_hit.emit()
