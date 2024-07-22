extends Area2D

var arr_current_queue : Array[int]
var arr_current_icons : Array[TextureRect]

func set_queue(queue: Array[int]):
	arr_current_queue = queue
	draw_icons()

func draw_icons():
	delete_icons()
	var current_size = ($CollisionShape2D.shape as RectangleShape2D).size
	var intervall = current_size.x / arr_current_queue.size()
	var next_x_position = (intervall / 2)
	for i in arr_current_queue.size():
		var nIngridient : int = arr_current_queue[i]
		var strIngrdient : String = ENUMS.Ingridients.keys()[nIngridient]
		var ingridients_rect : TextureRect = TextureRect.new()
		ingridients_rect.texture = load("res://img/sprites/ingridients/%s.png" % strIngrdient.to_lower())
		ingridients_rect.scale = Vector2(0.45, 0.45)
		ingridients_rect.position = Vector2(next_x_position, 0)
		add_child(ingridients_rect)
		arr_current_icons.append(ingridients_rect)
		next_x_position += intervall

func delete_icons():
	for icon in arr_current_icons:
		icon.queue_free()
	arr_current_icons.clear()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
