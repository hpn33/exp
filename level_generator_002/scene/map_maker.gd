class_name Board extends Node2D

export var width := 5
export var height := 5

var cols := 0
var rows := 0
var pos := Vector2()
var first := Vector2()
var last := Vector2()

var board := []
var size := Vector2()

func create_path(origin = randi() % 2):
	
	if origin == 0:
		create_path_width()
	else:
		create_path_height()
	

func create_board():
	# set board
	for x in cols:
		var xa = []
		for y in rows:
			xa.append(0)
		board.append(xa)
	
#	print(board)

func set_to_board(pos, new):
	for x_index in board.size():
		var xa = board[x_index]
		if x_index == pos.x:
			for y_index in xa.size():
				if y_index == pos.y:
					board[x_index][y_index] = new
	
	# debug
#	for x in board:
#		print(x)
#
#	print('--------')


func create_path_width():
	cols = width
	rows = height
	
	create_board()
	
	first = Vector2(randi() % cols, 0)
	set_to_board(first, 1)
	pos = first
	
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
	
	last = pos

func create_path_height():
	cols = height
	rows = width
	
	create_board()
	
	first = Vector2(0, randi() % rows)
	set_to_board(first, 1)
	pos = first
	
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
	
	last = pos


func draw_board(tilemap: TileMap):
	
	for x in board.size():
		for y in board[x].size():
			tilemap.set_cellv(Vector2(x, y), board[x][y])
#			if board[x][y] == 1:
	
	pass
