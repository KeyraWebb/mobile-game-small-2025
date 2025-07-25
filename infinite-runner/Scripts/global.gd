## @tutorial: https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html

extends Node

var HighScore : int

#gets all relevant global data and puts it into json for saving
func saveGlobal():
	var saveDict = {
		"global" : true,
		"HighScore" : HighScore
	}
	return saveDict

func saveGame():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var data = saveGlobal()
	var json_string = JSON.stringify(data)
	save_file.store_line(json_string)
	
	
func loadGame():
	
	#if no save is found, create a new one with defaults
	if not FileAccess.file_exists("user://savegame.save"):
		HighScore = 0
		saveGame()
		return
	
	#open file
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var node_data = json.data
		
		#check if global
		if node_data["global"]:
			for i in node_data.keys():
				if i == "global":
					continue
				self.set(i, node_data[i])
		
