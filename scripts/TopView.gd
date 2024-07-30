extends Node2D

signal alchemist_has_died
signal alchemist_current_hearts
signal enemie_spawned
signal enemie_died
signal difficulty_increased

func _on_boiler_queue_full(queue: Array[int]):
	$Spawner.kill_nearest(queue)

func _on_alchemist_has_died():
	alchemist_has_died.emit()

func _on_spawner_alchemist_hit():
	$Alchemist.receive_damage()

func _on_alchemist_current_hp_changed(hp: int):
	alchemist_current_hearts.emit(hp)

func _on_spawner_enemie_spawned(enemie: Enemie):
	enemie_spawned.emit(enemie)


func _on_spawner_enemie_died(enemie: Enemie):
	enemie_died.emit(enemie)

func _on_spawner_increase_difficulty():
	difficulty_increased.emit()

func _on_spawner_throw_potion_at(enemie):
	$Alchemist.throw_potion_at(enemie)
