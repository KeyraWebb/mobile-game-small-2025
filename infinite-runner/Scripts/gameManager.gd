extends Node2D

var score = 0
var coins = 0

@export var scoreMagnifier = 1000
@onready var scoreLabel = $CanvasLayer/Score
@onready var upButton = $"CanvasLayer/Up Button"
@onready var downButton = $"CanvasLayer/Down Button"
@onready var coinLabel = $CanvasLayer/Coins

var pauseAction = InputEventAction.new()
var upAction = InputEventAction.new()
var downAction = InputEventAction.new()

func _ready() -> void:
	setAccessMode()
	pauseAction.action = "Pause"
	pauseAction.pressed = true
	upAction.action = "Up"
	downAction.action = "Down"

func _process(delta: float) -> void:
	score += delta * scoreMagnifier
	scoreLabel.text = "Score: %010.0f" % score 
	
func setAccessMode():
	upButton.visible = Global.AccessMode
	downButton.visible = Global.AccessMode

#button controls - simulating the touch screen buttons so that they can be anchored
func _on_menu_button_pressed() -> void:
	Input.parse_input_event(pauseAction)

func _on_up_button_button_down() -> void:
	upAction.pressed = true
	Input.parse_input_event(upAction)

func _on_up_button_button_up() -> void:
	upAction.pressed = false
	Input.parse_input_event(upAction)

func _on_down_button_button_down() -> void:
	downAction.pressed = true
	Input.parse_input_event(downAction)

func _on_down_button_button_up() -> void:
	downAction.pressed = false
	Input.parse_input_event(downAction)
	
func AddCoin():
	coins += 1
	coinLabel.text = str(coins)
	
