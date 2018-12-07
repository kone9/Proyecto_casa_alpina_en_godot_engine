extends RichTextLabel

#var dialogo =["Hola soy Gochi este es un proyecto de arquitectura visualización con Godot engine espero que te guste este recorrido"] 
var letras_visibles = 0

	
func _process(delta):
	set_visible_characters(letras_visibles)


func _on_Timer_texto_timeout():
	if letras_visibles < 500:
		letras_visibles = letras_visibles + 1
	