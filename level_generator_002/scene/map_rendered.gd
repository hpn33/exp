class_name BoardRender
extends Node2D

var board

#var maps_loader = preload("res://scene/map.tscn")
var maps: Map


var room_loader = preload("res://blocks/Room.tscn")

func _ready() -> void:
	maps = load("res://scene/map.tscn").instance()


func render(board: Array, target):
	self.board = board
	
	build(target)
#	construct_with_path()
	pass
	


func build(target:Node):
	var size = Vector2.ONE * 600
	
	for x in board.size():
		for y in board[x].size():
			var cell = board[x][y]
			var new = room_loader.instance()
			if cell == 0:
				target.add_child(new)
				new.modulate = Color.black
				new.position = size * Vector2(x, y)
			else:
				var room_name = check_config(Vector2(x, y))
				var doors = maps.get_doors(room_name)
				print(doors)
				
				target.add_child(new)
				new.set_door(doors)
				new.position = size * Vector2(x, y)
	
	
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
	if not pos.x <= board.size()-1:
		return null
	
	if not pos.y <= board[pos.x].size()-1:
		return null
	
	return board[pos.x][pos.y]






func construct_with_path() -> void:
	var list_black_cell := get_paths()
	for tile in list_black_cell:
		draw_wall(tile)




func draw_wall(tile: Vector2, numb = 1):
	var choise := check_config(tile)
	
	var doors := maps.get_doors(choise)
	
	
#	var rx = tile.x * rect.size.x
#	var ry = tile.y * rect.size.y
	
#	for x in range(rect.position.x, rect.position.x + rect.size.x):
#		for y in range(rect.position.y, rect.position.y + rect.size.y):
#			var room = room_loader.instance()
#			add_child(room)
#			room.set_door(doors)
#			pass


func check_config(pos) -> String:
	var name := ""
	if get_cellv(pos + Vector2.RIGHT) == 1: name += "R"
	if get_cellv(pos + Vector2.DOWN) == 1: name += "D"
	if get_cellv(pos + Vector2.LEFT) == 1: name += "L"
	if get_cellv(pos + Vector2.UP) == 1: name += "U"
	return name

