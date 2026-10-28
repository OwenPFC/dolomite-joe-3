extends Node2D

signal fail

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = $Timer.time_left
	time = snapped(time, 0.01)
	if $display.visible:
		$display/number.text = str(time)
	elif $display_floor.visible:
		$display_floor/number.text = str(time)

func reset():
	visible = true
	$Timer.paused = false
	$Timer.start()

func joe_timer():
	visible = false
	$Timer.paused = true

func set_register():
	$Timer.wait_time = 30
	$display.visible = true
	$display_floor.visible = false
	reset()

func set_floor():
	$Timer.wait_time = 20
	$display_floor.visible = true
	$display.visible = false
	reset()

func _on_timer_timeout() -> void:
	fail.emit()
