extends Area2D

var speed : int

func _process(delta: float) -> void:
	self.position.x = self.position.x - speed * delta
	
