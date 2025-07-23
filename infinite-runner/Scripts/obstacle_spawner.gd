extends Node2D

@export var frequency : int
var spawnPoints : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnPoints = get_children()
	print(spawnPoints)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
