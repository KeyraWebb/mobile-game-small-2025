## For detecting swipe input
##
## @tutorial: https://www.youtube.com/watch?v=mcKhZPBLhLo&list=WL&index=1

extends Camera2D


@export var minLength : int
var startPos : Vector2
var curPos: Vector2
var swiping = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		if !swiping:
			swiping = true
			startPos = get_global_mouse_position()
	if Input.is_action_pressed("Interact"):
		if swiping:
			curPos = get_global_mouse_position()
			if startPos.distance_to(curPos) >= minLength:
				print("Swipe detected!")
				swiping = false
	else:
		swiping = false			
