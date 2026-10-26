extends Node2D

var floor = load("res://scenes/floor.tscn")
var day = 1
var joe_text = ["Hey there bub. Cleanup on aisle 5.", "This place is filthy. Do I need to call your manager?", 
"You're not gonna believe what I just did back there.", "I think you dropped something", "I think I dropped something.",
"My rock sty is cleaner than this place.", "They should really replace you people with robots. It'd be so much more efficient.",
"You call this customer service? You make me sick.", "Hey are you gonna do your job or what? They pay you right?", 
"So you can pick up a check but you can't buy my game?"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
extends Node

var register_total = load("res://scenes/register_total.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$register.connect("sent", _on_total_tallied)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_joe():
	$speech.set_text(pick_joe_text())
	$speech/clean.visible = true

func on_add_customer(text):
	print(text)
	$speech.set_text(text[day-1])
	$speech/clean.visible = false

func pick_joe_text():
	var t = joe_text.pick_random()
	joe_text.remove_at(joe_text.find(t))
	return t

func new_day():
	#Reset joe dialogue
	#Hopefully we don't need to reset if we can get to 21 or 22 speeches
	pass

func _on_clean_pressed() -> void:
	var f = floor.instantiate()
	f.connect("mop_done", on_mop_done)
	add_child(f)

func on_mop_done():
	print("hey guys")
	$speech/clean.visible = false
	if get_node("Customer") != null:
		get_node("Customer").done.emit()
func _on_total_tallied(total) -> void:
	register_total.instantiate()
	register_total.total = total
