## For detecting swipe input
##
## @tutorial: https://www.youtube.com/watch?v=mcKhZPBLhLo&list=WL&index=1

extends Camera2D


@export var minLength : int
@export var allowance : int
var startPos : Vector2
var curPos: Vector2
var swiping = false
signal swipeUp
signal swipeDown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#start of swipe
	if Input.is_action_just_pressed("Interact"):
		if !swiping:
			swiping = true
			startPos = get_global_mouse_position()
	
	#swipe follow through		
	if Input.is_action_pressed("Interact"):
		if swiping:
			curPos = get_global_mouse_position()
			if startPos.distance_to(curPos) >= minLength: #check if swipe is long enough to be a swipe
				if abs(startPos.x - curPos.x) <= allowance: #check if swipe is within range to be vertical
					if startPos.y - curPos.y > 0: # what direction?
						swipeUp.emit()
					else: 
						swipeDown.emit()
				swiping = false
	
	#end swipe if conditions not met
	else:
		swiping = false			
