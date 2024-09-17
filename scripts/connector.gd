extends Node2D

@onready var left_area_2d = $LeftArea2D
@onready var right_area_2d = $RightArea2D
@onready var top_area_2d = $TopArea2D
@onready var bot_area_2d = $BotArea2D

var can_warp_from_left = true
var can_warp_from_right = true
var can_warp_from_top = true
var can_warp_from_bot = true

# screen corner warp interactions
func _on_left_area_2d_body_exited(body: Node2D) -> void:
	if body.position.x < left_area_2d.global_position.x:
		body.position.x = right_area_2d.global_position.x

func _on_right_area_2d_body_exited(body: Node2D) -> void:
	if body.position.x > right_area_2d.global_position.x:
		body.position.x = left_area_2d.global_position.x

func _on_top_area_2d_body_exited(body: Node2D) -> void:
	if body.position.y < top_area_2d.global_position.y:
		body.position.y = bot_area_2d.global_position.y

func _on_bot_area_2d_body_exited(body: Node2D) -> void:
	if body.position.y > bot_area_2d.global_position.y:
		body.position.y = top_area_2d.global_position.y
