extends Node2D

var toMop = []
var moppable = load("res://scenes/moppable.tscn")
var numMoppable = randi_range(12,24)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var i = 0
	while (i < numMoppable):
		toMop.append(moppable.instantiate())
		toMop[i].connect("done", _on_moppable_done)
		add_child(toMop[i])
		i+=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if toMop.is_empty():
		print("Your did it!!! No more sleeping with the fishieses...")
		self.free()


func _on_moppable_done(moppable) -> void:
	moppable.queue_free()
	toMop.pop_back()
