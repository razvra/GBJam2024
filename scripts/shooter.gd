extends CharacterBody2D

const SPEED = 15
const BORDER = 20
@onready var bullet = preload("res://scenes/bullet.tscn")

var target : float

func _ready() -> void:
	$ShotTimer.start()
	_set_target()

# MOVEMENT
func _physics_process(delta: float) -> void:
	if $ShotTimer.is_stopped() && $MoveTimer.is_stopped():
		$ShotTimer.start()
	
	if $MoveTimer.time_left > 0:
		move(delta)


func _on_life_timer_timeout() -> void:
	queue_free()

func shoot() -> void:
	var instance = bullet.instantiate()
	add_child(instance)

func _on_shot_timer_timeout() -> void:
	shoot()
	$MoveTimer.start()

func _on_move_timer_timeout() -> void:
	_set_target()

func _set_target() -> void:
	target = randf_range(BORDER, 160 - BORDER)

func move(delta) -> void:
	if position.x != target:
		var direction = sign(target - position.x)
		position.x += direction * SPEED * delta
		#position.x = move_toward(position.x, target, delta)
