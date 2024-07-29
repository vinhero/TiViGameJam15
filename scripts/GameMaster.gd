class_name GameMaster
extends Node2D

signal game_over

func _on_top_alchemist_has_died():
	print("Game Over.")
	game_over.emit()

func _on_top_alchemist_current_hearts(hp: int):
	$Boiler.changeHearts(hp)

func _on_top_enemie_spawned(enemie: Enemie):
	$Boiler.add_mirror_enemie(enemie)


func _on_top_enemie_died(enemie: Enemie):
	$Boiler.del_mirror_enemie(enemie)
