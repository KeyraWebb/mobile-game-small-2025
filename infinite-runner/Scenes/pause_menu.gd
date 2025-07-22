extends PanelContainer

func _input(event) -> void:
	if event.is_action_pressed("Pause"):
		self.visible = !self.visible
		get_tree().paused = !get_tree().paused
		
