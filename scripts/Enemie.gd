class_name Enemie
extends AnimatedSprite2D

@export var direction = -1
@export var MaxCryptonites = 3
@export var speed = 60

var arrCryptonite: Array[int]

signal hasDied

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
	animation_finished.connect(on_has_died)
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	setCryptonite()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * speed * direction

func on_has_died():
	print("finally")
