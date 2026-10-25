extends Node2D

var customer = load("res://scenes/customer.tscn")
var curr_customer = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curr_customer = customer.instantiate()
	curr_customer.connect("done", on_done)
	get_parent().add_child.call_deferred(curr_customer)
	curr_customer.position.x = 825
	curr_customer.position.y = 339

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Grocery:
		$AudioStreamPlayer.play()
		area.get_parent().scanned = true
		

func on_done():
	curr_customer.make_invis()
	curr_customer.init_customer()

func _on_bag_area_area_entered(area: Area2D) -> void:
	if area.get_parent() is Grocery:
		area.get_parent().queue_free()
	
