extends MeshInstance




func _on_Area_body_entered(body):
	if body.name == "StairCatcher":
		print ("colisiona el rayo de personaje con el area de la escalera")
