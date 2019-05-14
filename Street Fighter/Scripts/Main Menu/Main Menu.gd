extends Control



func _on_FadeIn_fade_finished():
	if _on_NewGame_pressed():
		get_tree().change_scene('res://Scenes/Joc.tscn')
	else:
		get_tree().change_scene('res://Scenes/Joc.tscn')

func _on_NewGame_pressed():
	pass
