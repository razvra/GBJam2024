extends Node2D

# Preload the character scenes
var character_scenes = [
	preload("res://scenes/shotty.tscn"),
	preload("res://scenes/slashy.tscn"),
	preload("res://scenes/drowny.tscn")
]

var index : int = 0
var characters : Array[CharacterBody2D] = []
var current_character : CharacterBody2D

func _ready() -> void:
	var screen_center = get_viewport_rect().size / 2
	
	for scene in character_scenes:
		var character = scene.instantiate()
		character.position = screen_center
		add_child(character)
		characters.append(character)
		character.hide()
		disable_collisions(character)
	
	current_character = characters[0]
	current_character.show()
	enable_collisions(current_character)

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("change_ghost"):
		switch_character()
	pass

func switch_character():
	current_character.hide()
	index = (index + 1) % characters.size()
	current_character = characters[index]
	current_character.show()

func enable_collisions(character):
	for shape in character.get_children():
		if shape is CollisionShape2D:
			shape.disabled = false

func disable_collisions(character):
	for shape in character.get_children():
		if shape is CollisionShape2D:
			shape.disabled = true
