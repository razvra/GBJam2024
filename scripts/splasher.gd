extends CharacterBody2D

const SPEED = 15

func _ready() -> void:
	pass

# MOVEMENT
func _physics_process(delta: float) -> void:
	# move_and_slide()
	pass

func _on_life_timer_timeout() -> void:
	queue_free()
