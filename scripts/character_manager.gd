extends Node2D

# Preload the character scenes
var character_scenes = [
	preload("res://scenes/ghosts/slashy.tscn"),
	preload("res://scenes/ghosts/shotty.tscn"),
	preload("res://scenes/ghosts/drowny.tscn")
]

var index : int = 0
var characters : Array[CharacterBody2D] = []
var current_character : CharacterBody2D

@onready var slashy_shader_rect: ColorRect = $"../SlashyShader"
@onready var shotty_shader_rect: ColorRect = $"../ShottyShader"
@onready var drowny_shader_rect: ColorRect = $"../DrownyShader"

@onready var current_shader : Array[ColorRect] = [
	slashy_shader_rect,
	shotty_shader_rect,
	drowny_shader_rect
]

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
	slashy_shader_rect.show()

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("change_ghost"):
		switch_character()
	
	Globals.player_position = current_character.position

func switch_character():
	current_character.hide()
	current_shader[index].hide()
	index = (index + 1) % characters.size()
	current_character = characters[index]
	current_character.show()
	current_shader[index].show()
