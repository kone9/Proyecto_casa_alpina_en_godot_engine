extends Spatial

onready var agua = $agua_canilla_cosina
onready var animacion_canilla = $AnimationPlayer
var area_canilla = false
var tiempo_terminado = false
var estado_canilla_abierta = false

func _ready():
	set_process(true)

func _process(delta):
	#var frame_actual_animacion = animacion_canilla.get_current_animation_length()

	if Input.is_action_just_pressed("click_izquierdo") and area_canilla == true and estado_canilla_abierta == false:
		print("tendria que prenderse la canilla")
		animacion_canilla.play("Action")
		agua.emitting = true
		estado_canilla_abierta = true
		
	
	elif Input.is_action_just_pressed("click_izquierdo") and area_canilla == true and estado_canilla_abierta == true:
		#prender_canilla = true
		print("tendria que apagarse la canilla")
		animacion_canilla.play_backwards("Action")
		agua.emitting = false
		estado_canilla_abierta = false
	
	
"""func _input(event):
	if event is InputEventMouseButton and estado_canilla_abierta == false and area_canilla == true:
		if event.pressed and event.button_index == 1:
			print("se esta presionando click izquierdo y tendria que prenderse la canilla")
			animacion_canilla.play("Action")
			agua.emitting = true
			estado_canilla_abierta = true
			
		
	if event is InputEventMouseButton and estado_canilla_abierta == true and area_canilla == true:
		if event.pressed and event.button_index == 1:
			print("se esta presionando click izquierdo y tendria que apagarse la canilla")
			animacion_canilla.play_backwards("Action")
			agua.emitting = false
			estado_canilla_abierta = false"""
	

func _on_canilla_collision_body_entered(body):
	if body.name == "personaje":
		area_canilla  = true
		print("area para prender canilla activada")


func _on_canilla_collision_body_exited(body):
	if body.name == "personaje":
		area_canilla  = false
		print("area para prender canilla desactivada")


	


		
	
		
	
	
		





