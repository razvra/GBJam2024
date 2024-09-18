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
	
	current_character = characters[0]
	current_character.show()

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("change_ghost"):
		switch_character()
	
	Globals.player_position = current_character.position

func switch_character():
	current_character.hide()
	index = (index + 1) % characters.size()
	current_character = characters[index]
	current_character.show()
