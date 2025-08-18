extends Node2D

@export var frequency : int
@export var initSpawn = 5

@onready var obstacleHolder = $"../../Obstacle holder"
@onready var spawnTimer = $"../SpawnTimer"

var spawnPoints : Array
var timeElapsed
var spawnCount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnPoints = get_children()
	spawnCount = initSpawn
	Spawn()

func Spawn() -> void:
	var spawnFound = false
	
	while !spawnFound:
		var select = randi_range(0, spawnPoints.size() - 1)
		if spawnPoints[select].checkAvailable():
			spawnPoints[select].spawnObstacle(obstacleHolder)
			spawnFound = true
		
	if spawnCount >= 0:
		spawnTimer.start(frequency)
		spawnCount -= 1

func _on_despawn_zone_area_entered(area: Area2D) -> void:
	area.queue_free()
	Spawn()
	
