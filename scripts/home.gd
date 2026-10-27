extends Node2D

signal night_end
var fadein = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.dayCounter+=1
	var day = Global.dayCounter
	Global.save_information("day", Global.dayCounter)
	$transition.fade_out()
	if day == 2:
		$VideoStreamPlayer.stream = load("res://assets/videos/monkey.mp4")
	elif day == 3:
		$VideoStreamPlayer.stream = load("res://assets/videos/drive.mp4")
	elif day == 4:
		$VideoStreamPlayer.stream = load("res://assets/videos/bush.mp4")
	elif day == 5:
		$VideoStreamPlayer.stream = load("res://assets/videos/canadian2.mp4")
	elif day == 6:
		$VideoStreamPlayer.stream = load("res://assets/videos/bike.mp4")
	$VideoStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		


func _on_timer_timeout() -> void:
	$transition.fade_in()
	fadein = true

func _on_transition_animation_finished() -> void:
	if fadein:
		if  Global.dayCounter == 6:
			get_tree().change_scene_to_file("res://scenes/ending.tscn")
		else:
			night_end.emit()
			get_tree().change_scene_to_file("res://scenes/checkout.tscn")
