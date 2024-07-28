extends Node2D

signal queue_full(queue: Array[int])

#@export var arrButtonCoordinates : Array[Vector2]
#var arrButtons : Array[IngridientsButton]
var arrCurrentQueue : Array[int]

@onready var arrMirrorSpawns = [$Mirror/Area2D, $Mirror/Area2D2, $Mirror/Area2D3, $Mirror/Area2D4, $Mirror/Area2D5, $Mirror/Area2D6, $Mirror/Area2D7]
@onready var arrHearts = [$Flowers/FlowersHeart, $Flowers/FlowersHeart2, $Flowers/FlowersHeart3, $Flowers/FlowersHeart4, $Flowers2/FlowersHeart4, $Flowers2/FlowersHeart3, $Flowers2/FlowersHeart2, $Flowers2/FlowersHeart]
# Called when the node enters the scene tree for the first time.
func _ready():
	$Buttons/Yellow.detailed_pressed.connect(onIngridientsPressed)
	$Buttons/Blue.detailed_pressed.connect(onIngridientsPressed)
	$Buttons/Red.detailed_pressed.connect(onIngridientsPressed)
	$Buttons/Green.detailed_pressed.connect(onIngridientsPressed)
	#for ingridient in ENUMS.Ingridients.keys():
		#if (ENUMS.Ingridients.get(ingridient) != ENUMS.Ingridients.NONE):
			#var newButton = IngridientsButton.new(ingridient)
			#newButton.set_position(arrButtonCoordinates[arrButtons.size()])
			#newButton.detailed_pressed.connect(onIngridientsPressed)
			#arrButtons.append(newButton)
			#add_child(newButton)
	pass

func changeHearts(hp: int):
	for index in arrHearts.size():
		if (index >= hp):
			(arrHearts[index] as Sprite2D).hide()

func add_mirror_enemie(enemie: Enemie):
	var was_set : bool = false
	for area in arrMirrorSpawns:
		if (was_set == false && area.get_enemie() == null):
			area.set_enemie(enemie)
			area.set_mini_enemie(area.spawnPosition)
			was_set = true

func onIngridientsPressed(type: int):
	arrCurrentQueue.append(type)
	#$QueueBar.set_queue(arrCurrentQueue)
	if (arrCurrentQueue.size() == 3):
		var currentQueue = arrCurrentQueue
		queue_full.emit(currentQueue)
		arrCurrentQueue.clear()
		#$QueueBar.delete_icons()
