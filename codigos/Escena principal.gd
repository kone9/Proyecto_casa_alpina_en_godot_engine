extends Spatial


onready var television = $objetos_varios/televisor/pantalla_tv/Viewport/VideoPlayer


func _process(delta):
	
	var segundos_del_video = television.get_stream_position() #guardo en la variable el valor del minuto del video
	var esta_el_video_funcionando = television.is_playing() #es verdedaro si se reproduce el video,sino falso
	
	if esta_el_video_funcionando == false: #si el video no se reproduce
		television.play() #reproduce poner play al video

func _on_Area_sonido_interior_body_entered(body):
	if body.name == "personaje":
		
		#si estoy dentro del area de la casa uso el bus de audio interior
		$sonidos_ambiente/sonido_frente.reverb_bus_name = "interior"
		$sonidos_ambiente/sonido_izquierda.reverb_bus_name = "interior"
		$sonidos_ambiente/sonido_derecha.reverb_bus_name = "interior"
		$sonidos_ambiente/sonido_balcon.reverb_bus_name = "interior"
		$sonidos_ambiente/sonido_atras.reverb_bus_name = "interior"
		
		#si estoy dentro del area de la casa uso el bus de audio interior
		$sonidos_ambiente/sonido_frente/AudioStreamPlayer3D.bus = "interior"
		$sonidos_ambiente/sonido_izquierda/AudioStreamPlayer3D.bus = "interior"
		$sonidos_ambiente/sonido_derecha/AudioStreamPlayer3D.bus = "interior"
		$sonidos_ambiente/sonido_balcon/AudioStreamPlayer3D.bus = "interior"
		$sonidos_ambiente/sonido_atras/AudioStreamPlayer3D.bus = "interior"
		
		
		television.volume_db = -30 #si estoy dentro del area de la casa,subo el volumen del televisor
		

func _on_Area_sonido_interior_body_exited(body):
	if body.name == "personaje":
		
		#si sali fuera del area de la casa uso el bus de audio exterior.
		#Nota:primero tengo que entrar
		$sonidos_ambiente/sonido_frente.reverb_bus_name = "sonido_campo"
		$sonidos_ambiente/sonido_izquierda.reverb_bus_name = "sonido_campo"
		$sonidos_ambiente/sonido_derecha.reverb_bus_name = "sonido_campo"
		$sonidos_ambiente/sonido_balcon.reverb_bus_name = "sonido_campo"
		$sonidos_ambiente/sonido_atras.reverb_bus_name = "sonido_campo"
		
		#si sali fuera del area de la casa uso el bus de audio exterior.
		#Nota:primero tengo que entrar
		$sonidos_ambiente/sonido_frente/AudioStreamPlayer3D.bus = "sonido_campo"
		$sonidos_ambiente/sonido_izquierda/AudioStreamPlayer3D.bus = "sonido_campo"
		$sonidos_ambiente/sonido_derecha/AudioStreamPlayer3D.bus = "sonido_campo"
		$sonidos_ambiente/sonido_balcon/AudioStreamPlayer3D.bus = "sonido_campo"
		$sonidos_ambiente/sonido_atras/AudioStreamPlayer3D.bus = "sonido_campo"
		
		


func _on_sonido_frente_body_entered(body):
	if body.name == "personaje":
		television.volume_db = -60 # si estoy en el area afuera de la casa bajo el volumen del televisor
		

func _on_sonido_derecha_body_entered(body):
	if body.name == "personaje":
		television.volume_db = -60 # si estoy en el area afuera de la casa bajo el volumen del televisor


func _on_sonido_izquierda_body_entered(body):
	if body.name == "personaje":
		television.volume_db = -60 # si estoy en el area afuera de la casa bajo el volumen del televisor


func _on_sonido_atras_body_entered(body):
	if body.name == "personaje":
		television.volume_db = -60 # si estoy en el area afuera de la casa bajo el volumen del televisor


func _on_sonido_balcon_body_entered(body):
	if body.name == "personaje":
		television.volume_db = -60 # si estoy en el area afuera de la casa bajo el volumen del televisor


func _on_Area_sonido_Segundo_piso_body_entered(body):
	television.volume_db = -50
		
	# si estoy en el area segundo piso de la casa bajo el volumen del televisor
	$sonidos_ambiente/sonido_frente.reverb_bus_name = "interior"
	$sonidos_ambiente/sonido_izquierda.reverb_bus_name = "interior"
	$sonidos_ambiente/sonido_derecha.reverb_bus_name = "interior"
	$sonidos_ambiente/sonido_balcon.reverb_bus_name = "interior"
	$sonidos_ambiente/sonido_atras.reverb_bus_name = "interior"
	
	#si estoy dentro del area de la casa uso el bus de audio interior
	$sonidos_ambiente/sonido_frente/AudioStreamPlayer3D.bus = "interior"
	$sonidos_ambiente/sonido_izquierda/AudioStreamPlayer3D.bus = "interior"
	$sonidos_ambiente/sonido_derecha/AudioStreamPlayer3D.bus = "interior"
	$sonidos_ambiente/sonido_balcon/AudioStreamPlayer3D.bus = "interior"
	$sonidos_ambiente/sonido_atras/AudioStreamPlayer3D.bus = "interior"