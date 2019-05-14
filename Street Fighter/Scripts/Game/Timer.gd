extends RichTextLabel
var s = 60
func _ready():
	pass
func _process(delta):
	if s == 0:
		get_tree().change_scene('res://Scenes/Game Over.tscn')
		
	set_text(str(s))



func _on_Timer_timeout():
	s -= 1