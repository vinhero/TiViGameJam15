extends Node2D

signal queue_full(queue: Array[int])

@export var arrButtonCoordinates : Array[Vector2]
var arrButtons : Array[IngridientsButton]
var arrCurrentQueue : Array[int]

# Called when the node enters the scene tree for the first time.
func _ready():
	for ingridient in ENUMS.Ingridients.keys():
		if (ENUMS.Ingridients.get(ingridient) != ENUMS.Ingridients.NONE):
			var newButton = IngridientsButton.new(ingridient)
			newButton.set_position(arrButtonCoordinates[arrButtons.size()])
			newButton.detailed_pressed.connect(onIngridientsPressed)
			arrButtons.append(newButton)
			add_child(newButton)

func onIngridientsPressed(type: int):
	arrCurrentQueue.append(type)
	$QueueBar.set_queue(arrCurrentQueue)
	if (arrCurrentQueue.size() == 3):
		var currentQueue = arrCurrentQueue
		queue_full.emit(currentQueue)
		arrCurrentQueue.clear()
		$QueueBar.delete_icons()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
