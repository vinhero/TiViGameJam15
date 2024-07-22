class_name GameMaster
extends Node2D

signal game_over

func _on_top_alchemist_has_died():
	print("Game Over.")
	game_over.emit()
