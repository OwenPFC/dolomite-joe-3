extends Node2D
var size = randf_range(0.25,0.35)
var splat = ["splat_geigerfish.png", "splat_tomato.png", "splat_water.png"]
signal done(moppable)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = Vector2(
		300+randi_range(-250,800),300+randi_range(-250,300)
		)
	$Sprite2D.texture = load("assets/floor/"+splat[randi_range(0,2)])
	scale.x = size
	scale.y = size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if scale.x <= 0:
		done.emit(self)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is draggable:
		scale.x -= 0.03
		scale.y -= 0.03
