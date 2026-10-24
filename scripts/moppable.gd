extends Node2D
var size = randf_range(0.7,1.3)
signal done(moppable)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = Vector2(
		300+randi_range(-200,600),300+randi_range(-200,300)
		)
	scale.x = size
	scale.y = size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if scale.x <= 0:
		done.emit(self)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is draggable:
		scale.x -= 0.05
		scale.y -= 0.05
