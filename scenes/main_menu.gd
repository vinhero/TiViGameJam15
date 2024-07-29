extends Node2D

@export var game_loop_scene : PackedScene

@onready var top_view = $TopView

# Called when the node enters the scene tree for the first time.
func _ready():
	$TopView/Spawner/SpawnIntervall.wait_time = 2.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_top_view_enemie_spawned(enemie: Enemie):
	enemie.scale = Vector2(4, 4)
	$TopView/Spawner/SpawnIntervall.wait_time = randf_range(1.0, 3.0)
	enemie.speed = randi_range(100, 450)
	enemie.position.y -= 65

func _on_delete_area_area_entered(area):
	area.get_parent().get_parent().queue_free()

func _on_btn_start_pressed():
	#print(get_children())
	get_tree().change_scene_to_packed(game_loop_scene)

func _on_btn_tutorial_pressed():
	pass # Replace with function body.
