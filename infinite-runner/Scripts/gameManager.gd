extends Node2D

var score = 0
@export var scoreMagnifier = 1000
@onready var scoreLabel = $CanvasLayer/Score
@onready var upButton = $"CanvasLayer/Up Button"
@onready var downButton = $"CanvasLayer/Down Button"

func _ready() -> void:
	setAccessMode()

func _process(delta: float) -> void:
	score += delta * scoreMagnifier
	scoreLabel.text = "Score: %010.0f" % score 
	
func setAccessMode():
	upButton.visible = Global.AccessMode
	downButton.visible = Global.AccessMode
