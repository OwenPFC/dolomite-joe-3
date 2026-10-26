extends Node2D

var dialogue = []
var all_items = ["fish", "milk", "cereal", "tomato", "chorba", "rock"]
var customers = ["meat", "blue", "kid", "purple", "cart", "joe"]
var grocery = load("res://scenes/grocery_2.tscn")
signal done
signal joe
signal add_customer(text)
var customer
var times_joe_seen = 0
var day = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent() != null:
		if !is_connected("joe", get_parent().on_joe):
			connect("joe", get_parent().on_joe)
		if !is_connected("add_customer", get_parent().on_add_customer):
			connect("add_customer", get_parent().on_add_customer)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len($groceries.get_children()) == 0 and customer != "joe":
		done.emit()

func new_day():
	get_tree().change_scene_to_file("res://scenes/home.tscn")
	pass

#append random elements to the shoppers things to buy
func init_items():
	var offset_x = 0
	#for i in range(randi_range(6, 15)):
	for i in range(randi_range(1,2)):
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
		item.name = type

func init_customer():
	customer = pick_customer()
	if customer == null:
		new_day()
	else:
		var customer_info = get_information(customer)
		if customer != "joe":
			init_items()
			customers.remove_at(customers.find(customer))
			add_customer.emit(customer_info["Dialogue"])
		else:
			times_joe_seen+=1
			joe.emit()
			if times_joe_seen > day:
				customers.remove_at(customers.find(customer))
		get_node(customer).visible = true
	
func pick_customer():
	#Don't let joe be picked first
	if len(customers) == 6:
		return ["meat", "blue", "kid", "purple", "cart"].pick_random()
	if len(customers) == 1 and customers[0] == "joe" and times_joe_seen > 1:
		return null
	if len(customers) == 0:
		return null
	return customers.pick_random()
	
func make_invis():
	if customer != null:
		get_node(customer).visible = false
	
func get_information(name:String):
	var file = FileAccess.open("res://assets/customers.json", FileAccess.READ)
	var json = file.get_as_text()
	var data = JSON.parse_string(json)
	file.close()
	return data[name]
