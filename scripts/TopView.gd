extends Node2D

signal alchemist_has_died

func _on_boiler_queue_full(queue: Array[int]):
	$Spawner.kill_nearest(queue)

func _on_alchemist_has_died():
	alchemist_has_died.emit()

func _on_spawner_alchemist_hit():
	$Alchemist.receive_damage()
