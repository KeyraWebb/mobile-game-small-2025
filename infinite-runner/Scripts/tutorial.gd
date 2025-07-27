extends Control

@export var timeOpen = 5
@onready var timer = $Timer

func _ready():
	if Global.FirstTime:
		self.visible = true
		Global.FirstTime = false
		timer.start(timeOpen)

func _on_timer_timeout() -> void:
	self.visible = false
