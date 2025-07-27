extends Node2D

@export var obstacles : Array[PackedScene]

func spawn(parent):
	var select = randi_range(0, obstacles.size() - 1)
	var newObstacle = obstacles[select].instantiate()
	
	#using set deferred cuz godot was getting angry :I
	newObstacle.set_deferred("global_position", self.global_position)
	parent.call_deferred("add_child", newObstacle)
