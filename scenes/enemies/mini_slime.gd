class_name MiniSlime
extends AnimatedSprite2D

var slimeColor : Color = Color("BLUE")
var arrIngridientses : Array[int]
@onready var arrIngr = [$Ball1, $Ball2, $Ball3]

#func _init(array: Array[int]):
	#arrIngridientses = array

# Called when the node enters the scene tree for the first time.
func _ready():
	for index in arrIngridientses.size():
		arrIngr[index].modulate = Color(ENUMS.Ingridients.find_key(arrIngridientses[index]))
	pass

func set_color(red, green, blue):
	material.set_shader_parameter("red", red)
	material.set_shader_parameter("green", green)
	material.set_shader_parameter("blue", blue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
