extends draggable

func get_height():
	return $Sprite2D.texture.get_height()*$Sprite2D.scale.y

func get_width():
	return $Sprite2D.texture.get_width()*$Sprite2D.scale.x

func set_sprite(image):
	$Sprite2D.texture = load(image)
