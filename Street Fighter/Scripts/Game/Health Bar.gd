extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func update_health(health):
	$TextureProgress.value = health
	
	
#var health = 100                                            això és la variable vida del character
#health -= 10                                                  això és per la funció hit del personatge
#get_parent().get_node("Health Bar").update_health(health)     això és per la funció hit del personatge
