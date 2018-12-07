extends KinematicBody

export var speed = 400
export var gravedad = -1500
export var vel_salto= 500
var distancia = Vector3()
var velocidad = Vector3()

func _ready():
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	#mover izquierda derecha
	var mover_x= -int(Input.is_action_pressed("mover_izquierda")) +int(Input.is_action_pressed("mover_derecha"))
	distancia.x = speed * delta
	velocidad.x = (mover_x * distancia.x) / delta 
	
	#mover adelante o atras
	var mover_z= -int(Input.is_action_pressed("mover_adelante")) +int(Input.is_action_pressed("mover_atras"))
	distancia.z = speed * delta
	velocidad.z = (mover_z * distancia.z) / delta 
	
	#gravedad
	velocidad.y = gravedad * delta
	
	print (velocidad.y)
	move_and_slide(velocidad,Vector3(0,-1,0))
	
	#comprobar si estoy en el piso
	if is_on_floor():
		print("estoy en el piso")
		velocidad.y = 0
		if Input.is_action_pressed("barra_espaciadora"):
			velocidad.y = - vel_salto
			print(vel_salto)

"""-------------------------------------------------------------------------------------------------------------------------------"""
	
onready var cubo = self;
onready var ThePlayer = get_parent();
var Pitch = 0.0;
var Yaw = 0.0;
export var MouseSensitivity = 0.4;

func _input(event):
	if(event is InputEventMouseMotion):
		Yaw = fmod(Yaw - event.relative.x * MouseSensitivity, 360.0);
		Pitch = clamp(Pitch - event.relative.y * MouseSensitivity, -89.0, 89.0);
	DzUpdateCamera();

func DzUpdateCamera():
	cubo.rotation.x = deg2rad(Pitch);
	cubo.rotation.y = deg2rad(Yaw)

	
func DzGetCameraDirection():
	return cubo.global_transform.basis;
	
	