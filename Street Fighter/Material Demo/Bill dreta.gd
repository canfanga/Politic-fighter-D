extends Area2D
var velocitat = 500



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += Vector2(velocitat, 0) * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	mor()

		
func mor():
	queue_free()




func _on_Bill_body_entered(body):
	if body.has_method('hit'):
		body.hit()
		mor()
