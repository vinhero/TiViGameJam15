extends Area2D

@onready var heart = preload("res://scenes/misc/heart.tscn")

@export var Healthpoints = 10

var arrHearts : Array[AnimatedSprite2D]

func set_hearts(hp: int):
	delete_hearts()
	Healthpoints = hp
	var current_size = ($CollisionShape2D.shape as RectangleShape2D).size
	var intervall = current_size.x / Healthpoints
	var next_x_position = (intervall / 2)
	for i in Healthpoints:
		var new_heart = heart.instantiate() as AnimatedSprite2D
		new_heart.position = Vector2(next_x_position, 0)
		arrHearts.append(new_heart)
		add_child(new_heart)
		next_x_position += intervall

func delete_hearts():
	for h in arrHearts:
		h.queue_free()
	arrHearts.clear()

func destroy_heart():
	var destroyed_heart : AnimatedSprite2D = arrHearts[arrHearts.size()-1]
	arrHearts.erase(destroyed_heart)
	destroyed_heart.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_hearts(Healthpoints)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
