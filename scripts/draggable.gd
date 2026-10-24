extends Area2D
class_name draggable

var mousein = false
var dragging = false
var scanned = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(mousein)
	if mousein and Input.is_action_pressed("click"):
		print("dragging")
		dragging = true
	else:
		dragging = false
	if dragging:
		global_position = get_global_mouse_position()

func _on_mouse_entered() -> void:
	if !Input.is_action_pressed("click"):
		mousein=true

func _on_mouse_exited() -> void:
	if !Input.is_action_pressed("click"):
		mousein=false
