extends Node2D

@export var minTime : float
@export var maxTime : float
@export var waitTime : float 
@export var powerups : Array[PackedScene]

@onready var spawncontainer = $"../Obstacle spawner"
@onready var timer = $"Powerup Timer"
@onready var holder = $"../../nonObstacle holder"

var spawnPoints : Array

func _ready() -> void:
	spawnPoints = spawncontainer.get_children()
	timer.start(waitTime)

func _on_powerup_timer_timeout() -> void:
	var newTime = randi_range(minTime,maxTime)
	timer.start(newTime)
	
	var spawnFound = false
	
	while !spawnFound:
		var select = randi_range(0, spawnPoints.size() - 1)
		if spawnPoints[select].checkAvailable():
			spawnPoints[select].spawnPowerup(holder, powerups[0])
			spawnFound = true
			
	timer.start(newTime)
