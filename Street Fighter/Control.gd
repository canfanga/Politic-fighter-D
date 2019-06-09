extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	if Input.is_action_pressed("Restart"):
		get_tree().change_scene('res://Scenes/Game/Game.tscn')

func _on_Timer_timeout():
	$Label3.visible = true

func _on_Timer2_timeout():
	$Label2.visible = true
