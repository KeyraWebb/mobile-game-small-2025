extends Node2D

@export var minTime : float
@export var maxTime : float
@export var waitTime : float 


@onready var spawncontainer = $"../Obstacle spawner"
@onready var timer = $"Powerup Timer"
@onready var holder = $"../../nonObstacle holder"

var spawnPoints : Array
var powerups : Array[PackedScene]

func _ready() -> void:
	spawnPoints = spawncontainer.get_children()
	timer.start(waitTime)
	if Global.ShieldPowerup:
		powerups.append(load("res://Scenes/Objects/Collectables/shieldPowerup.tscn"))

func _on_powerup_timer_timeout() -> void:
	print("SPAWN?")
	if !powerups.is_empty():
		print("SPAWN!")
		var newTime = randi_range(minTime,maxTime)
		timer.start(newTime)
		
		var spawnFound = false
		
		while !spawnFound:
			var select = randi_range(0, spawnPoints.size() - 1)
			if spawnPoints[select].checkAvailable():
				spawnPoints[select].spawnPowerup(holder, powerups.pick_random())
				spawnFound = true
				
		timer.start(newTime)
