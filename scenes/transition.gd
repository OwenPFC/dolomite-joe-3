extends AnimatedSprite2D
	
func fade_in():
	play("in")
	
func fade_out():
	play_backwards("in")
