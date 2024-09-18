extends Node2D

var knifer_scene = preload("res://scenes/knifer.tscn")

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_knifer_timer_timeout() -> void:
	var knifer = knifer_scene.instantiate()
	var knifer_spawn_location = $KniferPath/KniferSpawnLocation
	knifer_spawn_location.progress_ratio = randf()
	knifer.position = knifer_spawn_location.position
	
	var direction = knifer_spawn_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	
	add_child(knifer)


func _on_start_timer_timeout() -> void:
	$KniferTimer.start()
