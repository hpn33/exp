extends Node2D

var rooms := {}

var top_room := []
var right_room := []
var bottom_room := []
var left_room := []

func _ready() -> void:
	
	rooms = {
		'n': u.factor(),
		
		't': u.factor(true),
		'tr': u.factor(true, true),
		'tb': u.factor(true, false, true),
		'tl': u.factor(true, false, false, true),
		'trb': u.factor(true, true, true),
		'trl': u.factor(true, true, false, true),
		'tbl': u.factor(true, false, true, true),
		'trbl': u.factor(true, true, true, true),
		
		'r': u.factor(false, true),
		'rb': u.factor(false, true, true),
		'rl': u.factor(false, true, false, true),
		'rbl': u.factor(false, true, true, true),
		
		'b': u.factor(false, false, true),
		'bl': u.factor(false, false, true, true),
		
		'l': u.factor(false, false, false, true)
	}
	
	set_list(top_room, 't')
	set_list(right_room, 'r')
	set_list(bottom_room, 'b')
	set_list(left_room, 'l')


func set_list(list, word):
	for k in rooms.keys():
		var key :String= k
		if key.find(word) != -1:
			list.append(rooms[key])
	
