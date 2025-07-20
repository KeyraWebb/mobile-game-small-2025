extends CharacterBody2D


@export var INITIAL_SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#TODO: make jump and slide actions through swipe controls
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#infinite run
	#TODO: make speed up over time for difficulty
	velocity.x = 1 * INITIAL_SPEED

	move_and_slide()
