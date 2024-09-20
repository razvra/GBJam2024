extends CharacterBody2D

const SPEED = 15

func _ready() -> void:
	pass

# MOVEMENT
func _physics_process(delta: float) -> void:
	look_at(Globals.player_position)
	velocity = global_position.direction_to(Globals.player_position) * SPEED
	move_and_slide()

func _on_life_timer_timeout() -> void:
	queue_free()
