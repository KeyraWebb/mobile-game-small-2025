extends Node2D

@export var obstacles : Array[PackedScene]

func spawn(parent):
	var select = randi_range(0, obstacles.size() - 1)
	var newObstacle = obstacles[select].instantiate()
	newObstacle.global_position = self.global_position
	parent.add_child(newObstacle)
