extends Node2D

signal queue_full(queue: Array[int])

#@export var arrButtonCoordinates : Array[Vector2]
#var arrButtons : Array[IngridientsButton]
var arrCurrentQueue : Array[int]
var arrMiniEnemieQueue : Array[Enemie]

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
	arrMiniEnemieQueue.append(enemie)
	update_mini_spawns()

func del_mirror_enemie(enemie: Enemie):
	arrMiniEnemieQueue.erase(enemie)
	update_mini_spawns()

func update_mini_spawns():
	for index in arrMirrorSpawns.size():
		var area = arrMirrorSpawns[index]
		if (area.isClear() == false):
			area.clear()
		if (index < arrMiniEnemieQueue.size()):
			area.set_enemie(arrMiniEnemieQueue[index])
			area.set_mini_enemie(area.spawnPosition)
	#for index in arrMiniEnemieQueue.size():
		#if (index < arrMirrorSpawns.size()):
			#var area = arrMirrorSpawns[index]
			#area.set_enemie(arrMiniEnemieQueue[index])
			#area.set_mini_enemie(area.spawnPosition)

func onIngridientsPressed(type: int):
	arrCurrentQueue.append(type)
	#$QueueBar.set_queue(arrCurrentQueue)
	if (arrCurrentQueue.size() == 3):
		var currentQueue = arrCurrentQueue
		queue_full.emit(currentQueue)
		#$QueueBar.delete_icons()
		clear_boiler()
	else:
		for index in arrCurrentQueue.size():
			$AnimatedSprite2D.material.set_shader_parameter("COLOR" + str(index+1), Color(ENUMS.Ingridients.find_key(arrCurrentQueue[index])))

func clear_boiler():
	arrCurrentQueue.clear()
	$AnimatedSprite2D.material.set_shader_parameter("COLOR1", Color("black"))
	$AnimatedSprite2D.material.set_shader_parameter("COLOR2", Color("black"))

#func _process(delta):
	#if Input.is_action_pressed("clear_queue"):
		#clear_boiler()

func _input(event):
	if event.is_action_pressed("clear_queue"):
		clear_boiler()
