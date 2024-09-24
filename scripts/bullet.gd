extends CharacterBody2D

var direction : float
const SPEED = 50

func _physics_process(delta: float) -> void:
	velocity = Vector2.DOWN * SPEED
	move_and_slide()
	if get_slide_collision_count() > 0:
		queue_free()

func _on_disappear_timer_timeout() -> void:
	queue_free()
