class_name Map extends Node2D


var list = {
	'RD': [1, 1, 0, 0],
	'RDL': [1, 1, 1, 0],
	'DL': [0, 1, 1, 0],
	'RDU': [1, 1, 0, 1],
	'RDLU': [1, 1, 1, 1],
	'DLU': [0, 1, 1 ,1],
	'RU': [1, 0, 0, 1],
	'RLU': [1, 0, 1, 1],
	'LU': [0, 0, 1, 1],
	
	'R': [1, 0, 0, 0],
	'L': [0, 0, 1, 0],
	'D': [0, 1, 0, 0],
	'U': [0, 0, 0, 1],
	
	'DU': [0, 1, 0, 1],
	'RL': [1, 0, 1, 0],
}

var lst = {
	'RD': Vector2(0, 0),
	'RDL': Vector2(11, 0),
	'DL': Vector2(22, 0),
	'RDU': Vector2(0, 11),
	'RDLU': Vector2(11, 11),
	'DLU': Vector2(22, 11),
	'RU': Vector2(0, 22),
	'RLU': Vector2(11, 22),
	'LU': Vector2(22, 22),
	
	'R': Vector2(33, 0),
	'L': Vector2(44, 0),
	'D': Vector2(33, 11),
	'U': Vector2(33, 22),
	
	'DU': Vector2(44, 11),
	'RL': Vector2(44, 22),
}


func get_rect(name: String) -> Rect2:
	var pos = lst[name]
	var rect:= Rect2()
	
	rect.position = pos
	rect.size = Vector2(10, 10)
	
	return rect

func get_doors(name: String)-> Array:
	return list[name]
