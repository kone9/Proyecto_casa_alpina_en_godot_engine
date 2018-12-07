extends Spatial





#<---------------------------------------------------------------------------->
#variables globales se usan para comprobar estados,se reutilizan para no escribir tanto codigo y ahorrar recursos
var abierta_hacia_afuera = false
var abierta_hacia_adentro = false
var activar_cerrar = false


#<---------------------------------------------------------------------------->

#esto abre y cierra la puerta principal
func _on_Area_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("ADENTRO_principal")
		$sonidos_puertas/abrir_puerta_grande.play() #activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_adentro/CollisionShape.disabled = true
		$Area_hacia_afuera/CollisionShape.disabled = true
	
		
		#variables globales
		abierta_hacia_adentro = true
		abierta_hacia_afuera = false
		activar_cerrar = true
		
		
		
			
func _on_Area_hacia_adentro_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("AFUERA_principal")
		$sonidos_puertas/abrir_puerta_grande.play() #activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_adentro/CollisionShape.disabled = true
		$Area_hacia_afuera/CollisionShape.disabled = true
		
		#variables globales
		abierta_hacia_adentro = false
		abierta_hacia_afuera = true
		activar_cerrar = true
		
		
		
func _on_Area_cerrar_automatico_body_exited(body):
	if body.name == "personaje":
		if abierta_hacia_adentro == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("ADENTRO_principal")
			$sonidos_puertas/abrir_puerta_grande.play() #activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente

		if abierta_hacia_afuera == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("AFUERA_principal")
			$sonidos_puertas/abrir_puerta_grande.play() #activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		
		activar_cerrar = false #variables global
		$Area_hacia_adentro/CollisionShape.disabled = false
		$Area_hacia_afuera/CollisionShape.disabled = false
		
		

#<---------------------------------------------------------------------------->

#esto abre y cierra la puerta tracera
func _on_Area_hacia_afuera_tracera_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("TRACERA_adentro")
		$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_afuera_tracera/CollisionShape.disabled = true
		$Area_hacia_adentro_tracera/CollisionShape.disabled = true
		
		#variables globales
		abierta_hacia_adentro = true
		abierta_hacia_afuera = false
		activar_cerrar = true

func _on_Area_hacia_adentro_tracera_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("TRACERA_afuera")
		$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_afuera_tracera/CollisionShape.disabled = true
		$Area_hacia_adentro_tracera/CollisionShape.disabled = true
		
		#variables globales
		abierta_hacia_adentro = false
		abierta_hacia_afuera = true
		activar_cerrar = true
		
		

		
func _on_Area_cerrar_automatico_tracera_body_exited(body):
	if body.name == "personaje":
		if abierta_hacia_adentro == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("TRACERA_adentro")
			$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		if abierta_hacia_afuera == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("TRACERA_afuera")
			$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		
		activar_cerrar = false #variables global
		$Area_hacia_afuera_tracera/CollisionShape.disabled = false
		$Area_hacia_adentro_tracera/CollisionShape.disabled = false
		
		
#<---------------------------------------------------------------------------->

#esto abre y cierra la puerta de la terraza
func _on_Area_hacia_adentro_terraza_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("TERRAZA_adentro")
		$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_afuera_terraza/CollisionShape.disabled = true
		$Area_hacia_adentro_terraza/CollisionShape.disabled = true
		
		#variables globales
		abierta_hacia_adentro = false
		abierta_hacia_afuera = true
		activar_cerrar = true
		
	

func _on_Area_hacia_afuera_terraza_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("TERRAZA_afuera")
		$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_afuera_terraza/CollisionShape.disabled = true
		$Area_hacia_adentro_terraza/CollisionShape.disabled = true
		
		#variables globales
		abierta_hacia_adentro = true
		abierta_hacia_afuera = false
		activar_cerrar = true


func _on_Area_cerrar_automatico_terraza_body_exited(body):
	if body.name == "personaje":
		if abierta_hacia_adentro == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("TERRAZA_afuera")
			$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		if abierta_hacia_afuera == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("TERRAZA_adentro")
			$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		
		activar_cerrar = false #variables global
		$Area_hacia_afuera_terraza/CollisionShape.disabled = false
		$Area_hacia_adentro_terraza/CollisionShape.disabled = false
		

#<---------------------------------------------------------------------------->

#esto abre y cierra la puerta del baño
func _on_Area_hacia_adentro_toilet_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("TOILET_adentro")
		$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_afuera_toilet/CollisionShape.disabled = true
		$Area_hacia_adentro_toilet/CollisionShape.disabled = true
		
		#variables globales
		abierta_hacia_adentro = false
		abierta_hacia_afuera = true
		activar_cerrar = true


func _on_Area_hacia_afuera_toilet_body_entered(body):
	if body.name == "personaje":
		$AnimationPlayer.play("TOILET_afuera")
		$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		$Area_hacia_afuera_toilet/CollisionShape.disabled = true
		$Area_hacia_adentro_toilet/CollisionShape.disabled = true
		
		#variables globales
		abierta_hacia_adentro = true
		abierta_hacia_afuera = false
		activar_cerrar = true


func _on_Area_cerrar_automatico_toilet_body_exited(body):
	if body.name == "personaje":
		if abierta_hacia_adentro == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("TOILET_afuera")
			$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		if abierta_hacia_afuera == true and activar_cerrar == true:
			$AnimationPlayer.play_backwards("TOILET_adentro")
			$sonidos_puertas/abrir_puerta_chica.play()#activar sonido puerta...Por algún motivo tengo que usar wav si uso ogg se reproduce constantemente
		
		activar_cerrar = false #variables global
		$Area_hacia_afuera_toilet/CollisionShape.disabled = false
		$Area_hacia_adentro_toilet/CollisionShape.disabled = false
		



