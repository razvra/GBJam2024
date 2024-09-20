extends CharacterBody2D

var direction : float
const SPEED = 50

func _ready() -> void:
	pass #position = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity = Vector2.DOWN * SPEED
	move_and_slide()

func _on_disappear_timer_timeout() -> void:
	queue_free()
