extends KinematicBody2D

var pot_disparar = true
var escena_bill_dreta = preload("res://Material Demo/Bill dreta.tscn")
var escena_bill_esquerra = preload("res://Material Demo/Bill esquerra.tscn")
var temps_espera = 2
var timer
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(temps_espera)
	timer.connect('timeout',self,'on_timeoute_complete')
	add_child(timer)
	
func _physics_process(delta):
	if pot_disparar:
		dispara()
	if Input.is_action_pressed("Enter"):
			position = Vector2(630,580)

func dispara():
	pot_disparar = false
	crea_bala_dreta($Dreta.global_position)
	crea_bala_esquerra($Esquerra.global_position)
	timer.start()
	#if pot_disparar:
		#$AudioStreamPlayer.play()
	
	
func crea_bala_dreta(posicio):
	var nou_bill = escena_bill_dreta.instance()
	nou_bill.position = posicio
	get_parent().add_child(nou_bill)

func crea_bala_esquerra(posicio):
	var nou_bill = escena_bill_esquerra.instance()
	nou_bill.position = posicio
	get_parent().add_child(nou_bill)
		
func on_timeoute_complete():
	pot_disparar = true
	
	
