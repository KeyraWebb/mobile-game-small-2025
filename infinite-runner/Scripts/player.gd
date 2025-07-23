extends CharacterBody2D


@export var INITIAL_SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@onready var camera = $Camera2D

func _ready() -> void:
	camera.swipeUp.connect(_on_swipeup.bind())
	camera.swipeDown.connect(_on_swipedown.bind())

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#infinite run
	#TODO: make speed up over time for difficulty
	velocity.x = 1 * INITIAL_SPEED

	move_and_slide()

func _on_swipeup():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		
func _on_swipedown():
	pass
