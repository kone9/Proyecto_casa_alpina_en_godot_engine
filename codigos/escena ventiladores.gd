extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var animaciones_ventilador = get_node("AnimationTreePlayer")

func _ready():
	animaciones_ventilador.set_active(true)
	animaciones_ventilador.ANIMATION_PROCESS_IDLE #con esto ponemos play a las animacion cuando se ejecuta el juego
	
	
