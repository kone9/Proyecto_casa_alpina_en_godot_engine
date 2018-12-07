extends Spatial

#importante que escribas esto para que funcione

func _ready():
	var viewport = $Viewport
	viewport.set_clear_mode(viewport.CLEAR_MODE_ONLY_NEXT_FRAME)

	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")

	$pantalla_de_tv.material_override.albedo_texture = viewport.get_texture()
	








