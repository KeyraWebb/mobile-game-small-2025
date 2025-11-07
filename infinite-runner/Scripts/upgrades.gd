extends Control

@export var lifeBaseCost : int
@export var lifePrices = [100,500,1000,2000,5000]
@export var shieldPowerupCost = 100
@export var shieldTimerPrices = [250,500,1000,2000,5000]

@onready var lifeCostText = $"PanelContainer/VBoxContainer/Life Upgrade/HBoxContainer/Coins"
@onready var coinTotal = $Coins
@onready var shieldButton = $"PanelContainer/VBoxContainer/Shield Upgrade"
@onready var shieldButtonCostText = $"PanelContainer/VBoxContainer/Shield Upgrade/HBoxContainer/Coins"
@onready var shieldTimerButton = $"PanelContainer/VBoxContainer/Shield Timer Upgrade"
@onready var shieldTimerButtonCostText = $"PanelContainer/VBoxContainer/Shield Timer Upgrade/HBoxContainer/Coins"

var currLifeCost
var currShieldTimerCost


func _ready():
	updateLifeCost()
	updateShieldCost()
	
	#identify if the shield powerup has been purchased
	if Global.ShieldPowerup:
		shieldButton.visible = false
		shieldTimerButton.visible = true
	else:
		shieldButton.visible = true
		shieldTimerButton.visible = false

func _on_exit_pressed() -> void:
	self.visible = !self.visible

func updateLifeCost():
	if Global.Lives < len(lifePrices):
		currLifeCost = lifePrices[Global.Lives]
		lifeCostText.text = "%0.0f" % currLifeCost
	else:
		currLifeCost = -1
		lifeCostText.text = "SOLD OUT"
		
func updateShieldCost():
	shieldButtonCostText = shieldPowerupCost
	
	#check if there are any more upgrades to buy
	if Global.ShieldTimerUpgrades < len(shieldTimerPrices):
		currShieldTimerCost = shieldTimerPrices[Global.ShieldTimerUpgrades]
		shieldTimerButtonCostText.text = "%0.0f" % currShieldTimerCost
	else:
		currShieldTimerCost = -1
		shieldTimerButtonCostText.text = "SOLD OUT"

func _on_life_upgrade_pressed() -> void:
	if currLifeCost > 0 && Global.Coins >= currLifeCost:
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

func _on_shield_upgrade_pressed() -> void:
	if Global.Coins >= shieldPowerupCost:
		Global.Coins -= shieldPowerupCost
		Global.ShieldPowerup = true
		
		#switch which upgrade is visible
		shieldButton.visible = false
		shieldTimerButton.visible = true
		
		updateShieldCost()
		
		updateCoinDisplay()
		Global.saveGame()

func _on_shield_timer_upgrade_pressed() -> void:
	if currShieldTimerCost > 0 && Global.Coins >= currShieldTimerCost:
		Global.Coins -= currShieldTimerCost
		Global.ShieldTimerUpgrades += 1
		
		updateShieldCost()
		updateCoinDisplay()
		Global.saveGame()
