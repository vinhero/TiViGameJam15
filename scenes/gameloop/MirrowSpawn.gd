extends Area2D

var blnSet = false
var target : Enemie
var miniEnemie : MiniSlime

const miniSlime = preload("res://scenes/enemies/mini_slime.tscn")

@onready var spawnPosition = $CollisionShape2D.position

func isSet():
	return blnSet

func set_enemie(new_target: Enemie):
	target = new_target
	#set_mini_enemie()

func get_enemie():
	return target

func set_mini_enemie(position: Vector2):
	miniEnemie = miniSlime.instantiate()
	miniEnemie.arrIngridientses = target.arrCryptonite
	miniEnemie.global_position = position
	miniEnemie.z_index = 100
	add_child(miniEnemie)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
