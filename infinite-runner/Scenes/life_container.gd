extends HBoxContainer

var lifeCounter = load("res://Scenes/Objects/life_counter.tscn")
var currLives
var lifeCounterList

@onready var gameOver = $"../../Game Over"

func _ready() -> void:
	currLives = Global.Lives
	print(currLives)
	for life in range(currLives):
		var newLife = lifeCounter.instantiate()
		self.add_child(newLife)
		print(newLife)
	
	lifeCounterList = get_children()
	
func LifeLost():
	
	if currLives <= 0:
		gameOver.gameOver()
	else:
		currLives -= 1
		lifeCounterList[currLives].queue_free() 
	
