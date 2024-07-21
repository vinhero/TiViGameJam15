class_name Enemie
extends AnimatedSprite2D

const DIE_ANIMATION : String = "die"
const WALK_ANIMATION : String = "walk"

@export var direction = -1
@export var MaxCryptonites = 3
@export var speed = 60

var arrCryptonite: Array[int]

func setCryptonite():
	for i in range(0, MaxCryptonites):
		var nMax = ENUMS.Ingridients.size() - 2
		var nRandom = randi_range(0, nMax)
		arrCryptonite.append(nRandom)
	
	var lblCryptonite = Label.new()
	lblCryptonite.text = str(arrCryptonite)
	lblCryptonite.position.y = position.y - 10.0
	lblCryptonite.position.x = position.x - 30.0
	add_child(lblCryptonite)

func kill():
	speed = 0
	animation = "die"

# Called when the node enters the scene tree for the first time.
func _ready():
	setCryptonite()
	animation_looped.connect(on_has_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * speed * direction

func on_has_died():
	if (animation == "die"):
		get_parent().queue_free()
