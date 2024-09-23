extends Node2D

var knifer_scene = preload("res://scenes/enemies/knifer.tscn")
var shooter_scene = preload("res://scenes/enemies/shooter.tscn")
var splasher_scene = preload("res://scenes/enemies/splasher.tscn")

func _on_start_timer_timeout() -> void:
	$KniferTimer.start()
	$ShooterTimer.start()
	$SplasherTimer.start()
	$SplasherTimer.set_wait_time(15)
	
func _on_knifer_timer_timeout() -> void:
	var knifer = knifer_scene.instantiate()
	var knifer_spawn_location = $KniferPath/KniferSpawnLocation
	knifer_spawn_location.progress_ratio = randf()
	knifer.position = knifer_spawn_location.position
	
	add_child(knifer)

func _on_shooter_timer_timeout() -> void:
	var shooter = shooter_scene.instantiate()
	var shooter_spawn_location := Vector2(randf_range(20, 140), 20)
	shooter.position = shooter_spawn_location
	add_child(shooter)

func _on_splasher_timer_timeout() -> void:
	var splasher = splasher_scene.instantiate()
	add_child(splasher)
