class_name BoardMaker extends Node

var cols := 0
var rows := 0
var pos := Vector2()

var board: Board

func create(origin = randi() % 2):
	
	board = get_parent()
	
	if origin == 0:
		create_path_width()
	else:
		create_path_height()
	
#	return board
	

func create_board():
	board.board.clear()
	# set board
	for x in cols:
		var xa = []
		for y in rows:
			xa.append(0)
		board.board.append(xa)


func set_to_board(pos, new):
	for x_index in board.board.size():
		
		var xa = board.board[x_index]
		if x_index == pos.x:
			
			for y_index in xa.size():
				if y_index == pos.y:
					board.board[x_index][y_index] = new
	
	# debug
#	for x in board:
#		print(x)
#
#	print('--------')


func create_path_width():
	cols = get_parent().size.x
	rows = get_parent().size.y
	
	create_board()
	
	print(board.first, ' ', get_parent().first)
	board.first = Vector2(randi() % cols, 0)
	print(board.first, ' ', get_parent().first)
	set_to_board(board.first, 1)
	pos = board.first
	
	var end = 0
	while end < rows-1:
		var move = randi() % 5
		
		match move:
			0, 1:
				if pos.x + 1 < cols:
					pos.x += 1
			2, 3:
				if pos.x - 1 >= 0:
					pos.x -= 1
			4:
				pos.y += 1
				end+=1
		
		set_to_board(pos, 1)
	
	board.last = pos

func create_path_height():
	cols = get_parent().size.y
	rows = get_parent().size.x
	
	create_board()
	
	board.first = Vector2(0, randi() % rows)
	set_to_board(board.first, 1)
	pos = board.first
	
	var end = 0
	while end < cols-1:
		var move = randi() % 5
		
		match move:
			0, 1:
				if pos.y + 1 < rows:
					pos.y += 1
			2, 3:
				if pos.y - 1 >= 0:
					pos.y -= 1
			4:
				pos.x += 1
				end+=1
		
		set_to_board(pos, 1)
	
	board.last = pos


func draw_board(tilemap: TileMap):
	
	for x in board.board.size():
		for y in board.board[x].size():
			tilemap.set_cellv(Vector2(x, y), board.board[x][y])
#			if board[x][y] == 1:

