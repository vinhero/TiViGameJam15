class_name FlyingIngridient
extends Sprite2D

var target_position : Vector2
@export var speed : int = 600

func set_target_position(pos: Vector2):
	target_position = pos
	target_position.y += 140

func _ready():
	scale = Vector2(0.5, 0.5)

func _process(delta):
	global_position = global_position.move_toward(target_position, speed * delta)
	
	if (global_position == target_position):
		queue_free()
