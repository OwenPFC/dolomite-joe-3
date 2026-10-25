extends Node2D

var dialogue = []
var all_items = ["fish", "milk", "cereal"]
var customers = ["meat", "blue", "kid"]
var grocery = load("res://scenes/grocery_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_customer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#append random elements to the shoppers things to buy
func init_items():
	var offset_x = 0
	for i in range(randi_range(10, 20)):
		var item = grocery.instantiate()
		$groceries.add_child(item)
		if item.global_position.x+offset_x < 1000:
			item.global_position.x += offset_x
			offset_x += item.get_width()
		else:
			offset_x = 0
			item.global_position.x += offset_x
			offset_x += item.get_width()
		var type = all_items[randi_range(0, len(all_items)-1)]
		var sprite = "res://assets/groceries/" + type + ".png"
		item.set_sprite(sprite)

func init_customer():
	var customer = customers.pick_random()
	var customer_info = get_information(customer)
	print(customer_info)
	init_items()
	get_node(customer).visible = true
	
	
func get_information(name:String):
	var file = FileAccess.open("res://assets/customers.json", FileAccess.READ)
	var json = file.get_as_text()
	var data = JSON.parse_string(json)
	file.close()
	return data[name]
