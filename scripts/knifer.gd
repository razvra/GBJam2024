extends CharacterBody2D

const SPEED = 15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	look_at(Globals.player_position)
	velocity = global_position.direction_to(Globals.player_position) * SPEED
	move_and_slide()
