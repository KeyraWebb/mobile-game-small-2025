extends Node2D

@export var obstacles : Array[PackedScene]
@onready var sensor = $Sensor

func spawnObstacle(parent):
	var select = randi_range(0, obstacles.size() - 1)
	var newObstacle = obstacles[select].instantiate()
	
	#using set deferred cuz godot was getting angry :I
	newObstacle.set_deferred("global_position", self.global_position)
	parent.call_deferred("add_child", newObstacle)
	
func spawnCoin(parent):
	pass
	
func spawnPowerup(parent):
	pass

func checkAvailable():
	var collision = sensor.get_overlapping_areas()
	if collision.size() > 0:
		return false
	else:
		return true
