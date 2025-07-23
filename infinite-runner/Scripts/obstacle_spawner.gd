extends Node2D

@export var frequency : int
@onready var obstacleHolder = $"../../Obstacle holder"
@onready var spawnTimer = $"../../Timer"
var spawnPoints : Array
var timeElapsed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnPoints = get_children()

func _on_timer_timeout() -> void:
	var select = randi_range(0, spawnPoints.size() - 1)
	spawnPoints[select].spawn(obstacleHolder)
	spawnTimer.start(1)
	print("spawn")
