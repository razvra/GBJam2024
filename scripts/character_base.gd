extends CharacterBody2D

const ACCEL = 100.0
const DECEL = ACCEL / 12

func _physics_process(_delta: float) -> void:
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	
	# handle movement
	if direction: # accelerate
		velocity = direction.normalized() * ACCEL
	else: #decelerate
		velocity = velocity.move_toward(Vector2.ZERO, DECEL)
	move_and_slide()
