extends Node2D

signal night_end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.dayCounter+=1
	Global.save_information("day", Global.dayCounter)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		


func _on_timer_timeout() -> void:
	if  Global.dayCounter == 6:
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
	night_end.emit()
	get_tree().change_scene_to_file("res://scenes/checkout.tscn")
