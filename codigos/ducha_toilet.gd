extends Spatial

onready var agua =$agua_ducha
onready var abrir_canilla=$AnimationPlayer
var area_canilla = false
var estado_canilla_abierta = false

func _ready():
	set_process(true)

func _process(delta):
	if Input.is_action_just_pressed("click_izquierdo") and area_canilla == true and estado_canilla_abierta == false:
		print("abrir canilla")
		agua.emitting = true
		abrir_canilla.play("Canilla_TOILET")
		estado_canilla_abierta = true
	
	elif Input.is_action_just_pressed("click_izquierdo") and area_canilla == true and estado_canilla_abierta == true:
		agua.emitting = false
		abrir_canilla.play_backwards("Canilla_TOILET")
		estado_canilla_abierta = false

func _on_ducha_toilet_collision_body_entered(body):
	if body.name == "personaje":
		area_canilla = true
		
func _on_ducha_toilet_collision_body_exited(body):
	if body.name == "personaje":
		area_canilla = false

		


