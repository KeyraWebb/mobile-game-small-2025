extends CharacterBody2D


@export var INITIAL_SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var slideLength = 0.5
@export var speedModifier = 1

@onready var jumpCollider = $"Jump Collider"
@onready var slideCollider = $"Slide Collider"
@onready var camera = $Camera2D
@onready var uprightSprite = $"Upright Sprite"
@onready var slideSprite = $"Slide Sprite"
@onready var gameOver = $"../CanvasLayer/Game Over"
@onready var gameManager = $".."

var sliding = false
var currentSpeed
var slideStartPos

var jumping = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Up"):
		_on_swipeup()
	if Input.is_action_just_pressed("Down"):
		_on_swipedown()

func _ready() -> void:
	camera.swipeUp.connect(_on_swipeup.bind())
	camera.swipeDown.connect(_on_swipedown.bind())
	slideCollider.disabled = true
	jumpCollider.disabled = false
	currentSpeed = INITIAL_SPEED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if sliding: #slide handling
		if self.global_position.x - slideStartPos.x >= slideLength:
			DisableSlide()
	
	if uprightSprite.animation == "Fall" && jumping && is_on_floor():
		uprightSprite.play("Walk")
		jumping = false
		
	#infinite run
	velocity.x = 1 * currentSpeed
	currentSpeed += delta * speedModifier

	move_and_slide()

func _on_swipeup():
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		#animation control
		jumping = true		
		uprightSprite.play("Jump")
		
		if sliding: #terminate slide
			DisableSlide()
		
func _on_swipedown():
	if !sliding: #check if already sliding
		velocity.y = -1 * JUMP_VELOCITY
		
		#switch appearance and collision
		jumpCollider.disabled = true
		slideCollider.disabled = false
		uprightSprite.visible = false
		slideSprite.visible = true
		
		#start slide
		slideStartPos = self.global_position
		sliding = true
	
#code for terminating the slide
func DisableSlide():
	sliding = false
	slideCollider.disabled = true
	jumpCollider.disabled = false
	uprightSprite.visible = true
	slideSprite.visible = false
	uprightSprite.play("Walk")
	
func Hit():
	gameOver.gameOver()

func _on_upright_sprite_animation_finished() -> void:
	if uprightSprite.animation == "Jump":
		uprightSprite.play("Fall")
		
func CollectCoin():
	gameManager.AddCoin()
