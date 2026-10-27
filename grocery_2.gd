extends Node2D
class_name Grocery

var dragging = false
var scanned = false
var grocery_name = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position()

func _on_button_button_up() -> void:
	dragging = false

func _on_button_button_down() -> void:
	dragging = true
	
func get_height():
	return $Button.icon.get_height()*$Button.scale.y

func get_width():
	return $Button.icon.get_width()*$Button.scale.x

func set_sprite(image):
	$Button.icon = load(image)
