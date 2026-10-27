extends Node2D

var customer = load("res://scenes/customer.tscn")
var curr_customer = null
var total = 0
signal sent(total)
var itemPrices = {"fish":10.88, "milk": 5.23, "cereal": 20.20, "tomato": 1.11, "chorba": 2.56, "rock": 101.01}

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
		total += itemPrices.get(area.get_parent().name)

func on_done():
	print(total)
	sent.emit(total)
	curr_customer.make_invis()
	curr_customer.init_customer()
	total = 0

func _on_bag_area_area_entered(area: Area2D) -> void:
	if area.get_parent() is Grocery:
		area.get_parent().queue_free()
	
