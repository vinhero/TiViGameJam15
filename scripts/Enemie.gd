class_name Enemie
extends AnimatedSprite2D

const DIE_ANIMATION : String = "die"
const WALK_ANIMATION : String = "walk"

@export var safety_offset : int = 10
@export var direction = -1
@export var MaxCryptonites = 3
@export var speed = 60

@export_range(0.0, 1.0) var minColor : float
@export_range(0.0, 1.0) var maxColor : float

var red : float
var green : float
var blue : float

signal attacked_alchemist
signal has_died(enemie: Enemie, emit: bool)
signal spawned(enemie: Enemie)

var arrCryptonite: Array[int]

func setCryptonite():
	for i in range(0, MaxCryptonites):
		var nMax = ENUMS.Ingridients.size() - 2
		var nRandom = randi_range(0, nMax)
		arrCryptonite.append(nRandom)
	
	#var lblCryptonite = Label.new()
	#lblCryptonite.text = str(arrCryptonite)
	#lblCryptonite.position.y = position.y - 10.0
	#lblCryptonite.position.x = position.x - 30.0
	#add_child(lblCryptonite)

func setArea2D():
	var area : Area2D = Area2D.new()
	var collision : CollisionShape2D = CollisionShape2D.new()
	var rect : RectangleShape2D = RectangleShape2D.new()
	var current_size = sprite_frames.get_frame_texture(WALK_ANIMATION, frame).get_size()
	rect.size = Vector2(current_size.x - safety_offset, current_size.y - safety_offset)
	collision.position = Vector2(position.x - (position.x * -1), position.y - (position.y + -1))
	collision.shape = rect
	area.add_child(collision)
	add_child(area)
	area.area_entered.connect(hitbox_entered)

func kill():
	speed = 0
	animation = DIE_ANIMATION
	z_index = 1000

func kill_external():
	kill()
	has_died.emit(self, true)

func attack():
	speed = 0
	attacked_alchemist.emit()
	has_died.emit(self, true)

# Called when the node enters the scene tree for the first time.
func _ready():
	red = randf_range(minColor, maxColor)
	green = randf_range(minColor, maxColor)
	blue = randf_range(minColor, maxColor)
	
	material.set_shader_parameter("red", red)
	material.set_shader_parameter("green", green)
	material.set_shader_parameter("blue", blue)
	
	setCryptonite()
	setArea2D()
	animation_looped.connect(on_has_died)
	
	speed = randi_range(60, 100)
	
	spawned.emit(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * speed * direction

func on_has_died():
	if (animation == DIE_ANIMATION):
		has_died.emit(self, false)
		#get_parent().queue_free()

func hitbox_entered(area):
	if (area.get_parent() is Alchemist):
		attack()
