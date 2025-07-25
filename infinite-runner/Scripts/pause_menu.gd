extends PanelContainer

@onready var highScoreLabel = $VBoxContainer/HighScore

func _ready() -> void:
	highScoreLabel.text = "HighScore: %.0f" % Global.HighScore

func _input(event) -> void:
	if event.is_action_pressed("Pause"):
		self.visible = !self.visible
		get_tree().paused = !get_tree().paused

func _on_resume_pressed() -> void:
	self.visible = !self.visible
	get_tree().paused = !get_tree().paused

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
