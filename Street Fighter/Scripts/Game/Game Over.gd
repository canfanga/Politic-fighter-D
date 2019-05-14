extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	if Input.is_action_pressed("Restart"):
		get_tree().change_scene('res://Scenes/Game/Game.tscn')
