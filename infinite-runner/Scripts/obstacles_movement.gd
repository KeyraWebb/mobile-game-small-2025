extends Node2D

@onready var player = $"../Player"
var playerX

func _ready() -> void:
	playerX = player.position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var changeX = player.position.x - playerX
	position.x = position.x + changeX
	playerX = player.position.x
	
