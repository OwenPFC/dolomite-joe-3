extends Node2D
var size = randf_range(1,1.5)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale.x = size
	scale.y = size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if scale.x <= 0:
		print("small")
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is draggable:
		print("decrementing")
		var remove = randf_range(0.1,0.2);
		scale.x -= remove
		scale.y -= remove
