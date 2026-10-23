extends Node2D

var toMop = []
var moppable = load("res://scenes/moppable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toMop.append(moppable.instantiate())
	toMop.append(load("res://scenes/moppable.tscn").instantiate())
	toMop.append(load("res://scenes/moppable.tscn").instantiate())
	for mopp in toMop:
		mopp.connect("done", _on_moppable_done)
		add_child(mopp)
	print(toMop)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_moppable_done(moppable) -> void:
	print("oooo wweee oo i look just like buddy holly")
	moppable.queue_free()
