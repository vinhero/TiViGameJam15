#class_name Potion
extends CharacterBody2D

const SPEED: float = 300.0
const JUMP_VELOCITY: float = -400.0
var direction: float = 1
var _target : Enemie
var spawnPosition: Vector2
var spawnRotation: float

func set_target (new_target: Enemie):
	_target = new_target

#func _ready():
	#global_position = spawnPosition
	#global_rotation = spawnRotation

func _physics_process(delta):
	#velocity = Vector2(0, -SPEED).rotated(direction)
	#move_and_slide()
	pass

#func _init(enemie: Enemie):
	#_target = enemie
