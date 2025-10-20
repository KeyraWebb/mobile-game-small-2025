extends Node2D

@export var obstacles : Array[PackedScene]
@onready var sensor = $Sensor
var coin = load("res://Scenes/Objects/Collectables/coin.tscn")
var coinGap = 40
var coinsLeft = 0
var coinParent
var prevPos


func _process(delta: float) -> void:
	if coinsLeft > 0:
		if self.global_position.x - prevPos.x > coinGap:
			spawnCoin(coinParent)
			coinsLeft -= 1

func spawnObstacle(parent):
	var select = randi_range(0, obstacles.size() - 1)
	var newObstacle = obstacles[select].instantiate()
	
	#using set deferred cuz godot was getting angry :I
	newObstacle.set_deferred("global_position", self.global_position)
	parent.call_deferred("add_child", newObstacle)
	
func spawnCoin(parent):
	var newCoin = coin.instantiate()
	newCoin.set_deferred("global_position", self.global_position)
	prevPos = global_position
	
	
func spawnPowerup(parent, powerup):
	var newPowerup = powerup.instantiate()
	newPowerup.set_deferred("global_position", self.global_position)
	parent.call_deferred("add_child", newPowerup)

func checkAvailable():
	var collision = sensor.get_overlapping_areas()
	if collision.size() > 0:
		return false
	else:
		return true
		
func SpawnCoins(coinCount, parent):
	coinsLeft = coinCount
	coinParent = parent
	prevPos = self.global_position
	
