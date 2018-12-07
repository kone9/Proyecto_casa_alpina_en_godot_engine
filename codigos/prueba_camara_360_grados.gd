extends KinematicBody

var angulo_de_camara = 0
var mover_camara = Vector2() 
var sensibilidad_del_mouse = 0.1


func _ready():
	set_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)#hace que desaparesca el mouse importante para el movimiento de la camara

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _input(event):
	var camara = $cabeza_escena_principal/camara_escena_principal
	var cabeza = $cabeza_escena_principal
	
	if (event is InputEventMouseMotion):
		cabeza.rotate_y(deg2rad(-event.relative.x * sensibilidad_del_mouse))
		print("tendria que moverse la camara")
		
		var cambiar =-event.relative.y * sensibilidad_del_mouse
		if cambiar + angulo_de_camara < 90 and cambiar + angulo_de_camara >-90:
			camara.rotate_x(deg2rad(cambiar))
			angulo_de_camara += cambiar 


func _physics_process(delta):
	#var mover_cabeza = camara.get_global_transform().basis
	pass





	
	
"""func _input(event):
	if (event is InputEventMouseMotion):
		mover_camara = event.relative
		

func mover_camara(delta):
	var camara = $cabeza_escena_principal/camara_escena_principal
	var cabeza = $cabeza_escena_principal
	
	if (mover_camara.length() > 0):
		cabeza.rotate_y(deg2rad(-camara.x * sensibilidad_del_mouse))

		var mover = -camara.y * sensibilidad_del_mouse
		if (mover + mover_camara < 90) and (mover + mover_camara > -90):
			camara.rotate_x(deg(mover))
			mover_camara += mover
		mover_camara = Vector2()"""

