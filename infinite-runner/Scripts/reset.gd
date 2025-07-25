extends PanelContainer


func _on_reset_pressed() -> void:
	self.visible = true

func _on_cancel_pressed() -> void:
	self.visible = false

func _on_reset_conf_pressed() -> void:
	self.visible = false
	Global.Reset()
