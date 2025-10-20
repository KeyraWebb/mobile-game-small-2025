extends Node2D

@export var frequency : int
@export var initSpawn = 5
@export var maxCoins = 5
@export var coinSpawnGap = 500

@onready var obstacleHolder = $"../../Obstacle holder"
@onready var coinHolder = $"../../nonObstacle holder"
@onready var spawnTimer = $"../SpawnTimer"

var spawnPoints : Array
var timeElapsed
var spawnCount
var prevPos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnPoints = get_children()
	spawnCount = initSpawn
	Spawn()
	prevPos = global_position
	
func _process(delta: float) -> void:
	if global_position.x - prevPos.x > coinSpawnGap:
		SpawnCoins()

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
	
	if area.get_parent() == obstacleHolder:
		Spawn()
	
func SpawnCoins():
	var spawnFound = false
	var coinCount = randi_range(1, maxCoins)
	
	while !spawnFound:
		var select = randi_range(0, spawnPoints.size() - 1)
		if spawnPoints[select].checkAvailable():
			spawnPoints[select].SpawnCoins(coinCount, coinHolder)
			spawnFound = true
			
	prevPos = global_position
	
