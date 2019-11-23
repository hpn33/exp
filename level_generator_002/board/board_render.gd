class_name BoardRender
extends Node


var board: Board

var maps: Map
var path_line : Line2D




func _ready() -> void:
	maps = load("res://scene/map.tscn").instance()
	path_line = Line2D.new()


#func _process(delta: float) -> void:
#	print(name)

func render():
	board = get_parent()
	
	var target:Node= get_node(board.target)
	
	optimize_path()
	open_doors_in_path()
	
	draw_board(target)
	draw_line(target)


func draw_board(target:Node):
	
	
	var size = Vector2.ONE * 600
	
	for x in board.board.size():
		for y in board.board[x].size():
			
			var cell = board.board[x][y]
			
			target.add_child(cell)
			
			if board.first == Vector2(x, y):
				cell.modulate = Color.green
			elif board.last == Vector2(x, y):
				cell.modulate = Color.red
	
	
#
#	for i in board.path.size():
#

func optimize_path():
	
	var new_path := []
	
	new_path.append(board.path[0])
	for p in board.path:
		if new_path[new_path.size() - 1] != p:
			new_path.append(p)
	
	board.path = new_path

func open_doors_in_path():
	
	for index in board.path.size():
		var p_path: Vector2
		var c_path: Vector2
		var n_path: Vector2
		
		c_path = board.path[index]
		
		if index -1 >= 0:
			p_path = board.path[index-1]
		else:
			p_path = c_path
		
		if index+1 <= board.path.size()-1:
			n_path = board.path[index+1]
		else:
			n_path = c_path
		
		var cell = get_cellv(board.path[index])
		
		cell.set_door(p_path - c_path)
		cell.set_door(n_path - c_path)
#		print('------')
		


func draw_line(target):
	# show the paths
	for path in board.path:
		path_line.add_point((path*600)+Vector2(300,300))
	
	target.add_child(path_line)


# TODO: go to new class
#func get_paths() -> Array:
#	var paths := []
#
#	for x in board.size():
#		for y in board[x].size():
#			if board[x][y] == 1:
#				paths.append(Vector2(x, y))
#
#	return paths


# TODO: go to new class
func get_cellv(pos: Vector2):
	if not pos.x <= board.board.size()-1:
		return null
	
	if not pos.y <= board.board[pos.x].size()-1:
		return null
	
	return board.board[pos.x][pos.y]


#func check_config(pos) -> Array:
#	var name := [0, 0, 0, 0]
#	name[0] = int(get_cellv(pos + Vector2.RIGHT) == 1)
#	name[1] = int(get_cellv(pos + Vector2.DOWN) == 1)
#	name[2] = int(get_cellv(pos + Vector2.LEFT) == 1)
#	name[3] = int(get_cellv(pos + Vector2.UP) == 1)
#	return name


