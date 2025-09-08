extends PanelContainer

@onready var gameManager = $"../.."
@onready var finalScoreLabel = $"VBoxContainer/Final Score"
@onready var highScoreLabel = $"VBoxContainer/High Score"
@onready var coinsLabel = $"VBoxContainer/Coins Collected"

func gameOver():
	finalScoreLabel.text = "Final score: %.0f" % gameManager.score
	if gameManager.score > Global.HighScore:
		Global.HighScore = gameManager.score
		
		
	highScoreLabel.text = "HighScore: %.0f" % Global.HighScore
	
	Global.Coins += gameManager.coins
	coinsLabel.text = "Coins Collected: %.0f" % gameManager.coins
	
	get_tree().paused = true
	self.visible = true
	Global.saveGame()

func _on_play_again_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
