extends Node2D

var score = 0
@export var scoreMagnifier = 1000
@onready var scoreLabel = $CanvasLayer/Score

func _process(delta: float) -> void:
	score += delta * scoreMagnifier
	scoreLabel.text = "Score: %010.0f" % score 
