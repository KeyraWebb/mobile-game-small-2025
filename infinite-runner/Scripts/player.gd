extends CharacterBody2D


@export var INITIAL_SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var slideLength = 0.5

@onready var jumpCollider = $"Jump Collider"
@onready var slideCollider = $"Slide Collider"
@onready var camera = $Camera2D
@onready var uprightSprite = $"Upright Sprite"
@onready var slideSprite = $"Slide Sprite"
@onready var gameOver = $"../CanvasLayer/Game Over"
var sliding = false
var currentSlide = 0


func _ready() -> void:
	camera.swipeUp.connect(_on_swipeup.bind())
	camera.swipeDown.connect(_on_swipedown.bind())
	slideCollider.disabled = true
	jumpCollider.disabled = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if sliding: #slide handling
		if currentSlide > 0:
			currentSlide = currentSlide - delta
		else:
			DisableSlide()
	
	#infinite run
	#TODO: make speed up over time for difficulty
	velocity.x = 1 * INITIAL_SPEED

	move_and_slide()

func _on_swipeup():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		if sliding: #terminate slide
			DisableSlide()
		
func _on_swipedown():
	velocity.y = -1 * JUMP_VELOCITY
	
	#switch appearance and collision
	jumpCollider.disabled = true
	slideCollider.disabled = false
	uprightSprite.visible = false
	slideSprite.visible = true
	
	#start slide
	sliding = true
	currentSlide = slideLength
	
#code for terminating the slide
func DisableSlide():
	sliding = false
	slideCollider.disabled = true
	jumpCollider.disabled = false
	uprightSprite.visible = true
	slideSprite.visible = false
	
func Hit():
	gameOver.gameOver()
