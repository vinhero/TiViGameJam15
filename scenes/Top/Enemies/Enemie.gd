class_name Enemie
extends AnimatedSprite2D

var speed = 60
var direction = -1

var arrCryptonite = [3]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * speed * direction
