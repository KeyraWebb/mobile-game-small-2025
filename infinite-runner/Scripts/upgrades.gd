extends Control

@export var lifeBaseCost : int

@onready var lifeCostText = $"PanelContainer/VBoxContainer/Life Upgrade/HBoxContainer/Coins"

var currLifeCost

func _ready():
	currLifeCost = updateLifeCost()

func _on_exit_pressed() -> void:
	self.visible = !self.visible

func updateLifeCost():
	currLifeCost = pow(lifeBaseCost, (Global.Lives + 1))
	lifeCostText.text = "%0.0f" % currLifeCost

func _on_life_upgrade_pressed() -> void:
	if Global.Coins > currLifeCost:
		Global.Coins -= currLifeCost
		Global.Lives += 1
		updateLifeCost()
