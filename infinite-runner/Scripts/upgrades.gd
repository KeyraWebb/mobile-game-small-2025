extends Control

func _on_exit_pressed() -> void:
	self.visible = !self.visible
	get_tree().paused = !get_tree().paused
