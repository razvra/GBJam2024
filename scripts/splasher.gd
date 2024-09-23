extends CharacterBody2D

const FREQUENCY = 5
const AMPLITUDE = 1
var time = 0

func _ready() -> void:
	#play animation (entering)
	pass

# MOVEMENT
func _physics_process(delta: float) -> void:
	time += delta
	clampf(time, 2, 2.5)
	var movement = cos(time * FREQUENCY) * AMPLITUDE
	position.y = movement * time

func _on_life_timer_timeout() -> void:
	$AnimationPlayer3.play("fade_out")
	await get_tree().create_timer(1).timeout
	queue_free()
