#class_name Potion
extends CharacterBody2D

const SPEED: float = 600.0
const JUMP_VELOCITY: float = -400.0
var direction: float = 1
var _target : Enemie
var _current_velocity = Vector2.ZERO
var spawnPosition: Vector2
var spawnRotation: float
var init_abstand : float = 0.0

@export var drag_force : float = 0.01

func set_target (new_target: Enemie):
	_target = new_target
	init_abstand = _target.global_position.x - global_position.x

func _ready():
	rotation = -0.2
	z_index = 1000
	_current_velocity = SPEED * Vector2.RIGHT.rotated(rotation) * 2
	#global_position = spawnPosition
	#global_rotation = spawnRotation

func _physics_process(delta):
	if not _target:
		queue_free()
		return
	var direction := Vector2.RIGHT.rotated(rotation).normalized()
	
	if _target:
		direction = global_position.direction_to(_target.global_position)
	var distance = (_target.global_position.x - global_position.x)
	$AnimatedSprite2D.rotation += distance / init_abstand
	if ((_target.global_position.x - global_position.x) < 0):
		distance *= -1
	var current_dragforce = drag_force + ((1 / distance) * 16)
	#print(current_dragforce)
	
	var desired_velocity := direction * SPEED
	var previous_velocity = _current_velocity
	var change = (desired_velocity - _current_velocity) * current_dragforce
	_current_velocity += change
	
	
	position += _current_velocity * delta
	look_at(global_position * _current_velocity)
	#velocity = Vector2(0, -SPEED).rotated(direction)
	#move_and_slide()
	#position = position.move_toward(_target.global_position, SPEED * delta)

#func _init(enemie: Enemie):
	#_target = enemie

func _on_area_2d_area_entered(area):
	if area.get_parent() == _target:
		_target.kill()
		queue_free()
