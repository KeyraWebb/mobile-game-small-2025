extends PanelContainer

@onready var gameManager = $"../.."
@onready var finalScoreLabel = $"VBoxContainer/Final Score"

func gameOver():
	finalScoreLabel.text = "Final score: %.0f" % gameManager.score
	get_tree().paused = true
	self.visible = true

func _on_play_again_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
