extends Node2D

@export var minTime : float
@export var maxTime : float
@export var waitTime : float 

@onready var spawncontainer = $"../Obstacle spawner"
@onready var timer = $"Powerup Timer"

var spawnPoints : Array

func _ready() -> void:
	spawnPoints = spawncontainer.get_children()
	timer.start(waitTime)

func _on_powerup_timer_timeout() -> void:
	pass # Replace with function body.
