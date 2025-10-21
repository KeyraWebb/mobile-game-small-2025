extends Control

@export var lifeBaseCost : int

@onready var lifeCostText = $"PanelContainer/VBoxContainer/Life Upgrade/HBoxContainer/Coins"
@onready var coinTotal = $Coins

var currLifeCost
var lifePrices = [100,500,1000,2000,5000]

func _ready():
	updateLifeCost()

func _on_exit_pressed() -> void:
	self.visible = !self.visible

func updateLifeCost():
	if Global.Lives < len(lifePrices):
		currLifeCost = lifePrices[Global.Lives]
		lifeCostText.text = "%0.0f" % currLifeCost
	else:
		currLifeCost = -1
		lifeCostText.text = "SOLD OUT"

func _on_life_upgrade_pressed() -> void:
	if currLifeCost > 0 && Global.Coins > currLifeCost:
		Global.Coins -= currLifeCost
		Global.Lives += 1
		updateLifeCost()
		updateCoinDisplay()
		Global.saveGame()
		
func updateCoinDisplay():
	coinTotal.text = str(Global.Coins)

func _on_visibility_changed() -> void:
	if self.visible:
		updateCoinDisplay()
