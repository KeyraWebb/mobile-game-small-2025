extends Control

@onready var accessButton = $"PanelContainer/BoxContainer/VBoxContainer2/Access Mode"

func _on_button_pressed() -> void:
	Global.saveGame()
	self.visible = false

func _on_access_mode_pressed() -> void:
	Global.AccessMode = !Global.AccessMode

func SetToggle():
	accessButton.button_pressed = Global.AccessMode
