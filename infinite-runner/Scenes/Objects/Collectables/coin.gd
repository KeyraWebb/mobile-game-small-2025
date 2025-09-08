extends Area2D
@onready var collider = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	body.CollectCoin()
	collider.set_deferred("disabled", true)
	self.visible = false
