extends Control

func _input(event):
	 nova_pausa()
	
func nova_pausa(): 
	if Input.is_action_just_pressed ("Pause"):
		var new_pause_state =not get_tree().paused
		get_tree().paused = new_pause_state
		visible= new_pause_state
		

func _on_Resume_pressed():
	nova_pausa()
	visible= not visible
	get_tree().paused = false 

func _on_Title_Screen_pressed():
	get_tree().change_scene('res://Scenes/Main Menu/Main Menu.tscn')
	get_tree().paused = false 

func _on_Options_pressed():
	get_tree().change_scene('res://Scenes/Cepeda.tscn')
	get_tree().paused = false 