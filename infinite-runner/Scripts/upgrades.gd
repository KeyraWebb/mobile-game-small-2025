extends Control

@export var lifeBaseCost : int

@onready var lifeCostText = $"PanelContainer/VBoxContainer/Life Upgrade/HBoxContainer/Coins"
@onready var coinTotal = $Coins

var currLifeCost

func _ready():
	updateLifeCost()

func _on_exit_pressed() -> void:
	print("aaaaaa")
	self.visible = !self.visible

func updateLifeCost():
	currLifeCost = pow(lifeBaseCost, (Global.Lives + 1))
	lifeCostText.text = "%0.0f" % currLifeCost

func _on_life_upgrade_pressed() -> void:
	if Global.Coins > currLifeCost:
		Global.Coins -= currLifeCost
		Global.Lives += 1
		updateLifeCost()
		updateCoinDisplay()
		
func updateCoinDisplay():
	coinTotal.text = str(Global.Coins)

func _on_visibility_changed() -> void:
	if self.visible:
		updateCoinDisplay()
