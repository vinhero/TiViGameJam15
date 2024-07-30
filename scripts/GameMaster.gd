class_name GameMaster
extends Node2D

signal game_over

@export var game_over_scene : PackedScene

func _on_top_alchemist_has_died():
	print("Game Over.")
	game_over.emit()
	SceneSwitcher.switch_scene(game_over_scene.resource_path)
	
func _on_top_alchemist_current_hearts(hp: int):
	$Boiler.changeHearts(hp)

func _on_top_enemie_spawned(enemie: Enemie):
	$Boiler.add_mirror_enemie(enemie)

func _on_top_enemie_died(enemie: Enemie):
	$Boiler.del_mirror_enemie(enemie)

func _on_top_difficulty_increased():
	$Music.pitch_scale += 0.01
