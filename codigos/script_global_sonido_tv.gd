extends Node2D
onready var video = get_node("video_prueba")


func _ready():
	#video.paused = true
	pass

func activar_sonido():
	#$video_prueba.is_paused() 
	print("esta colisionando con el area de la tv")	
	
	
	
	
func desactivar_sonido():
	#$video_prueba.is_paused() 
	print("sali del area de colision de la tv")
	