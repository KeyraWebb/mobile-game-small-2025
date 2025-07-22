extends PanelContainer
@export var mainMenu : PackedScene

func _input(event) -> void:
	if event.is_action_pressed("Pause"):
		self.visible = !self.visible
		get_tree().paused = !get_tree().paused
		


func _on_resume_pressed() -> void:
	self.visible = !self.visible
	get_tree().paused = !get_tree().paused

func _on_main_menu_pressed() -> void:
	print(mainMenu)
	get_tree().change_scene_to_packed(mainMenu)
