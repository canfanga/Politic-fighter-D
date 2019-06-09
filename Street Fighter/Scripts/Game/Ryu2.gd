extends KinematicBody2D

var velocitat = Vector2()
export var gravetat = Vector2(0,10.8)
var velocitat_maxima = 200
var saltar = Vector2(0,-550)
var pegant = false
var pot_disparar = true
var mirant_dreta = true
var escena_bola = preload("res://Scenes/Game/Extras/KamiKami2.tscn")
var thing = preload("res://Scenes/Game/Extras/Punch - Kick.tscn")
var health = 100

func _ready():
	pass

func _process(delta):
	mou()
	anima()
	death()

func mou():
	#posar += si es vol que les dos tecles vagin a lhora i vagi en diagonal
	velocitat.x = 0
	if Input.is_action_pressed('ui_right') and not Input.is_action_pressed('ui_select'):
		velocitat.x = velocitat_maxima
	if Input.is_action_pressed('ui_left') and not Input.is_action_pressed('ui_select'):
		velocitat.x = -velocitat_maxima
	if Input.is_action_pressed('ui_up') and is_on_floor():
		velocitat += saltar
	if not is_on_floor():
		velocitat += gravetat
	if not pegant:
		velocitat = move_and_slide(velocitat,Vector2(0,-1))

func anima():

	if Input.is_action_pressed("voltereta"):
		if velocitat.y < 0:
			$AnimatedSprite.animation = 'voltereta_amunt'
		if velocitat.y > 0:
			$AnimatedSprite.animation = "voltereta_avall"
		if $RayCast2D.is_colliding():
			$AnimatedSprite.animation = "acaba_voltereta"	
	elif velocitat.y != 0:
		if velocitat.y < 0:
			$AnimatedSprite.animation = 'puja_salt'
		if velocitat.y > 12:
			$AnimatedSprite.animation = "baixa_salt"
		if $RayCast2D.is_colliding():
			$AnimatedSprite.animation = "acaba_salt"

	if velocitat.x < 0:
		$AnimatedSprite.flip_h = false
		$CollisionShape2D.scale.x = 1
		mirant_dreta = true
	if velocitat.x > 0:
		$AnimatedSprite.flip_h = true
		$CollisionShape2D.scale.x = -1
		
		mirant_dreta = false

	if not pegant:
		if velocitat.x < 0 and is_on_floor():
			$AnimatedSprite.animation = "camina"
		elif velocitat.x > 0 and is_on_floor():
			$AnimatedSprite.animation = "camina"
		elif velocitat.x == 0 and is_on_floor():
#			$AnimatedSprite.animation = "quiet"
			$AnimationPlayer.play("quiet")
			
	if Input.is_action_pressed("ui_select") and is_on_floor():
		$AnimationPlayer.play("pega_esq")
		pegant = true
	

	#elif Input.is_action_pressed("pega_dreta") and is_on_floor():
#	#	$AnimatedSprite.animation = "pega_esq"
	#	$AnimationPlayer.play("pega_dret")
	#	pegant = true

	if Input.is_action_pressed("patada") and is_on_floor():
#		$AnimatedSprite.animation = "patada"
		$AnimationPlayer.play("patada")
		pegant = true
	

	#if Input.is_action_pressed("patada_forta") and is_on_floor():
	#	$AnimatedSprite.animation = "patada_forta"
	#	pegant = true

	if pot_disparar:
		if Input.is_action_pressed("KamiKami") and is_on_floor():
			pegant = true
			$AnimatedSprite.animation = "kamikami"

	print($AnimatedSprite.animation)

func kamikami(mirant_dreta):
	pot_disparar = false
	if mirant_dreta == true:
		crea_bala($Position_dreta.global_position)
	else:
		crea_bala($Position_esquerra.global_position)
	$Timer.start()

func crea_bala(posicio):
	var bola_foc = escena_bola.instance()
	bola_foc.position = posicio
	if  mirant_dreta:
		bola_foc.velocitat_bola *= -1
		bola_foc.velocitat_rotacio *= -1
		bola_foc.get_node('Sprite').flip_h = true

	get_tree().get_root().get_node("Joc/Bola").add_child(bola_foc)

func _on_AnimatedSprite_animation_finished():
	pegant = false
	if $AnimatedSprite.animation == 'kamikami':
		kamikami(mirant_dreta)
	#if $AnimationPlayer.is_playing("pega_esq"):
	

func _on_Timer_timeout():
	pot_disparar = true
	
func hit():
	health -= 25
	get_parent().get_node("Health Bar 2").update_health(health)

func hit2():
	health -= 25
	get_parent().get_node("Health Bar 2").update_health(health)

func death():
	if health <= 0:
		get_tree().change_scene("res://Scenes/Game Over.tscn")
		
	
