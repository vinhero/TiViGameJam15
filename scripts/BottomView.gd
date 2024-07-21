extends Node2D

@export var arrButtonCoordinates : Array[Vector2]
var arrButtons : Array[IngridientsButton]

# Called when the node enters the scene tree for the first time.
func _ready():
	for ingridient in ENUMS.Ingridients.keys():
		if (ENUMS.Ingridients.get(ingridient) != ENUMS.Ingridients.NONE):
			var newButton = IngridientsButton.new(ingridient)
			newButton.set_position(arrButtonCoordinates[arrButtons.size()])
			arrButtons.append(newButton)
			add_child(newButton)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
