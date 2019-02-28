extends Node

enum FISH_TYPE { RED, BLUE, YELLOW, PIRANHA }

var score = 0 setget _set_score
var high_score = 0 setget _set_high_score

func _ready():
	_load_score_data()

func _exit_tree():
	_save_score_data()

func _set_score(value):
	score = value
	_set_high_score(value)

func _set_high_score(value):
	if value > high_score:
		high_score = value

func _load_score_data():
	var file = File.new()
	
	if not file.open("user://score.save", File.READ) == OK:
		print("user://score.save odes not exist")
		return
	
	var dict = parse_json(file.get_as_text())
	
	score = dict.last_score
	high_score = dict.high_score
	
	file.close()
	
func _save_score_data():
	var file = File.new()
	var dict = {}
	
	dict.high_score = high_score
	dict.last_score = score
	
	file.open("user://score.save", File.WRITE)
	file.store_string(to_json(dict))
	file.close()
