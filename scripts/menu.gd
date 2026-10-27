extends Node2D

var day
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day = Global.dayCounter
	$Computer/start.text = "Day " + str(int(day))
	if day >= 6:
		$Computer/start.text = "No More"

func _on_start_pressed() -> void:
	$transition.fade_in()
	
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_reset_pressed() -> void:
	Global.initialize_data()
	Global.dayCounter = 1
	day = Global.dayCounter
	$Computer/start.text = "Day " + str(int(day))

func _on_credits_pressed() -> void:
	#See the dolomite joe 2 credits for ape search related queries
	#Jud - Art, Programming
	#Ev - Music, Programming
	#Ow - Programming, art(?)
	pass


func _on_transition_animation_finished() -> void:
	if day == 1 and !Global.get_information("cutscene"):
		get_tree().change_scene_to_file("res://scenes/intro.tscn")
	elif day == 6:
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/checkout.tscn")
