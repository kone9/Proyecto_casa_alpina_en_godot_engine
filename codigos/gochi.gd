extends Spatial
var puede_caminar = false


func _ready():
	pass # Replace with function body.


func _on_area_hablar_body_entered(body): #si entra al area de gochi
	if body.name == "personaje": #si el nombre del nodo es personaje 
		$".".rotation_degrees.y = get_tree().get_nodes_in_group("personaje")[0].rotation_degrees.y - 10 #rotacion en el eje "Y" es igual a la rotacion del personaje - 10 para
		$AnimationTreePlayer.blend2_node_set_amount("transicion_estatico",1.0) #activo el arbol de animación mensaje
		get_tree().get_nodes_in_group("bienvenida")[0].visible = true #es visible el mensaje

		
func _on_area_hablar_body_exited(body):  #si entra al area de gochi
	if body.name == "personaje": #si el nombre del nodo es personaje 
		get_tree().get_nodes_in_group("bienvenida")[0].visible = false #NO es visible el mensaje
		$AnimationTreePlayer.blend2_node_set_amount("transicion_estatico",0) #activo el arbol de animación estatico

