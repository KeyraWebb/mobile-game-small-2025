extends Area2D

@export var shieldTime : float

func _on_body_entered(body: Node2D) -> void:
	body.powerTimer.start(shieldTime + (Global.ShieldTimerUpgrades * 5))
	body.sheilded = true
	body.sheildDisplay.visible = true
	self.queue_free()
