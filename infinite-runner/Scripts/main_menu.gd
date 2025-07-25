extends Control
@onready var credits = $Credits
@onready var settings = $Settings

func _ready() -> void:
	Global.loadGame()

func _on_button_pressed() -> void: #play button
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_credits_button_pressed() -> void:
	credits.visible = true


func _on_settings_button_pressed() -> void:
	settings.SetToggle()
	settings.visible = true
