extends Node2D

func _on_boiler_queue_full(queue: Array[int]):
	$Spawner.kill_nearest(queue)
