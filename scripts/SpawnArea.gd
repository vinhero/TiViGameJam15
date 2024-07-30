class_name SpawnArea
extends Area2D

var arrEnemies = []
var EnemieName = "slime"
var EnemieCounter : int = 0
var EnemiePath = "res://scenes/enemies/%s.tscn"
var Enemy = load(EnemiePath % EnemieName)

@export var fall_back : int = 4
@export var max_slimes : int = 2
@export var difficulty_stages : int = 2
@export var default_timer : float = 2.5
var current_stage : int = difficulty_stages
var current_timer : float = 2.5
var enemies_killed : int = 0

var menu = false
#@onready var top = get_tree().get_root()
@onready var top = get_parent().get_parent()

signal alchemist_hit
signal enemie_spawned(enemie: Enemie)
signal enemie_died(enemie: Enemie)
signal increase_difficulty
signal throw_potion_at(eneme: Enemie)

func set_enemies_killed(nKilled: int):
	enemies_killed = nKilled
	if enemies_killed % 5 == 0:
		increase_difficulty.emit()
		current_stage -= 1
		current_timer -= 0.5
		$SpawnIntervall.wait_time = current_timer
		if (current_stage < 1):
			max_slimes += 1
			reset_stages()
			reset_spawntimer()

func reset_stages():
	current_stage = difficulty_stages

func reset_spawntimer():
	current_timer = default_timer
	$SpawnIntervall.wait_time = default_timer


func setCryptonite():
	pass
	
func spawn():
	if menu == true:
		spawn_enemie()
	elif arrEnemies.size() < max_slimes:
		$SpawnIntervall.wait_time /= 2
		spawn_enemie()
	else:
		$SpawnIntervall.wait_time = current_timer

func spawn_enemie():
	EnemieCounter += 1
	var spawnedEnemy = Enemy.instantiate()
	arrEnemies.append(spawnedEnemy)
	spawnedEnemy.global_position = $".".global_position
	spawnedEnemy.z_index = 100
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
		
		if menu == false:
			set_enemies_killed(enemies_killed + 1)
		
		var enemie_to_kill = (enemie.get_child(0) as Enemie)
		#enemie_to_kill.kill()
		throw_potion_at.emit(enemie_to_kill)
		enemie_died.emit(enemie_to_kill)
		#(enemie.get_child(0) as Enemie).kill()

func on_enemie_died(enemie: Enemie, emit: bool):
	if emit:
		enemie_died.emit(enemie)
	var parent = enemie.get_parent()
	arrEnemies.erase(parent)
	parent.queue_free()
	if arrEnemies.size() < max_slimes:
		$SpawnIntervall.wait_time /= 2

func on_alchemist_hit():
	alchemist_hit.emit()
	if max_slimes > fall_back:
		max_slimes -= 1
