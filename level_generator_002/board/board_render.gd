class_name BoardRender
extends Node


var board: Board

var maps: Map


var room_loader = preload("res://board/Room.tscn")

func _ready() -> void:
	maps = load("res://scene/map.tscn").instance()


func render():
	board = get_parent()
	
	build()


func build(target:Node= get_node(get_parent().target)):
	var size = Vector2.ONE * 600
	
	for x in board.board.size():
		for y in board.board[x].size():
			var cell = board.board[x][y]
			var new = room_loader.instance()
			if cell == 0:
				target.add_child(new)
				new.modulate = Color.black
				new.position = size * Vector2(x, y)
			else:
				
				var doors = check_config(Vector2(x, y))
#				print(doors)
				
				target.add_child(new)
				new.set_door(doors)
				new.position = size * Vector2(x, y)
				
				if board.first == Vector2(x, y):
					new.modulate = Color.green
				elif board.last == Vector2(x, y):
					new.modulate = Color.red
				
	
	
	pass

# TODO: go to new class
func get_paths() -> Array:
	var paths := []
	
	for x in board.size():
		for y in board[x].size():
			if board[x][y] == 1:
				paths.append(Vector2(x, y))
	
	return paths


# TODO: go to new class
func get_cellv(pos: Vector2):
	if not pos.x <= board.board.size()-1:
		return null
	
	if not pos.y <= board.board[pos.x].size()-1:
		return null
	
	return board.board[pos.x][pos.y]


func check_config(pos) -> Array:
	var name := [0, 0, 0, 0]
	name[0] = int(get_cellv(pos + Vector2.RIGHT) == 1)
	name[1] = int(get_cellv(pos + Vector2.DOWN) == 1)
	name[2] = int(get_cellv(pos + Vector2.LEFT) == 1)
	name[3] = int(get_cellv(pos + Vector2.UP) == 1)
	return name
