extends KinematicBody

var activar_area_escalera = false
var angulo_de_camara = 0
#var mouse_sensivity = 0.2
var camara_change = Vector2()

onready var camara = get_node("cabeza_escena_principal/camara_escena_principal")
onready var cabeza = get_node("cabeza_escena_principal")
onready var rayo_para_ver_colisiones = get_node("StairCatcher")

var velocity = Vector3()
var direccion = Vector3()

#volar variables
const FLY_SPEED = 100
const FLY_ACELL = 10

#caminar variables
var gravity= -30 * 7
const MAX_SPEED = 100
const MAX_RUNNING_SPEED = 200 
const ACCEL = 10
const DESACCEL = 15

#saltar variables
var jump_height = 150

#mover la camara versión 2
var Pitch = 0.0;
var Yaw = 0.0;
var MouseSensitivity = 0.2;

#escalera variables
const MAX_STAIR_SLOPE = 20
const STAIR_JUMP_HEIGHT = 6


func _input(event):
	if (event is InputEventMouseMotion):
		Yaw = fmod(Yaw - event.relative.x * MouseSensitivity, 360.0);
		Pitch = clamp(Pitch - event.relative.y * MouseSensitivity, -90, 180);
		DzUpdateCamera();
		$StairCatcher.rotation_degrees.y = cabeza.rotation_degrees.y
		#print($StairCatcher.rotation_degrees.y)
		#print(camara.rotation_degrees.y)
		#print(cabeza.rotation_degrees.y)

func DzUpdateCamera():
	cabeza.rotation.x = deg2rad(Pitch);
	cabeza.rotation.y = deg2rad(Yaw)
		
		
func _ready():
	set_physics_process(true)
	set_process_input(true)	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #hace que desaparesca el mouse,importante para el movimiento de la camara
	
	
		
func _process(delta):
	#salir del juego
	if Input.is_action_just_pressed("salir"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().quit()
	#reiniciar reiniciar
	if Input.is_action_just_pressed("reiniciar"):
		get_tree().reload_current_scene()
	

func _physics_process(delta):
	caminar(delta)
	
	
	

func caminar(delta):
	direccion = Vector3()
	

	#controladores
	if Input.is_action_pressed("mover_adelante"):
		direccion -= direccion_de_camara().z
	if Input.is_action_pressed("mover_atras"):
		direccion += direccion_de_camara().z
	if Input.is_action_pressed("mover_derecha"):
		direccion += direccion_de_camara().x
	if Input.is_action_pressed("mover_izquierda"):
		direccion -= direccion_de_camara().x
		
	direccion = direccion.normalized()
	
	#gravedad
	velocity.y += gravity * delta
	var temp_velocity = velocity
	temp_velocity.y = 0
	#print (velocity.y)
	
	
	#correr
	var speed
	if Input.is_action_pressed("correr"):
		speed = MAX_RUNNING_SPEED
	else:
		speed = MAX_SPEED
	
	#aceleracion
	var targed = direccion * speed
	var acceleration
	if direccion.dot(temp_velocity) > 0:
		acceleration = ACCEL
		
	else:
		acceleration = DESACCEL 
	
	#me imagino que es para que se deslise en el piso
	temp_velocity = temp_velocity.linear_interpolate(targed,acceleration * delta )
	velocity.x = temp_velocity.x
	velocity.z = temp_velocity.z
	
	move_and_slide(velocity,Vector3(0, 1, 0 ))
	
	#saltar
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_just_pressed("saltar"):
			velocity.y = jump_height
	
	#subir escalera funciona no borrar luego activar
	rayo_para_ver_colisiones.translation.x = direccion.x
	rayo_para_ver_colisiones.translation.z = direccion.z
	if rayo_para_ver_colisiones.is_colliding() and Input.is_action_pressed("mover_adelante"):
		#print ("estoy dentro del if de colision esta colisionando el rayo con la escalera")
		velocity.y = 60 
		velocity.x = -400

func direccion_de_camara():
	return camara.global_transform.basis

	
	

		
#funcion volar,no la uso para este proyecto,pero igualmente la guardo por las dudas	
func volar(delta):
	direccion = Vector3()
	
	#controladores
	if Input.is_action_pressed("mover_adelante"):
		direccion -= direccion_de_camara().z
	if Input.is_action_pressed("mover_atras"):
		direccion += direccion_de_camara().z 
	if Input.is_action_pressed("mover_derecha"):
		direccion += direccion_de_camara().x 
	if Input.is_action_pressed("mover_izquierda"):
		direccion -= direccion_de_camara().x 
		
	direccion = direccion.normalized()
	var targed = direccion * FLY_SPEED
	velocity = velocity.linear_interpolate(targed,FLY_ACELL * delta )
	move_and_slide(velocity)		



