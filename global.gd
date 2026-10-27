extends Node

var dayCounter = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not FileAccess.file_exists("user://savegame.json"):
		initialize_data()
	dayCounter = get_information("day")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func save_information(key:String, value):
	#For some reason READ_WRITE adds an extra curly bracket to the end
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	var json = file.get_as_text()
	var data:Dictionary = JSON.parse_string(json)
	file.close()
	
	if(!data.has(key)):
		print("ERROR: TRYING TO SAVE TO A VARIABLE THAT DOESN'T EXIST")
		return
		
	file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	data[key] = value
	json = JSON.stringify(data)
	file.store_string(json)
	file.close()

func get_information(key:String):
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	var json = file.get_as_text()
	var data = JSON.parse_string(json)
	file.close()
	
	if(!data.has(key)):
		print("ERROR: TRYING TO LOAD A VARIABLE THAT DOESN'T EXIST")
		return
	return data[key]

func initialize_data():
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	var data = {"day":1, "cutscene":false}
	var json = JSON.stringify(data)
	file.store_string(json)
	file.close()
	
