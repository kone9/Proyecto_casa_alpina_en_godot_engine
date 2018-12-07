extends Spatial


func _ready():
	var viewport = $Viewport_fuego

	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	$plano_de_fuego.material_override.albedo_texture = viewport.get_texture()

