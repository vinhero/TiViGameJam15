extends Node2D

#@export var game_loop_scene : PackedScene

@onready var top_view = $TopView

# Called when the node enters the scene tree for the first time.
func _ready():
	$TopView/Spawner.menu = true
	$TopView/Spawner/SpawnIntervall.wait_time = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_top_view_enemie_spawned(enemie: Enemie):
	enemie.scale = Vector2(4, 4)
	$TopView/Spawner/SpawnIntervall.wait_time = randf_range(1.0, 3.0)
	enemie.speed = randi_range(100, 450)
	#enemie.ready.connect(set_enemie_speed)
	enemie.position.y -= 65

func set_enemie_speed(enemie: Enemie):
	enemie.speed = randi_range(100, 450)

func _on_delete_area_area_entered(area):
	area.get_parent().get_parent().queue_free()

func _on_btn_start_pressed():
	#print(get_children())
	SceneSwitcher.switch_scene("res://scenes/gameloop/GameLoop.tscn")
	#get_tree().change_scene_to_packed(game_loop_scene)
	pass

func _on_btn_tutorial_pressed():
	pass # Replace with function body.
