extends Node

var register_total = load("res://scenes/register_total.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$register.connect("sent", _on_total_tallied)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_total_tallied(total) -> void:
	register_total.instantiate()
	register_total.total = total
