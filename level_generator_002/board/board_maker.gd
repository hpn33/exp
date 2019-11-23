class_name BoardMaker extends Node

var board: Board

func create(origin = randi() % 2):
	
	board = get_parent()
	
	if origin == 0:
		create_path_width()
	else:
		create_path_height()
	
#	create_room()


func create_board(cols, rows):
	
	board.clear()
	
	# set board
	for x in cols:
		var xa = []
		for y in rows:
			var room = board.room_ins.instance()
			room.pos = Vector2(x, y)
			xa.append(room)
		board.board.append(xa)


func set_to_board(pos):
	
	board.path.append(pos)
	
	for x_index in board.board.size():
		if x_index == pos.x:
			
			var xa = board.board[x_index]
			
			for y_index in xa.size():
				if y_index == pos.y:
					board.board[x_index][y_index].active = true
	
	# debug
#	for x in board:
#		print(x)
#
#	print('--------')


func create_path_width():
	create_path(board.size.x, board.size.y)

func create_path_height():
	create_path(board.size.y, board.size.x)

func create_path(cols: int, rows: int):
	var pos := Vector2()
	
	create_board(cols, rows)
	
	board.first = Vector2(randi() % cols, 0)
	pos = board.first
	set_to_board(pos)
	
	
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
		
		set_to_board(pos)
	
	board.last = pos


#func draw_board(tilemap: TileMap):
#
#	for x in board.board.size():
#		for y in board.board[x].size():
#			tilemap.set_cellv(Vector2(x, y), board.board[x][y])


