extends HBoxContainer

var lifeCounter = load("res://Scenes/Objects/life_counter.tscn")
var lives = Global.Lives
var currLives
var lifeCounterList

@onready var gameOver = $"../../Game Over"

func _ready() -> void:
	currLives = lives
	for life in range(lives - 1):
		var newLife = lifeCounter.instantiate()
		self.add_child(newLife)
	
	lifeCounterList = get_children()
	
func LifeLost():
	
	if currLives <= 0:
		gameOver.gameOver()
	else:
		currLives -= 1
		lifeCounterList[currLives].queue_free()
	
