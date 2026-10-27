extends Node2D

var changed = false
var fadein = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$transition.fade_out()
	$VideoStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $VideoStreamPlayer.is_playing():
		var current_time = $VideoStreamPlayer.stream_position
		if current_time == 52.0 and !changed:
			$VideoStreamPlayer.volume_db += 8
			changed = true


func _on_video_stream_player_finished() -> void:
	fadein = true
	$transition.fade_in()


func _on_timer_timeout() -> void:
	Global.save_information("cutscene", true)
	get_tree().change_scene_to_file("res://scenes/checkout.tscn")


func _on_transition_animation_finished() -> void:
	if fadein:
		$Timer.start()
	else:
		pass
