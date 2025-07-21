extends Control
@export var playscene : PackedScene
@onready var credits = $Credits

func _on_button_pressed() -> void: #play button
	get_tree().change_scene_to_packed(playscene)


func _on_credits_button_pressed() -> void:
	credits.visible = true
