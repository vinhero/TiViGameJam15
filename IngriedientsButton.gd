class_name IngridientsButton
extends TextureButton

const INGRIDIENTS_PATH : String = "res://img/sprites/ingridients/%s.png"

signal detailed_pressed(type: int)

@export var btnType = ENUMS.Ingridients.NONE

func _init(type: String):
	btnType = ENUMS.Ingridients.get(type)
	if (btnType != ENUMS.Ingridients.NONE):
		texture_normal = load(INGRIDIENTS_PATH % type.to_lower())
		scale = Vector2(0.65, 0.65)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	detailed_pressed.emit(btnType)
